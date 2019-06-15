FROM 783872453/freeradius-daloradius

RUN sed -i '$ d' /cbs/init.sh
RUN sh /cbs/init.sh
