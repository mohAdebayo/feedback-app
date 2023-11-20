FROM node:18-alpine as build

WORKDIR /app

COPY . /app

RUN yarn install

RUN yarn build

FROM nginx:1.25.3-alpine

COPY --from=build /app/build /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf



