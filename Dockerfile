FROM n8nio/n8n:latest

EXPOSE 3000

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD export N8N_PORT=$PORT && n8n start