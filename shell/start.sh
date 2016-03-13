#!/bin/sh
apt-get update -y
apt-get install git vim rsync nginx curl -y

add-apt-repository ppa:ondrej/php

sudo apt-get update -y

apt-get install -y php7.0 php7.0-fpm php7.0-cli php7.0-common php7.0-intl php7.0-json php7.0-mysql php7.0-gd php7.0-curl php7.0-mcrypt php7.0-dev

#php
cp /vagrant/configs/files/php.ini /etc/php/7.0/fpm/php.ini
cp /vagrant/configs/files/php.ini /etc/php/7.0/cli/php.ini

#composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
chmod 777 /usr/local/bin/composer

#autocomplete symfony
cp /vagrant/configs/files/symfony2-autocomplete.bash /etc/bash_completion.d/

echo "if [ -e /etc/bash_completion.d/symfony2-autocomplete.bash ]; then
          . /etc/bash_completion.d/symfony2-autocomplete.bash
      fi" >> ~/.bashrc

#ant
apt-get -y install ant
