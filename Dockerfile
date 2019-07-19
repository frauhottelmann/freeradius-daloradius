FROM frauhottelmann/docker-freeradius-daloradius

RUN sed -i '$ d' /cbs/init.sh
RUN sh /cbs/init.sh
RUN rm -f /etc/supervisor/conf.d/mysql.conf

RUN ln -s /etc/freeradius/3.0/sites-available/status /etc/freeradius/3.0/sites-enabled/status

COPY cbs/start.sh /cbs/start.sh

CMD ["sh", "/cbs/start.sh"]
