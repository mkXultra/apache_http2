# inside
curl --insecure -i --http2-prior-knowledge https://localhost:8443
curl --insecure -i --http2-prior-knowledge https://localhost:443
curl --insecure -i  http://localhost:443
curl http://localhost:443
curl --insecure -i http://localhost:80
# enter container
docker-compose exec apache bash

/etc/init.d/apache2 start
apachectl configtest

docker-compose build && docker-compose down && docker-compose up


/etc/apache2/sites-enabled/

chmod 777 /etc/apache2/sites-enabled/

# port check command
lsof -i:80   
netstat -nap
# port check command process name
lsof -c apache2 |grep TCP


apache2-foreground



# port check command process name
lsof -c apache2 |grep TCP

# make ssl key
openssl req -x509 -newkey rsa:2048 -nodes -sha256 -subj '/CN=localhost' \
  -keyout localhost-privkey.pem -out localhost-cert.pem