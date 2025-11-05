# Normal method
#  FROM ubuntu

# RUN apt-get update
# RUN apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
# RUN apt-get upgrade -y
# RUN apt-get install -y nodejs
# # COPY SOURCE DESTINATION
# COPY package.json package.json
# COPY package-lock.json package-lock.json
# COPY index.js index.js

# RUN npm install

# ENTRYPOINT [ "node", "index.js" ]

# Simplified method and pin point to specific version
FROM node:18
# COPY SOURCE DESTINATION
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js

RUN npm install

ENTRYPOINT [ "node", "index.js" ]