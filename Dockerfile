FROM node:5.4-slim
RUN npm install -g bower@1.7.2
# Used by bower for github packages
RUN apt-get update && apt-get install -y git
WORKDIR /source
ENTRYPOINT ["bower"]
