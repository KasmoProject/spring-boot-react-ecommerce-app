# Base Package
FROM node:14

MAINTAINER Ujjaval Desai

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ./client/package*.json ./

RUN npm install

# Bundle app source
COPY . .

#RUN yarn install

# Initiate npm start
CMD [ "npm", "run-script", "start_docker_dev" ]

# tried by sumana
# # Add a script to set the environment variable dynamically - Sumana
# COPY client/set-env.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/set-env.sh

# # Initiate npm start - changed by Sumana
# ENTRYPOINT ["/usr/local/bin/set-env.sh"]
# CMD ["npm", "run-script", "start_docker_dev"]




