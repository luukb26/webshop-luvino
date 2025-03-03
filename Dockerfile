FROM node:latest as build
WORKDIR /app
COPY . .

RUN npm install

RUN npm run build --prod

FROM nginx:latest
COPY --from=build /app/dist/webshop-luvino /usr/share/nginx/html
EXPOSE 80
