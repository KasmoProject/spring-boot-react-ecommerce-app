#!/bin/bash

echo "Starting set-env.sh script..."


TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Fetch the public IP using the metadata service token
PUBLIC_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ip)

echo "Public IP: $PUBLIC_IP"

# Export the public IP as environment variables
export REACT_APP_API_BASE_URL="http://$PUBLIC_IP:port"
export REACT_APP_AUTHENTICATION_SERVICE_URL="http://$PUBLIC_IP:7000"
export REACT_APP_COMMON_DATA_SERVICE_URL="http://$PUBLIC_IP:9000"
export REACT_APP_PAYMENT_SERVICE_URL="http://$PUBLIC_IP:9050"
export REACT_APP_SEARCH_SUGGESTION_SERVICE_URL="http://$PUBLIC_IP:10000"

# Ensure the target directory exists
mkdir -p /usr/src/app/client

# Write the environment variables to a .env file
cat <<EOF > /usr/src/app/client/.env
REACT_APP_STRIPE_PUBLISH_KEY=pk_test_5dsf4534jkmn4nm345QSQK0WjEJKx1PNH3mJxeUkA45345345Vcxyh5bDuulBildNrp3MWn005xEkAdJ4
REACT_APP_GOOGLE_AUTH_CLIENT_ID=357808142500-sdfsndln4oh5345435.apps.googleusercontent.com

# Dynamically set Public IP
REACT_APP_API_BASE_URL=http://$PUBLIC_IP:port

# Set ports
REACT_APP_AUTHENTICATION_SERVICE_PORT=7000
REACT_APP_PAYMENT_SERVICE_PORT=9050
REACT_APP_COMMON_DATA_SERVICE_PORT=9000
REACT_APP_SEARCH_SUGGESTION_SERVICE_PORT=10000
REACT_APP_COMMON_DATA_SERVICE_IP=$PUBLIC_IP

# Use Public IP in URLs
REACT_APP_AUTHENTICATION_SERVICE_URL=http://$PUBLIC_IP:7000
REACT_APP_COMMON_DATA_SERVICE_URL=http://$PUBLIC_IP:9000
REACT_APP_PAYMENT_SERVICE_URL=http://$PUBLIC_IP:9050
REACT_APP_SEARCH_SUGGESTION_SERVICE_URL=http://$PUBLIC_IP:10000

REACT_APP_ENVIRONMENT=<prod/dev>
EOF

echo "Environment variables written to /usr/src/app/client/.env"

# Execute the original command
exec "$@"
