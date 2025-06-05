FROM openjdk:17-jdk-slim

# Spring Boot 임시 디렉토리 (선택사항)
VOLUME /tmp

# 환경변수 선언 (docker-compose가 .env에서 주입함)
ENV MONGODB_URI=""

# 애플리케이션 JAR 복사
COPY build/libs/*.jar app.jar

# 엔트리포인트: 환경변수 기반으로 MongoDB URI 전달
ENTRYPOINT ["sh", "-c", "java -Dspring.data.mongodb.uri=$MONGODB_URI -jar /app.jar"]
