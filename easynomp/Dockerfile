FROM debian:stretch
apt update -y
apt install -y python make g++ redis-server curl gnupg2 git
curl -sL https://deb.nodesource.com/setup_8.x | bash -
apt install -y nodejs
npm install -g pm2@latest
pm2 init

git clone https://github.com/leshacat/EasyNOMP
cd EasyNOMP
npm install