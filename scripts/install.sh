#!/bin/bash

echo "Instalando Nginx..."
sudo apt update
sudo apt install nginx -y

echo "Criando diretório do site..."
sudo mkdir -p /var/www/piscesandroses
sudo cp -r website/* /var/www/piscesandroses/

sudo chown -R $USER:$USER /var/www/piscesandroses
sudo find /var/www/piscesandroses -type d -exec chmod 755 {} \;
sudo find /var/www/piscesandroses -type f -exec chmod 644 {} \;

echo "Configurando Virtual Host..."
sudo cp nginx/site.conf /etc/nginx/sites-available/piscesandroses
sudo ln -sf /etc/nginx/sites-available/piscesandroses /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

sudo nginx -t && sudo systemctl reload nginx
sudo systemctl enable nginx

echo "Instalação concluída!"