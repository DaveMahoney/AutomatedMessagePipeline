#!/bin/bash

echo "🔧 Starting Automated Message Function App Deployment..."

# Prompt user for inputs
read -p "Enter your project name (lowercase, no spaces): " project
read -p "Enter your desired Azure region (e.g., eastus, westus2): " location
read -p "Enter your SendGrid API Key: " sendgrid_key
read -p "Enter your logo file name (in branding/ folder, e.g., logo.png): " logo_filename

# Generate random suffix
rand=$(shuf -i 1000-9999 -n 1)

# Sanitize and trim project name to ensure valid storage account name
cleanProject=$(echo "$project" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')
storageBase=${cleanProject:0:16}  # Limit to 16 characters max
storage="${storageBase}${rand}"  # Final name: base + 4-digit suffix = max 20 chars

# Resource identifiers
resourceGroup="${cleanProject}-rg-${rand}"
functionApp="${cleanProject}-func-${rand}"
sku="Standard_LRS"
functionsVersion="4"
pythonVersion="3.9"

echo "📁 Creating resource group: $resourceGroup"
az group create --name $resourceGroup --location "$location"

echo "💾 Creating storage account: $storage"
az storage account create --name $storage --location "$location" --resource-group $resourceGroup --sku $sku

# Get connection string for upload
connection_string=$(az storage account show-connection-string --name $storage --resource-group $resourceGroup --query connectionString -o tsv)

# Enable static website (create $web container)
echo "🌐 Enabling static website hosting"
az storage blob service-properties update --account-name $storage --static-website --404-document 404.html --index-document index.html

# Upload logo if found
if [[ -f "branding/${logo_filename}" ]]; then
    echo "🖼️ Uploading logo to blob storage..."
    az storage blob upload --account-name $storage --container-name "\$web" --name $logo_filename --file "branding/${logo_filename}" --connection-string "$connection_string"
    logo_url="https://${storage}.z13.web.core.windows.net/${logo_filename}"
else
    echo "⚠️ Logo file branding/${logo_filename} not found. You can upload it manually later via the Azure Portal."
    logo_url="https://${storage}.z13.web.core.windows.net/default-logo.png"
fi

# Create Function App with staging slot
echo "🚀 Creating Function App: $functionApp"
az functionapp create --name $functionApp --storage-account $storage --consumption-plan-location "$location" \
  --resource-group $resourceGroup --os-type Linux --runtime python --runtime-version $pythonVersion --functions-version $functionsVersion

echo "🔁 Creating staging deployment slot"
az functionapp deployment slot create --name $functionApp --resource-group $resourceGroup --slot staging

# Set app settings
echo "⚙️ Configuring application settings"
az functionapp config appsettings set --name $functionApp --resource-group $resourceGroup --settings \
  "SENDGRID_API_KEY=$sendgrid_key" "LOGO_URL=$logo_url" "SCHEDULE_TIME_UTC=12:00"

echo "✅ Deployment complete!"
echo "Manage your Function App here: https://portal.azure.com/#resource/subscriptions/YOUR_SUBSCRIPTION_ID/resourceGroups/$resourceGroup/providers/Microsoft.Web/sites/$functionApp"
