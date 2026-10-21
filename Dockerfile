FROM node:18-alpine
WORKDIR /app
RUN apk add --no-cache python3 make g++
ENV npm_config_build_from_source=true \
    npm_config_nodedir=/usr/local
COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 3000
CMD ["npm", "start"]