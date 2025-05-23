#!/bin/bash
# Update system packages
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras enable nginx1
sudo yum clean metadata
sudo yum install -y nginx

# Enable and start Nginx service
sudo systemctl enable nginx
sudo systemctl start nginx

# Create a simple HTML page
cat <<EOF | sudo tee /usr/share/nginx/html/index.html
<html>
  <head><title>WebApp - ${HOSTNAME}</title></head>
  <body>
    <h1>Welcome to your NGINX-powered web app for staging!</h1>
    <p>Deployed from Terraform on instance: ${HOSTNAME}</p>
  </body>
</html>
EOF
