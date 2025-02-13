# Use Node.js official image as base
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage caching
COPY package*.json ./

# Install Angular CLI globally and install project dependencies
RUN npm install -g @angular/cli && npm install

# Copy all project files
COPY . .

# Expose the ports for HTTP and HTTPS
EXPOSE 4200 443

# Default command: Open a shell (so you can run `ng serve` manually)
CMD ["/bin/sh"]
