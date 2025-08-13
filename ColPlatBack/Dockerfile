# Jednostavan build sa Maven-om
FROM eclipse-temurin:17-jdk-alpine

# Instaliramo Maven, curl i netcat
RUN apk add --no-cache maven curl netcat-openbsd

# Postavljamo radni direktorijum
WORKDIR /app

# Kopiramo pom.xml prvo za cache-ovanje dependencies
COPY pom.xml .

# Preuzimamo dependencies
RUN mvn dependency:go-offline -B

# Kopiramo source kod
COPY src ./src

# Buildujemo aplikaciju
RUN mvn clean package -DskipTests -B

# Debug - proveravamo šta je kreirano
RUN ls -la target/
RUN ls -la target/classes/com/ColPlat/Backend/ || echo "Classes not found"
RUN jar tf target/Backend-0.0.1-SNAPSHOT.jar | head -20 || echo "JAR inspection failed"

# Ekspozujemo port 8080
EXPOSE 8080

# Pokretamo aplikaciju direktno
CMD ["java", "-jar", "-Dspring.profiles.active=docker", "target/Backend-0.0.1-SNAPSHOT.jar"]
