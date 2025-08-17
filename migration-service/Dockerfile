FROM alpine:3.20

WORKDIR /tmp

RUN apk add --no-cache coreutils

# On startup: copy old data to new location, then keep container alive
CMD ["/bin/sh", "-c", "mkdir -p /home/node/.n8n && cp -r /data/* /home/node/.n8n/ || true && tail -f /dev/null"]
