FROM ubuntu:22.04

ENV TZ=UTC

RUN export LC_ALL=C.UTF-8
RUN DEBIAN_FRONTEND=noninteractive
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y \
    sudo \
    autoconf \
    autogen \
    language-pack-en-base \
    wget \
    zip \
    unzip \
    curl \
    rsync \
    ssh \
    openssh-client \
    git \
    build-essential \
    apt-utils \
    software-properties-common \
    nasm \
    libjpeg-dev \
    libpng-dev \
    libpng16-16

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# PHP
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y php8.2
RUN apt-get install -y \
    php8.2-cli \
    php8.2-fpm \
    php8.2-curl \
    php8.2-gd \
    php8.2-dev \
    php8.2-xml \
    php8.2-bcmath \
    php8.2-mysql \
    php8.2-pgsql \
    php8.2-zip \
    php8.2-bz2 \
    php8.2-sqlite \
    php8.2-soap \
    php8.2-intl \
    php8.2-imap \
    php8.2-imagick \
    php8.2-amqp \
    php8.2-xml \
    php8.2-mbstring \
    php8.2-memcached
RUN command -v php

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update
RUN command -v composer

# Node.js
RUN apt-get update && apt-get install -y ca-certificates curl gnupg
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && apt-get install nodejs -y
RUN npm install npm@10 -g
RUN command -v node
RUN command -v npm

# Other
RUN mkdir ~/.ssh
RUN touch ~/.ssh/config

# Git
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update -y
RUN apt-get install git -y

# Display versions installed
RUN php -v
RUN composer --version
RUN node -v
RUN npm -v
RUN git --version
