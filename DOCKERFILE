
FROM openjdk:11-jdk



EXPOSE 18080/tcp
EXPOSE 5060/tcp
EXPOSE 5060/udp

WORKDIR /opt/wvp

COPY ./target/wvp-pro-*.jar /opt/wvp
COPY ./src/main/resources/application-docker.yml /opt/wvp/

CMD ["/bin/sh", "-c", "java  -jar ./wvp-pro-*.jar --spring.config.location=./application-docker.yml" ]