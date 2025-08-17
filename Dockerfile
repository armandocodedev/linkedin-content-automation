FROM n8nio/n8n:latest

WORKDIR /home/node

USER root

RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    giflib-dev \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

USER node

ENV NODE_ENV=production
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=3000
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://${RAILWAY_STATIC_URL}
ENV N8N_EDITOR_BASE_URL=https://${RAILWAY_STATIC_URL}
ENV GENERIC_TIMEZONE=UTC
ENV N8N_LOG_LEVEL=info
ENV N8N_LOG_OUTPUT=console

HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:3000/healthz || exit 1

EXPOSE 3000

CMD ["n8n", "start"]