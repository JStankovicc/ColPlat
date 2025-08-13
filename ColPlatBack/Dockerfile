# Multi-stage build za optimizaciju
FROM openjdk:17-jdk-alpine as builder

# Postavljamo radni direktorijum
WORKDIR /app

# Kopiramo Maven wrapper i pom.xml prvo (za cache-ovanje dependencies)
COPY mvnw .
COPY mvnw.cmd .
COPY pom.xml .
COPY .mvn .mvn

# Dajemo dozvole za izvršavanje Maven wrapper-a
RUN chmod +x ./mvnw

# Preuzimamo dependencies (ovo će biti cache-ovano)
RUN ./mvnw dependency:go-offline -B

# Kopiramo source kod
COPY src ./src

# Buildujemo aplikaciju (preskačemo testove za brzinu)
RUN ./mvnw clean package -DskipTests -B

# Production stage
FROM openjdk:17-jre-alpine

# Instaliramo curl i netcat za health check
RUN apk add --no-cache curl netcat-openbsd

# Postavljamo radni direktorijum
WORKDIR /app

# Kopiramo JAR iz builder stage-a
COPY --from=builder /app/target/Backend-0.0.1-SNAPSHOT.jar app.jar

# Ekspozujemo port 8080
EXPOSE 8080

# Pokretamo aplikaciju sa Docker profile
CMD ["java", "-jar", "-Dspring.profiles.active=docker", "app.jar"]
