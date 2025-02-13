#!/bin/sh

# Ensure SSL folder exists
mkdir -p /etc/nginx/ssl

# Generate SSL certs if not exist
if [ ! -f /etc/nginx/ssl/nginx-selfsigned.crt ]; then
    echo "Generating self-signed SSL certificate..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx-selfsigned.key \
        -out /etc/nginx/ssl/nginx-selfsigned.crt \
        -subj "/C=IN/ST=State/L=City/O=Company Name/OU=Org/CN=localhost"
fi

# Start Nginx
echo "Starting Nginx..."
exec nginx -g "daemon off;"
