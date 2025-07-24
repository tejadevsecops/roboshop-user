#FROM            redhat/ubi9
#RUN             dnf module disable nodejs -y && dnf module enable nodejs:20 -y && dnf install nodejs -y
#RUN             dnf clean all
#RUN             mkdir /app
#RUN             useradd -d /app roboshop
#WORKDIR         /app
#RUN             chown roboshop:roboshop /app
#USER            roboshop
#COPY            package.json server.js /app/
#RUN             npm install
#COPY            run.sh /app
#ENTRYPOINT      ["bash", "/app/run.sh"]

FROM        node:20
RUN         mkdir /app
RUN         useradd -d /app roboshop
WORKDIR     /app
RUN         chown roboshop:roboshop /app
USER        roboshop
COPY        package.json server.js run.sh /app
RUN         npm install
ENTRYPOINT  ["bash", "/app/run.sh"]