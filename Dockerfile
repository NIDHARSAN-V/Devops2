FROM maven:3.8.5-openjdk-11-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build /app/target/todolist.war /usr/local/tomcat/webapps/
