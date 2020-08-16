# docker-compose example

### Spring Boot docker-compose example.

This docker-compose image has the configuration for two separate containers: one for Spring Boot application, another for Redis.

This application uses Redis as a caching service.

<br/>
<br/>

**Commands for Dockerfile:**

<br/>

##### 1. To build a Docker Image for the docker file:

`docker build -t abhisekyadav/spring-dockercompose .`

###### This command looks for the **Dockerfile** in present working directory.

##### 2. To create container out of the above built image:

`docker run -p 8080:8080 abhisekyadav/spring-dockercompose:latest`

<br/>
<br/>

**Commands for docker-compose.yml file:**

<br/>

##### 1. To build a Docker image using docker-compose.yml:

`docker-compose build`

###### This command will build the image with default tag. Below command to rename the tag:

`docker tag spring-dockercompose_web:latest abhisekyadav/spring-dockercompose:latest`


##### 2. To build a Docker image and run the container using docker-compose.yml:

`docker-compose up --build`

#####3. To stop the running container: 

`docker-compose down`





