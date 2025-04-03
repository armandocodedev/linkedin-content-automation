# LinkedIn Content Automation

![GitHub Actions Status](https://img.shields.io/github/actions/workflow/status/armandocodedev/linkedin-content-automation/linkedin-content.yml?label=content%20generation)

Automate LinkedIn content generation for your professional profile using GitHub Actions and Claude AI.

## What is This?

This repository contains a simple but effective GitHub Actions workflow that automatically generates professional LinkedIn posts focused on software testing and QA automation topics. It uses Claude AI to create engaging, technically accurate content that you can post manually to LinkedIn.

## Features

- **AI-Generated Content**: Uses Claude AI to create professional, engaging LinkedIn posts
- **QA/Testing Focus**: Specialized for QA Automation Engineers/Consultants
- **Scheduled Generation**: Automatically creates new content on a schedule
- **No Infrastructure Needed**: Leverages GitHub Actions for free, reliable automation
- **Complete Approval Control**: Review and edit content before posting
- **Version Control**: All content is tracked in your repository

## How It Works

1. The GitHub Actions workflow runs on a schedule (e.g., every Monday at 10am)
2. It randomly selects a QA/testing-related theme
3. Uses Claude AI to generate a professional LinkedIn post
4. Saves the post to your repository with metadata
5. You review the generated content and post it to LinkedIn manually

## Example Generated Content

Here's an example of what the generated content looks like:

```markdown
Just wrapped up a comprehensive API testing strategy overhaul at our Virtual Data Room platform that cut incident response time by 30%! 💪

When I joined as Senior SDET, I noticed our API tests were scattered across different frameworks and lacked proper monitoring. The team was spending too much time diagnosing production issues rather than preventing them.

Here's the approach that transformed our testing:

1️⃣ Created a unified REST Assured + Cucumber framework that standardized how we test APIs across the organization

2️⃣ Implemented contract testing with Pact to catch integration issues before deployment - this alone prevented 15+ potential production incidents last quarter

# ... rest of the post
```

## Getting Started

See the [SETUP.md](SETUP.md) file for detailed instructions on setting up this workflow in your repository.

## Customization

You can customize the content generation by:

- Changing the themes in the workflow file
- Modifying the Claude prompt to focus on different aspects
- Adjusting the schedule for content generation
- Adding email notifications for new content

## Future Enhancements

Future versions could include:
- Direct posting to LinkedIn via API
- Support for other social media platforms
- Content analytics tracking
- Topic selection based on trending themes

## License

This project is available under the MIT License. Feel free to modify and adapt it for your needs.

---

Built with ❤️ using [GitHub Actions](https://github.com/features/actions) and [Claude AI](https://www.anthropic.com/claude)