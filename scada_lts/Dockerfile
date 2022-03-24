FROM scadalts/scadalts:pr-2141 

ARG MYSQL_DATABASE=mysql
ARG MYSQL_USER=scada
ARG MYSQL_PASSWORD=scada

RUN apt update && apt install wait-for-it -y && \
    echo $MYSQL_DATABASE && \
    sed -e "s/root/${MYSQL_USER}/g" \
        -e "s/database/${MYSQL_DATABASE}/" \
        -i conf/context.xml
