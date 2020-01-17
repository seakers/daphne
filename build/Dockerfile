FROM python:3.7

ENV USER=daphne
ENV PASSWORD=daphne
ENV DAPHNEVERSION=EOSS

ENV VASSAR=127.0.0.1
ENV DATAMINING=127.0.0.1
ENV REDIS=redis
ENV RABBITMQ=rabbitmq
ENV POSTGRES=postgres

# ---------- INSTALL TOOLS ----------
WORKDIR /installs
COPY ./build/tools/openjdk-12_linux-x64_bin.tar.gz /installs
COPY ./build/tools/apache-maven-3.6.3-bin.tar.gz   /installs
COPY ./build/tools/gradle-6.0-bin.zip              /installs
COPY ./build/tools/node-v12.13.1-linux-x64.tar.xz  /installs
RUN apt-get update -y                        && \
    apt-get upgrade -y                       && \
    apt-get install lsof -y                  && \
    tar xzvf openjdk-12_linux-x64_bin.tar.gz && \
    rm openjdk-12_linux-x64_bin.tar.gz

ENV JAVA_HOME="/installs/jdk-12"
ENV PATH="${JAVA_HOME}/bin:${PATH}"
RUN tar xzvf apache-maven-3.6.3-bin.tar.gz && \
    rm apache-maven-3.6.3-bin.tar.gz       && \
    unzip gradle-6.0-bin.zip               && \
    rm gradle-6.0-bin.zip                  && \
    tar xvf node-v12.13.1-linux-x64.tar.xz && \
    rm node-v12.13.1-linux-x64.tar.xz

ENV PATH="/installs/apache-maven-3.6.3/bin:${PATH}"
ENV PATH="/installs/gradle-6.0/bin:${PATH}"
ENV PATH="/installs/node-v12.13.1-linux-x64/bin:${PATH}"
RUN mkdir ~/.npm-global && \
    npm config set prefix '~/.npm-global'
ENV PATH="~/.npm-global/bin:${PATH}"

# ---------- DAPHNE ----------
WORKDIR /app/scripts
COPY ./build/scripts /app/scripts
RUN chmod 0755 -R . && \
    pip3 install supervisor

WORKDIR /etc/supervisor
COPY ./build/tools/supervisord.conf  /etc/supervisor
RUN mkdir /var/log/supervisor                 && \
    touch /var/log/supervisor/supervisord.log


WORKDIR /app/daphne
RUN chmod 0755 -R /app/scripts
ENTRYPOINT /bin/sh

















