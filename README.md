# n8n Workflow Automation Platform

This repository contains an n8n instance configured for workflow automation, designed to be deployed on Railway with persistent data storage.

## Overview

This is a self-hosted n8n instance that runs multiple automation workflows in a single container. The setup includes:

- **n8n workflow automation platform** (node:22-alpine based)
- **Persistent data storage** via the `data/` folder
- **Railway deployment ready** with proper port configuration
- **Multiple workflows** running in the same instance

## Project Structure

```
.
├── Dockerfile           # Main n8n instance container
├── data/               # Persistent storage for n8n (workflows, credentials, settings)
│   └── posts.json      # Example workflow data
└── migration-service/  # Additional services
    └── Dockerfile
```

## Data Persistence

The `data/` folder is used for n8n data persistence and is mounted to the container's `/data` directory. This folder contains:

- Workflow definitions
- Credentials (encrypted)
- Execution history
- Settings and configurations
- User data

This folder is exposed to the host machine to ensure data persists across container restarts and redeployments.

## Deployment on Railway

### Prerequisites

- Railway account ([https://railway.app/](https://railway.app/))
- This repository connected to Railway

### Setup Instructions

1. **Create a new project** in Railway
2. **Connect this repository** to your Railway project
3. **Configure environment variables** (if needed for specific workflows)
4. **Deploy** - Railway will automatically detect the Dockerfile and build the container
5. **Access n8n** via the generated Railway URL

Railway will automatically:
- Assign a PORT environment variable
- Handle HTTPS/SSL certificates
- Provide persistent volume storage

### Environment Variables

The container is configured to use Railway's dynamic `$PORT` variable. Additional environment variables can be set in Railway for:
- `N8N_BASIC_AUTH_ACTIVE` - Enable/disable basic auth
- `N8N_BASIC_AUTH_USER` - Username for basic auth
- `N8N_BASIC_AUTH_PASSWORD` - Password for basic auth
- Custom workflow-specific variables

## Local Development

To run n8n locally:

```bash
docker build -t n8n-workflows .
docker run -p 5678:5678 -v $(pwd)/data:/data n8n-workflows
```

Access n8n at `http://localhost:5678`

## Workflows

This instance hosts multiple automation workflows. Workflows can be:
- Created via the n8n web interface
- Imported from JSON files
- Managed through the n8n UI

Common workflow types:
- Content automation
- Data processing
- API integrations
- Scheduled tasks

## License

MIT