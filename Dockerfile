#specify a space image
FROM node:14-alpine
#put the dev files in /usr/app directory
WORKDIR /usr/app

#install some dependencies 
COPY ./package.json ./
RUN npm install
COPY ./ ./

#Defalt command
CMD ["npm","start"]