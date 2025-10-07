# Stage 1: Use Nginx to serve static files
FROM nginx:alpine

# Copy the built app (dist or build folder) to Nginx default folder
COPY dist/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

