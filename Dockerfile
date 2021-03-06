FROM node:16

    EXPOSE 8080
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# install heartbeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-8.0.1-amd64.deb  && \
    dpkg -i heartbeat-8.0.1-amd64.deb

# Bundle app source
COPY . .

COPY --chown=root:heartbeat heartbeat.yml /etc/heartbeat/heartbeat.yml

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]