#!/usr/bin/env bash

#script to update the ec2 instance public ip dynamically.
# PUBLIC_IP=$(`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
# && curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4)
# export PUBLIC_IP
# echo 'PUBLIC_IP'
# echo $PUBLIC_IP
# echo "$PUBLIC_IP"


# Stop and delete the containers
#docker-compose down

# Stop and delete the containers
docker compose stop 

# Deleting network if available
docker network rm spring-cloud-microservices

# Creating network for services
docker network create spring-cloud-microservices

# Increasing default HTTP Timeout from 60 to 300
export COMPOSE_HTTP_TIMEOUT=300

# Start all services in background with -d flag
docker compose up --build


