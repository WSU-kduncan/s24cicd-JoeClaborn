# Use the official Apache HTTP Server image
FROM httpd:latest

# Copy the website files into the Apache document root directory
COPY ./website/ /usr/local/apache2/htdocs/

# Expose port 8081 to the outside world
EXPOSE 8081

