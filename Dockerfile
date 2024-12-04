# Use official Nginx image as the base
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the website files into the Docker container
COPY ./index.html .

# Expose port 80 to the outside world
EXPOSE 80

# Run the Nginx server
CMD ["nginx", "-g", "daemon off;"]
