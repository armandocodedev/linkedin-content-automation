FROM n8nio/n8n:latest

EXPOSE 3000

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["n8n"]