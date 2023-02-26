FROM ubuntu/apache2

RUN apt-get update && apt-get install -y \
    curl \
    lsof net-tools  \
    vim 

RUN cd /etc/apache2/mods-enabled && ln -s ../mods-available/rewrite.load
RUN a2enmod rewrite
COPY ./resoures/000-default.conf /etc/apache2/sites-available/

COPY ./resoures/index.html /var/www/mysite.com/
RUN chmod 777 /var/www/mysite.com/index.html
RUN chmod 777 /etc/apache2/sites-enabled/000-default.conf
RUN a2ensite 000-default.conf

RUN a2dismod mpm_prefork
RUN a2enmod mpm_event
RUN a2enmod ssl
RUN a2enmod http2
RUN echo "Listen 8080" >> /etc/apache2/ports.conf
EXPOSE 8080