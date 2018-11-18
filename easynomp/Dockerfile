FROM debian:stretch
RUN apt update -y
RUN apt install -y python make g++ redis-server curl gnupg2 git
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs
RUN npm install -g pm2@latest
RUN pm2 init

RUN git clone https://github.com/leshacat/EasyNOMP
RUN cd EasyNOMP
RUN npm install
RUN pm2 init
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]