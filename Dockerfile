FROM nginx:stable-alpine
COPY index.html /usr/share/nginx/html/index.html

## Step 1:
# Expose port 80
EXPOSE 80
