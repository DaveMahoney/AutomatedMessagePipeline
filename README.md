# 🚀 Automated Message Pipeline

This GitHub repository is a **template** for quickly deploying an automated email messaging system using Azure Functions, SendGrid, and GitHub CI/CD.

Use this template to:
- Create your own message automation project
- Deploy Azure infrastructure with a single command in the browser
- Manage staging and production slots with GitHub Actions
- Add branding with your own logo

---

## 🧭 How to Use This Template

### ✅ Step 1: Create Your Own Copy

Click the green button near the top right of this page:
> **Use this template** → **Create a new repository**

Give it a name like `my-daily-updates`, and choose **Private** if you prefer.

---

### 🚀 Step 2: Deploy Azure Resources in Cloud Shell

Once you’ve created your own copy:

1. Go to your new repo
2. Click this badge to launch Azure Cloud Shell in your browser:

[![Launch in Azure Cloud Shell](https://shell.azure.com/images/launchcloudshell.svg)](https://shell.azure.com)

3. In the Cloud Shell terminal, run:
```bash
curl -O https://raw.githubusercontent.com/YOUR-USERNAME/YOUR-NEW-REPO/main/scripts/deploy.sh
bash deploy.sh
```

4. Follow the prompts to:
   - Set your project name and region
   - Provide your SendGrid API key
   - Optionally upload a logo for your branded emails

---

## 📁 What You Get

Once deployed, your new environment includes:
- An Azure Function App with **production** and **staging** slots
- A storage account (used for static branding assets)
- CI/CD pipelines (GitHub Actions)
- Local folders to separate staging and production code
- A place to store branding assets (like `branding/logo.png`)
- Instructional docs for customizing your message logic

---

## 📖 Documentation

- `GETTING_STARTED.md`: How to deploy, test, and develop your message logic
- `DEPLOYMENT.md`: How CI/CD and slot promotion works
- `BRANDING.md`: How to upload and reference your logo

---

## 🧠 Notes for Developers

If you're building on this template:
- This repo is meant to be **used as a GitHub Template**
- The `azuredeploy.json` has been removed in favor of a **Cloud Shell-based CLI script** for more reliable deployment

---

© Cyberhawk Technology – Security | Strategy | Technoloy
