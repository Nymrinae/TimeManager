FROM node:latest

RUN apt-get update -y && apt-get install -y

RUN mkdir -p /usr/src/client
WORKDIR /usr/src/client

COPY . /usr/src/client
RUN npm install
RUN npm run build

EXPOSE 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD ["npm", "start"]
