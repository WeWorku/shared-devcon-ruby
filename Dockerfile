FROM ruby:slim

LABEL version="0.1.0" maintainer="js4000all@gmail.com"
ENV LESSCHARSET=utf-8
WORKDIR /usr/src/app
COPY ./profile.d /etc/profile.d

RUN set -x &&\
    apt update &&\
    apt upgrade -y &&\
    apt install -y git vim curl sqlite3 build-essential &&\
    curl -fsSL https://deb.nodesource.com/setup_21.x | bash - &&\
    apt install -y nodejs &&\
    npm install --global yarn &&\
    adduser --disabled-password appuser
USER appuser
RUN set -x &&\
    gem install rails &&\
    rails shakapacker:install
WORKDIR /usr/src/app/
