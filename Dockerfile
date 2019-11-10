FROM nginx
COPY src/index.html /app
COPY nginx.conf /etc/nginx/conf.d/
