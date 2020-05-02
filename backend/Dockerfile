FROM node:13-alpine
WORKDIR /home/node/app
COPY package*.json ./
RUN yarn install
COPY . .

CMD [ "node", "index.js" ]
