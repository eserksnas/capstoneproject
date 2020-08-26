FROM nginx
COPY static-html-directory /usr/share/nginx/html

## Step 1:
# Expose port 80
EXPOSE 80
