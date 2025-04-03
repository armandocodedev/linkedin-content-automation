# LinkedIn Content Automation

This repository contains a GitHub Actions workflow that automatically generates professional LinkedIn posts for a QA Automation Consultant using Claude AI.

## How It Works

1. The workflow runs on a schedule (Monday at 10am) or can be triggered manually
2. It randomly selects a QA/testing-related theme
3. Uses Claude AI to generate a professional LinkedIn post
4. Saves the post in the repository under the `content` directory
5. The content can then be manually reviewed and posted to LinkedIn

## Setting Up

### Required Secret

This workflow requires a Claude API key. To set it up:

1. Sign up for an Anthropic API key at [https://console.anthropic.com/](https://console.anthropic.com/)
2. Go to this repository's Settings > Secrets and variables > Actions
3. Add a new repository secret named `CLAUDE_API_KEY` with your API key

### Testing the Workflow

1. After adding the API key, go to the Actions tab
2. Select the "LinkedIn Content Generation MVP" workflow
3. Click "Run workflow" > "Run workflow"
4. Monitor the workflow execution
5. Once complete, check the `content` directory for the generated post

## Usage

- The generated content will be saved as markdown files in the `content` directory
- Each file includes metadata and the generated post
- Copy the content and post it manually to LinkedIn
- You can modify the themes or prompt in the workflow file to customize the content

## Future Enhancements

- Email notifications when content is generated
- Automatic posting to LinkedIn
- Support for other social media platforms
- Content analytics tracking

## License

MIT