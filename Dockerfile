FROM nginx
WORKDIR /app
COPY src/index.html /app/
COPY nginx.conf /etc/nginx/conf.d/
