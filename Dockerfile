FROM node:16

#Install NodeJS and CDK
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    software-properties-common \
    && npm install -g aws-cdk ts-node \
    && rm -rf /var/lib/apt/lists/*

#Install docker so we can find the network name as it is needed by 
#https://docs.docker.com/engine/install/debian/
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get -y update \
    && apt-get -y install docker-ce-cli

WORKDIR /app

ENTRYPOINT ["./entrypoint.sh"]