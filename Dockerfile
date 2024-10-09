FROM node:20-slim AS builder

WORKDIR /app
COPY public public
COPY src src
COPY package.json package.json
COPY index.html index.html
COPY tsconfig.json tsconfig.json
COPY vite.config.js vite.config.js


RUN npm install
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
