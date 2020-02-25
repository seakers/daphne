FROM openjdk:12
# EXPOSE 9191

WORKDIR /app

RUN yum update -y && \
    yum upgrade -y && \
    yum install git -y && \
    git clone https://github.com/seakers/data-mining.git


# COPY ./dockerfile_resources/ifeed-data-mining.jar /app/data-mining/.
COPY ../../dockerfile_resources/ifeed-data-mining.jar /app/data-mining/.


WORKDIR /app/data-mining
CMD java -jar ifeed-data-mining.jar

