# Use the official Apache HTTP Server image
FROM httpd:latest
# syntax=docker/dockerfile:1
FROM busybox:latest

# Copy the website files into the Apache document root directory
COPY ./website/ /usr/local/apache2/htdocs/

COPY --chmod=755 <<EOF /app/run.sh
#!/bin/sh
while true; do
  echo -ne "The time is now $(date +%T)\\r"
  sleep 1
done
EOF

ENTRYPOINT /app/run.sh

# Expose port 8081 to the outside world
EXPOSE 8081
