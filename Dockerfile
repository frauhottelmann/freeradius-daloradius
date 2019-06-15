FROM 783872453/freeradius-daloradius

RUN sed -i '$ d' /cbs/init.sh
RUN sh /cbs/init.sh
RUN rm -f /etc/supervisor/conf.d/mysql.conf

COPY cbs/start.sh /cbs/start.sh

CMD ["sh", "/cbs/start.sh"]
