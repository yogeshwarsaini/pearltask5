FROM node:20-alpine

# Install dependencies
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    openssl

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies (Make sure sqlite is NOT in package.json)
RUN npm install

# Build admin panel
RUN npm run build

# Expose port
EXPOSE 1337

# Start app
CMD ["npm", "run", "start"]
