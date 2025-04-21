# Automated Message Pipeline

This repository is a template to help you deploy a serverless messaging pipeline using Azure Functions and GitHub Actions. It's ideal for sending automated emails on a schedule — such as newsletters, alerts, or custom updates.

---

## 🚀 Get Started

1. **Use this template** to create your own repository.
2. In your new repository, click the **"Deploy to Azure"** button below.
3. Fill in the project-specific parameters:
   - Project name
   - Schedule time (UTC)
   - SendGrid API key
   - Optional logo URL
4. Azure will deploy:
   - A Python Azure Function App
   - A staging deployment slot
   - CI/CD linked to your GitHub repo

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FDaveMahoney%2FAutomatedMessagePipeline%2Fmain%2FARMTemplate%2Fazuredeploy.json)

---

## 📁 What’s Included

- **ARM Template** to create Function App and deployment slot
- **CI/CD Pipelines** for staging and production
- **Folder structure** for Python-based timer-triggered Azure Function
- **Docs** to guide editing, testing, and promoting changes

See [`/docs/GETTING_STARTED.md`](./docs/GETTING_STARTED.md) for next steps after deployment.