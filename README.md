# Automated Message Pipeline

This project bootstraps a fully functional Azure Function App for sending automated messages, such as newsletters, digests, alerts, or summaries.

## 🚀 One-Click Deployment

Click the button below to deploy your own copy of this project to Azure:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FDaveMahoney%2FAutomatedMessagePipeline%2Fmain%2FARMTemplate%2Fazuredeploy.json)

## 📦 What Gets Deployed

- Azure Function App (Python)
- Timer-triggered automation
- Staging deployment slot
- SendGrid-compatible message sender
- CI/CD GitHub Actions workflow

## 🛠️ Required Setup After Deployment

1. Navigate to the deployed **Function App** in Azure.
2. Add the following **Application Settings** under Configuration:
   - `SENDGRID_API_KEY` = _your SendGrid API key_
3. Customize the function code or schedule from GitHub or Azure.
4. Optional: Hook into OpenAI, RSS feeds, or custom content.

## 📂 Folder Structure

```text
.
├── ARMTemplate/
│   ├── azuredeploy.json
│   └── azuredeploy.parameters.json
├── .github/workflows/
│   ├── deploy.yml
│   └── deploy-staging.yml
├── function/
│   ├── __init__.py
│   ├── function.json
│   ├── host.json
│   └── requirements.txt
└── README.md
```

---

© Dave Mahoney • Reuse welcome with credit
