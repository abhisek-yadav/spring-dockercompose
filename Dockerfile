#FROM maven:3.6.0-alpine as builder

#COPY src /usr/app/src

#COPY pom.xml /usr/app

#RUN mvn -f /usr/app/pom.xml clean package

FROM openjdk:8-jdk-alpine

WORKDIR /usr/app

#COPY --from=builder ./usr/app/target/spring-dockercompose-0.0.1-SNAPSHOT.jar /usr/app/spring-dockercompose-0.0.1-SNAPSHOT.jar

COPY ./target/spring-dockercompose-0.0.1-SNAPSHOT.jar /usr/app/spring-dockercompose-0.0.1-SNAPSHOT.jar

CMD java -jar spring-dockercompose-0.0.1-SNAPSHOT.jar