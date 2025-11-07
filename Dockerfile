# Normal method
#  FROM ubuntu

# RUN apt-get update
# RUN apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_18.x | bASh -
# RUN apt-get upgrade -y
# RUN apt-get install -y nodejs
# # COPY SOURCE DESTINATION
# COPY package.json package.json
# COPY package-lock.json package-lock.json
# COPY index.js index.js

# RUN npm install

# ENTRYPOINT [ "node", "index.js" ]

# better code structure
# FROM ubuntu

# RUN apt-get update && apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_18.x | bASh -
# RUN apt-get upgrade -y
# RUN apt-get install -y nodejs

# # Execute in /app directory
# WORKDIR /app

# # Copy dependency files first
# COPY package*.json ./

# # Install deps
# RUN npm install

# # Copy rest of the code in /app
# COPY . .

# # /app/index.js
# ENTRYPOINT ["node", "index.js"]

# best practice - multi stage build

FROM node:18 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

FROM node:18 AS runner

WORKDIR /app/
COPY --from=build /app/ .

CMD [ "node", "index.js" ]