# Getting Started with Your Automated Message Pipeline

Congrats on deploying your pipeline! Here's how to customize and use it:

---

## 1. Edit Your Function Code

- Go to the `/function/AutomatedMessageTrigger/__init__.py` file.
- Replace the sample content with your own automation logic:
  - Fetch news
  - Format messages
  - Integrate OpenAI
  - Send emails via SendGrid

---

## 2. Push to Staging for Testing

- Any commit to the `main` branch deploys to the **staging** slot by default.
- This allows safe testing without disrupting production.

```bash
git add .
git commit -m "Test updated message logic"
git push origin main
```

---

## 3. Promote to Production

- You can promote your code from **staging to production** by running the GitHub Actions workflow:
  - Go to **Actions > Promote to Production**
  - Click **Run workflow**

---

## 4. Set Environment Variables (If Needed)

In Azure Portal:
- Go to your Function App > Configuration
- Add/update:
  - `SENDGRID_API_KEY`
  - `LOGO_URL`
  - Any custom config for your message pipeline

---

## 5. Monitor & Debug

- Use Application Insights (if enabled) for logs
- Check GitHub Actions for deployment success/failures
- Use the Azure Function App portal to view execution logs

---

Happy automating!