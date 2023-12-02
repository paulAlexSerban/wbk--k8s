FROM node:18.0-slim
COPY . .
RUN npm install -g pm2
RUN npm install
CMD [ "pm2-runtime", "index.js" ]
