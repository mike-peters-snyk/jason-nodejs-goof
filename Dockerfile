# FROM node:6-stretch
FROM node:18.20.8-alpine3.21

USER root
ENV SNYK_DEMO_API_KEY=hardcoded-for-demo-only

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

RUN chmod -R 777 /usr/src/goof /tmp/extracted_files
RUN apt-get update && apt-get install -y curl git vim
RUN curl -o /tmp/install.sh http://example.com/ && chmod +x /tmp/install.sh
RUN npm update
RUN npm install --unsafe-perm

EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]
