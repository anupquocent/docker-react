ghplA6iYE6x8Km0MNL4wNZAxqsUUg0N1h2jnz8R
FROM node:lts-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
