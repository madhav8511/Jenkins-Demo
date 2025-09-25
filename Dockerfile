# Stage 1: Build the project with Maven
FROM maven:3.6.3-openjdk-17 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies first (faster builds)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the project (skip tests if you want)
RUN mvn clean package -DskipTests

# Stage 2: Run the application with Java 17
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the JAR built in Stage 1
COPY --from=build /app/target/Jenkins-1.0-SNAPSHOT.jar app.jar

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]