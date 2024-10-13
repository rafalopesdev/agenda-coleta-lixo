
FROM maven:3.9.8-eclipse-temurin-21 AS build

COPY C:/Users/BRibeirodefreitas/agenda-coleta-lixo /app

WORKDIR /app

RUN mvn clean package

FROM eclipse-temurin:21-jre-alpine

COPY . /opt/app

WORKDIR /app

ENV PROFILE=prd

EXPOSE 8080

ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILE}", "-jar", "app.jar"]
