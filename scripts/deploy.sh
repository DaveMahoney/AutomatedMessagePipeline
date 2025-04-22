#!/bin/bash

echo "🔧 Starting Automated Message Function App Deployment..."

# Prompt for required user inputs
read -p "Enter your project name (lowercase, no spaces): " projectName
read -p "Enter your desired Azure region (e.g., eastus, westus2): " location
read -p "Enter your SendGrid API Key: " sendGridApiKey
read -p "Enter your GitHub repo URL (e.g., https://github.com/username/repo): " gitRepo
read -p "Enter the GitHub branch to deploy from (e.g., main): " gitBranch

# Generate a unique suffix
suffix=$((RANDOM % 9000 + 1000))

# Prepare resource names
resourceGroup="${projectName}-rg-${suffix}"
storageAccount="${projectName//-/}"  # remove dashes
storageAccount="${storageAccount:0:16}${suffix}"
functionApp="${projectName}-func-${suffix}"
appInsights="${functionApp}"

# Create resource group
echo "📁 Creating resource group: $resourceGroup"
az group create --name "$resourceGroup" --location "$location"

# Create storage account
echo "💾 Creating storage account: $storageAccount"
az storage account create --name "$storageAccount" --location "$location" --resource-group "$resourceGroup" --sku Standard_LRS

# Create function app with consumption plan
echo "🚀 Creating Function App: $functionApp"
az functionapp create --name "$functionApp"   --storage-account "$storageAccount"   --consumption-plan-location "$location"   --resource-group "$resourceGroup"   --os-type Linux   --runtime python   --runtime-version 3.9   --functions-version 4

# Wait for Function App to be ready
echo "⏳ Waiting for Function App to become available..."
for i in {1..10}; do
  state=$(az functionapp show --name "$functionApp" --resource-group "$resourceGroup" --query "state" -o tsv)
  if [ "$state" == "Running" ]; then
    break
  fi
  sleep 5
done

# Configure app settings
echo "⚙️ Configuring application settings"
az functionapp config appsettings set --name "$functionApp" --resource-group "$resourceGroup" --settings   FUNCTIONS_WORKER_RUNTIME=python   FUNCTIONS_EXTENSION_VERSION=~4   SENDGRID_API_KEY="$sendGridApiKey"   SCHEDULE_TIME_UTC="12:00"

# Deploy from GitHub
echo "🔁 Linking Function App to GitHub repo: $gitRepo (branch: $gitBranch)"
az functionapp deployment source config --name "$functionApp" --resource-group "$resourceGroup"   --repo-url "$gitRepo" --branch "$gitBranch" --manual-integration

# Final message
echo "✅ Deployment complete!"
echo "Manage your Function App here:"
echo "https://portal.azure.com/#resource/subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/$resourceGroup/providers/Microsoft.Web/sites/$functionApp"
