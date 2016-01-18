FROM node:5.4-slim
RUN npm install -g bower@1.7.2
WORKDIR /source
ENTRYPOINT ["bower"]
