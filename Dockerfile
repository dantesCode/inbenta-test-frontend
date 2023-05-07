# Dockerfile
FROM node:16.15.0-alpine3.15

#create destination directory
RUN mkdir -p /frontend
WORKDIR /frontend

COPY package*.json /frontend/

#update and install dependency
RUN apk update && apk upgrade
RUN apk add git
RUN apk add python3

#copy the app, note .dockerignore
COPY . .
COPY . /frontend
RUN npm install

#build necessary, even if no static files are needed,
RUN node -v
RUN npm -v

CMD ["npm", "run", "dev"]