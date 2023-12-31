FROM node:16-alpine as builder
LABEL authors="Oleg"

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx:bookworm
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
