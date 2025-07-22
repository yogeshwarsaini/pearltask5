FROM node:20-alpine

# Install required packages
RUN apk add --no-cache libc6-compat python3 make g++ build-base

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

# 👇 Fix permissions
RUN chmod -R 777 /app

# 👇 Now build
RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
