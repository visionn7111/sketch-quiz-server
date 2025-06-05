FROM openjdk:17-jdk-slim
VOLUME /tmp

ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

# 빌드 시점에 ARG로 환경변수 받기 (필요 시)
ARG MONGODB_URI

ENTRYPOINT ["sh", "-c", "java -Dspring.data.mongodb.uri=${MONGODB_URI} -jar /app.jar"]
