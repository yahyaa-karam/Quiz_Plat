# Build Java WAR avec Maven
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Deploy le WAR dans Tomcat
FROM tomcat:9.0
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/quizapp.war
