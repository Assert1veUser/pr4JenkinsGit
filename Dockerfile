FROM maven:3.8.4-openjdk-17 AS build

COPY . /app
WORKDIR /app

RUN mvn clean package

FROM openjdk:17-jdk-slim

COPY --from=build /app/target/*.jar /app/app.jar

ENV DATABASE_URL=jdbc:postgresql://cats-db-clswk:5432/cats_db_clswk
ENV SERVER_PORT=8090

CMD ["java", "-jar", "/app/app.jar"]

