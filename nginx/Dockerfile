FROM docker.pkg.github.com/opendata-mvcr/react-nginx/react-nginx:latest
# Run config check script on the container startup
COPY config_check.sh /docker-entrypoint.d/
# Provide improved nginx configuration
COPY nginx.conf /etc/nginx/
