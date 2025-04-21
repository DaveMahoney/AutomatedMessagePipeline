# Automated Message Pipeline

This repository provides a complete Azure-based solution for deploying an automated, scheduled message distribution pipeline using Azure Functions and GitHub Actions.

## 🚀 Deploy to Azure

Click the button below to launch the entire infrastructure in your Azure subscription. You’ll be prompted to input:

- A project name
- Message schedule time (24-hour UTC format)
- SendGrid API key (securely stored)
- Logo URL for email formatting

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FDaveMahoney%2FAutomatedMessagePipeline%2Fmain%2FARMTemplate%2Fazuredeploy.json)

## 📁 Folder Structure

```
AutomatedMessagePipeline/
├── function/
│   ├── AutomatedMessageTrigger/
│   │   ├── __init__.py
│   │   └── function.json
│   ├── host.json
│   └── requirements.txt
├── ARMTemplate/
│   ├── azuredeploy.json
│   └── azuredeploy.parameters.json
├── .github/
│   └── workflows/
│       ├── deploy.yml
│       └── deploy-staging.yml
└── README.md
```

## 🧪 Customize After Deployment

Once deployed, you can:

- Modify email format in `__init__.py`
- Change news or data sources
- Add OpenAI summarization logic
- Extend integration with other APIs

Enjoy your automated message pipeline.