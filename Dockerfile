FROM python:3.8-alpine

ENV PATH="/scripts:${PATH}"

COPY ./unicorn_common-0.2.9.tar.gz /unicorn_common-0.2.9.tar.gz
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers mysql-client build-base mariadb-connector-c-dev 
#mariadb-dev 
RUN pip install -r /requirements.txt
RUN apk del .tmp

RUN mkdir /app
COPY ./data/app /app
WORKDIR /app
COPY ./data/scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

CMD ["entrypoint.sh"]
