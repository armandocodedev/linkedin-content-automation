FROM alpine:3.20

WORKDIR /tmp

RUN apk add --no-cache coreutils

# Copy data from /data to /home/node/.n8n on startup
CMD mkdir -p /home/node/.n8n && cp -r /data/* /home/node/.n8n/ || true && sleep infinity
