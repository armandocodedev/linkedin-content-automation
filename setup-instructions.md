# Setting Up LinkedIn Content Automation

Follow these steps to set up the LinkedIn content automation workflow:

## Step 1: Create Workflow Directory

Create the following directory structure:
```
.github/workflows/
```

## Step 2: Create Workflow File

Create a file named `.github/workflows/linkedin-content.yml` with the following content:

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
      
      - name: Select content theme
        id: theme
        run: |
          # Define themes - focused selection for initial testing
          THEMES=("Automation Framework Design" "API Testing Strategy" "CI/CD for Testing" "Playwright Best Practices" "Test Case Management")
          SELECTED_THEME=${THEMES[$RANDOM % ${#THEMES[@]}]}
          echo "theme=$SELECTED_THEME" >> $GITHUB_OUTPUT
      
      - name: Generate LinkedIn content with Claude
        id: generate
        run: |
          RESPONSE=$(curl -s https://api.anthropic.com/v1/messages \
            -H "x-api-key: ${{ secrets.CLAUDE_API_KEY }}" \
            -H "anthropic-version: 2023-06-01" \
            -H "content-type: application/json" \
            -d '{
              "model": "claude-3-haiku-20240307",
              "max_tokens": 1024,
              "messages": [
                {
                  "role": "user",
                  "content": "Create a LinkedIn post about ${{ steps.theme.outputs.theme }} that highlights expertise as a QA Automation Consultant. Include specific examples from experience as a Senior SDET at a Virtual Data Room Provider. Keep it under 1300 characters and include 3-5 relevant hashtags. The post should be professional but conversational."
                }
              ]
            }')
          
          # Extract content and escape for GitHub Actions
          CONTENT=$(echo "$RESPONSE" | jq -r '.content[0].text' | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')
          echo "content<<EOF" >> $GITHUB_OUTPUT
          echo "$CONTENT" >> $GITHUB_OUTPUT
          echo "EOF" >> $GITHUB_OUTPUT
      
      - name: Store content in repository
        run: |
          # Create a simple content directory if it doesn't exist
          mkdir -p content
          
          # Create a file with today's date
          FILENAME="content/$(date +%Y-%m-%d)-linkedin-post.md"
          
          # Write content to file with minimal metadata
          echo "---" > $FILENAME
          echo "theme: ${{ steps.theme.outputs.theme }}" >> $FILENAME
          echo "date: $(date +%Y-%m-%d)" >> $FILENAME
          echo "status: ready" >> $FILENAME
          echo "---" >> $FILENAME
          echo "" >> $FILENAME
          echo "${{ steps.generate.outputs.content }}" >> $FILENAME
          
          # Commit the file to the repository
          git config user.name "GitHub Actions Bot"
          git config user.email "actions@github.com"
          git add $FILENAME
          git commit -m "Generated LinkedIn post for $(date +%Y-%m-%d)"
          git push
      
      - name: Output content
        run: |
          echo "Successfully generated LinkedIn post on ${{ steps.theme.outputs.theme }}"
          echo "Content is saved in the repository under the content directory"
          echo "Check the latest commit to view the generated content"
```

## Step 3: Add Claude API Key

1. Sign up for an Anthropic API key at [https://console.anthropic.com/](https://console.anthropic.com/)
2. Go to this repository's Settings > Secrets and variables > Actions
3. Add a new repository secret named `CLAUDE_API_KEY` with your API key

## Step 4: Enable GitHub Actions

1. Go to the "Actions" tab in your repository
2. Click "I understand my workflows, go ahead and enable them"

## Step 5: Test the Workflow

1. Go to the Actions tab
2. Select the "LinkedIn Content Generation MVP" workflow
3. Click "Run workflow" > "Run workflow"
4. Monitor the workflow execution
5. Once complete, check the `content` directory for the generated post

## Troubleshooting

If you encounter any issues:
- Make sure your CLAUDE_API_KEY is correctly set in repository secrets
- Check the workflow logs for any error messages
- Verify that GitHub Actions is enabled for the repository