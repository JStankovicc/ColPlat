# Koristimo OpenJDK 17 kao base image
FROM openjdk:17-jdk-alpine

# Instaliramo curl za health check
RUN apk add --no-cache curl

# Postavljamo radni direktorijum
WORKDIR /app

# Kopiramo Maven wrapper i pom.xml
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

# Buildujemo aplikaciju
RUN ./mvnw clean package -DskipTests

# Ekspozujemo port 8080
EXPOSE 8080

# Pokretamo aplikaciju
CMD ["java", "-jar", "target/Backend-0.0.1-SNAPSHOT.jar"]
