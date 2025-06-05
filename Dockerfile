FROM openjdk:17-jdk-slim
VOLUME /tmp

ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

ENV MONGODB_URI=${MONGODB_URI}

ENTRYPOINT ["sh", "-c", "java -Dspring.data.mongodb.uri=$MONGODB_URI -jar /app.jar"]
