FROM node:24-alpine3.21 as builder

WORKDIR /app

COPY ./package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx:1.29.1-alpine
COPY --from=builder /app/build /usr/share/nginx/html