FROM 783872453/freeradius-daloradius

RUN sed -i '$ d' /cbs/init.sh
RUN sh /cbs/init.sh
RUN rm -f /etc/supervisor/conf.d/mysql.conf

RUN sed -i 's|User-Password|Cleartext-Password|' /var/www/html/daloradius/mng-batch-add.php

COPY cbs/start.sh /cbs/start.sh

CMD ["sh", "/cbs/start.sh"]
