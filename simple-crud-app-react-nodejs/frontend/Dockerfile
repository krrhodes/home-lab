# Stage 1: Build Node.js app
FROM node:12.2.0-alpine AS build
WORKDIR /app
COPY . .
COPY src .
COPY package.json .
RUN npm install
RUN npm run build

# Stage 2: Serve app with Nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
