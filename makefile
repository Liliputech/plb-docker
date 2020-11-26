OWN=chown
NEW=touch
DC=docker-compose
DE=docker exec
B=build
LOCAL=.env.local
VAR=/var/www
WWW=www-data
EXEC=install

all: $(EXEC)

install : initialisation

initialisation : dockerup
	$(DE) -it php.plb bash -c 'zcat ./data/planningb_1911_utf8.sql.gz | mysql -h mariadb.plb -uroot -pbiblibre planningbiblio'
	$(DE) -it mariadb.plb mysql -uroot -pbiblibre planningbiblio -e 'update personnel set password=md5("test") where id=1'

dockerup : docker 
	$(DC) up -d 

docker : adduser
	$(DC) $(B)

adduser :
	sudo usermod -aG docker $$USER
