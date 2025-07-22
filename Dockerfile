FROM node:20-alpine

# Install required packages
RUN apk add --no-cache libc6-compat python3 make g++ build-base

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
