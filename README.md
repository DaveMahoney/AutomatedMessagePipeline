# Automated Message Pipeline

This project deploys a serverless Azure Function App and staging environment for sending automated messages — newsletters, alerts, summaries, and more — on a recurring schedule.

## 🚀 One-Click Deployment

Click below to deploy the full environment to your Azure subscription:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FDaveMahoney%2FAutomatedMessagePipeline%2Fmain%2FARMTemplate%2Fazuredeploy.json)

### 📝 During deployment, you'll be asked for:
- **Project Name**: Used to name the Function App and resources.
- **Send Time**: Daily send time (24-hour UTC format like `13:00`).
- **SendGrid API Key**: Required to send outgoing emails.
- **Logo URL**: Optional image to brand your email content.

## 📦 What Gets Deployed

- Azure Function App with Python runtime
- Timer trigger for daily automation
- Staging deployment slot for safe updates
- GitHub Actions CI/CD linked to this repo
- Application Settings for schedule, API key, and logo

## 🔧 Customizing Your Function

Once deployed:
- Open `/function/AutomatedMessageTrigger/__init__.py`
- Add your content logic, news fetching, or OpenAI summarization
- Commit changes to `main` or `staging` branches to auto-deploy

---

© Dave Mahoney • MIT License
