#!/bin/sh
# wait-for-mariadb.sh

set -e

until mysql -hmariadb.plb -uroot -pbiblibre planningbiblio -e 'quit'; do
  >&2 echo "MariaDb is unavailable - sleeping"
  sleep 1
done

>&2 echo "MariaDb is up - executing command"
zcat ./data/planningb_1911_utf8.sql.gz | mysql -hmariadb.plb -uroot -pbiblibre planningbiblio
mysql -hmariadb.plb -uroot -pbiblibre planningbiblio -e 'update personnel set password=md5("test") where id=1'
