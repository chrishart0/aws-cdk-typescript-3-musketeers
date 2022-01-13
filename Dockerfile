FROM node:16

#Install NodeJS and CDK
RUN apt-get update && apt-get install -y \
    make \
    software-properties-common \
    && npm install -g aws-cdk ts-node \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
