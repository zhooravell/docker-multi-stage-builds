### STAGE 1: Develop ###
FROM node:11.14.0-alpine as develop

USER node

RUN mkdir /home/node/.npm-global && mkdir /home/node/logs

ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV HOME=/home/node

WORKDIR $HOME/app

RUN npm i -g npm

RUN npm install -g @angular/cli && npm cache clean --force

EXPOSE 4200

CMD [ "node" ]

### STAGE 2: Build ###
FROM develop as builder

USER root

COPY app .

RUN npm install && ng build --prod --output-path=dist

### STAGE 3: Setup ###
FROM nginx:1.15.12-alpine
# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
# From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=builder /home/node/app/dist /usr/share/nginx/html