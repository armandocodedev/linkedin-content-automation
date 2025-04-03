# Setting Up LinkedIn Content Automation

This guide walks you through setting up the GitHub Actions workflow for LinkedIn content automation.

## Step 1: Create Required Directories

First, you need to create the proper directory structure for GitHub Actions:

1. In your repository, create a directory named `.github`
2. Inside the `.github` directory, create a directory named `workflows`

## Step 2: Create the Workflow File

1. Inside the `.github/workflows` directory, create a file named `linkedin-content.yml`
2. Copy the content from the `linkedin-workflow.yml` file in this repository into your new file

The workflow file should look like:

```yaml
name: LinkedIn Content Generation MVP

on:
  # Run once a week to start (Monday at 10am)
  schedule:
    - cron: '0 10 * * 1'
  # Allow manual triggering for testing
  workflow_dispatch:

jobs:
  generate-content:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      # Rest of the workflow steps...
```

## Step 3: Set Up Claude API Key

1. Sign up for an Anthropic API key at [https://console.anthropic.com/](https://console.anthropic.com/)
2. In your GitHub repository, go to Settings > Secrets and variables > Actions
3. Click "New repository secret"
4. Add a secret with the name `CLAUDE_API_KEY` and paste your API key as the value
5. Click "Add secret"

## Step 4: Enable GitHub Actions

1. Go to the "Actions" tab in your repository
2. Click "I understand my workflows, go ahead and enable them"

## Step 5: Test the Workflow

1. Go to the Actions tab
2. Select the "LinkedIn Content Generation MVP" workflow
3. Click "Run workflow" > "Run workflow"
4. Monitor the workflow execution
5. Once complete, check the `content` directory for the generated post

## Understanding the Generated Content

The workflow creates LinkedIn post content in markdown files with this structure:

```markdown
---
theme: API Testing Strategy
date: 2025-04-02
status: ready
---

[The generated LinkedIn post content will appear here]
```

You can then copy the content and post it manually to LinkedIn.

## Customizing the Content

To customize the generated content:

1. Edit the workflow file (`.github/workflows/linkedin-content.yml`)
2. Modify the themes array to include your preferred topics
3. Adjust the Claude prompt to focus on different aspects of your expertise

## Troubleshooting

If you encounter any issues:
- Check that your Claude API key is correctly set in repository secrets
- Verify that GitHub Actions is enabled for your repository
- Look at the workflow logs for specific error messages

For an example of what the generated content looks like, see the `content/example-linkedin-post.md` file in this repository.