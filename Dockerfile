FROM maven:3.9-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn -B clean package -DskipTests \
    && cp target/*.war /app/campus-connect.war

FROM tomcat:9.0-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/campus-connect.war \
    /usr/local/tomcat/webapps/campus-connect.war

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
