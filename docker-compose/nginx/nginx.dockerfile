# Use the latest Nginx image
FROM nginx:latest

# Set working directory inside the container
WORKDIR /usr/share/nginx/html

# Remove default Nginx HTML files
RUN rm -rf ./*

# Copy Nginx configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Use the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
