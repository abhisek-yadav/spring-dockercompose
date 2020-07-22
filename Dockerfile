#FROM maven:3.6.0-alpine as builder

#COPY src /usr/app/src

#COPY pom.xml /usr/app

#RUN mvn -f /usr/app/pom.xml clean package

FROM openjdk:8-jdk-alpine

WORKDIR /usr/app

#COPY --from=builder ./usr/app/target/spring-dockercompose-example-0.0.1-SNAPSHOT.jar /usr/app/spring-dockercompose-example-0.0.1-SNAPSHOT.jar

COPY ./target/spring-dockercompose-example-0.0.1-SNAPSHOT.jar /usr/app/spring-dockercompose-example-0.0.1-SNAPSHOT.jar

CMD java -jar spring-dockercompose-example-0.0.1-SNAPSHOT.jar

# To build an Docker Image for this docker file: docker build -t abhisek-yadav/spring-dockercompose-example .

# To create container out of this image:  docker run -p 8080:8080 abhisek-yadav/spring-dockercompose-example:latest

# To run using docker-compose.yml: docker-compose up --build

# To stop container: docker-compose down
