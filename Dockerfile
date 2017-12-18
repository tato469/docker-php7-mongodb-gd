FROM php:7-apache
MAINTAINER Fernando Valle <fernandovalle.developer@gmail.com>


RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
	libxpm-dev \
	libvpx-dev \
    libssl-dev \
    libbz2-dev \
    libssl-dev \
    libmemcached-dev \
    && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN pecl install mongodb \
    && docker-php-ext-enable mongodb


RUN docker-php-ext-configure gd \
	--with-freetype-dir=/usr/lib/x86_64-linux-gnu/ \
	--with-jpeg-dir=/usr/lib/x86_64-linux-gnu/ \
	--with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
	--with-vpx-dir=/usr/lib/x86_64-linux-gnu/ 

RUN docker-php-ext-install \
	bcmath \
	bz2 \
	exif \
	ftp \
	gd \
	gettext \
	mbstring \
	opcache \
	shmop \
	sockets \
	sysvmsg \
	sysvsem \
	sysvshm \
	zip

RUN a2enmod rewrite