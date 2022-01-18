FROM python:3.8

ENV USER=daphne
ENV PASSWORD=daphne
ENV DAPHNEVERSION=EOSS

ENV VASSAR_HOST=127.0.0.1
ENV VASSAR_PORT=9090

ENV DATAMINING_HOST=127.0.0.1
ENV DATAMINING_PORT=9191

ENV REDIS_HOST=redis
ENV REDIS_PORT=6379

ENV RABBITMQ_HOST=rabbitmq

ENV POSTGRES_HOST=postgres
ENV POSTGRES_PORT=5432

ENV NEO4J_HOST=neo4j
ENV NEO4J_PORT=7687
ENV NEO4J_USER=neo4j
ENV NEO4J_PASSWORD=test

# ---------- INSTALL TOOLS ----------
WORKDIR /installs
# RUN 
RUN apt-get update -y                        && \
    apt-get upgrade -y                       && \
    apt-get install apt-utils -y             && \
    apt-get install lsof -y                  && \
    apt-get install default-jdk -y           && \
    apt-get install maven -y
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs

WORKDIR /app/java_libs
COPY ./build/jars/jess.jar /app/java_libs

# ---------- DAPHNE ----------
WORKDIR /app/scripts
COPY ./build/scripts /app/scripts
RUN chmod 0755 -R . && \
    pip3 install supervisor gunicorn

WORKDIR /etc/supervisor
COPY ./build/tools/supervisord.conf  /etc/supervisor
RUN mkdir /var/log/supervisor                 && \
    touch /var/log/supervisor/supervisord.log

WORKDIR /app/logs

WORKDIR /app/daphne
RUN chmod 0755 -R /app/scripts
ENTRYPOINT /bin/bash

















