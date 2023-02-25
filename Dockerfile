FROM ubuntu/apache2
# FROM php:8.1-apache


RUN apt-get update && apt-get install -y \
    curl \
    lsof net-tools  \
    vim 

RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/rewrite.load
RUN a2enmod rewrite
# COPY ./resoures/000-default.conf /etc/apache2/sites-enabled/
COPY ./resoures/000-default.conf /etc/apache2/sites-available/
# COPY ./resoures/000-default.conf /etc/apache2/sites-available/mysite.com.conf
# RUN a2ensite mysite.com.conf
# RUN a2dissite 000-default.conf

COPY ./resoures/index.html /var/www/mysite.com/
# RUN apache2ctl configtest
RUN chmod 777 /var/www/mysite.com/index.html
RUN chmod 777 /etc/apache2/sites-enabled/000-default.conf
RUN a2ensite 000-default.conf

# ENTRYPOINT [ "bash" ]


# COPY ./resoures/000-default.conf /etc/apache2/sites-available/mysite.com.conf
RUN a2dismod mpm_prefork
RUN a2enmod mpm_event
RUN a2enmod ssl
RUN a2enmod http2
RUN echo "Listen 8080" >> /etc/apache2/ports.conf
# copy local cert
COPY ./localhost-cert.pem /etc/ssl/certs/mycert.crt
COPY ./localhost-privkey.pem /etc/ssl/private/mycert.key
EXPOSE 8080
# ENTRYPOINT [ "bash" ]