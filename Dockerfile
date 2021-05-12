#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
RUN useradd -l -m -u 1000840000 non-root \
    && groupmod --gid 1000840000 non-root
 

USER non-root
WORKDIR /home/non-root

COPY src /home/non-root/src
COPY pom.xml /home/non-root
RUN mvn -Dmaven.test.skip -f /home/non-root/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
RUN useradd -l -m -u 1000840000 non-root \
    && groupmod --gid 1000840000 non-root
 

USER non-root
WORKDIR /home/non-root
COPY --from=build /home/non-root/target/springboot2-jpa-crud-example-0.0.1-SNAPSHOT.jar /home/non-root/demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/home/non-root/demo.jar"]