# Stage build
FROM maven:3.8.8-eclipse-temurin-11 as build

# Main folder in container
WORKDIR /app

# Copy all resources to container /app
COPY . .

# Use maven build file JAR
RUN mvn clean package -DskipTests

# Stage runtime
FROM adoptopenjdk/openjdk11:alpine-jre

# Main folder in container
WORKDIR /app

# Copy file JAR from stage build to stage runtime
COPY --from=build /app/target/*.jar /app/danny-store-1.0-SNAPSHOT.jar

# Run service
ENTRYPOINT ["java", "-jar", "/app/danny-store-1.0-SNAPSHOT.jar"]
