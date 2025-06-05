FROM openjdk:17-jdk-slim

VOLUME /tmp

ENV MONGODB_URI=""

# 현재 디렉토리에 있는 app.jar 복사
COPY app.jar /app.jar

# ENTRYPOINT에서 환경변수 주입
ENTRYPOINT ["sh", "-c", "java -Dspring.data.mongodb.uri=$MONGODB_URI -jar /app.jar"]
