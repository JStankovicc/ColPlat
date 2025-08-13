# Koristimo OpenJDK 17 kao base image
FROM openjdk:17-jdk-alpine

# Instaliramo curl i netcat za health check
RUN apk add --no-cache curl netcat-openbsd

# Postavljamo radni direktorijum
WORKDIR /app

# Kopiramo sve potrebno
COPY . .

# Dajemo dozvole za izvršavanje Maven wrapper-a
RUN chmod +x ./mvnw

# Ekspozujemo port 8080
EXPOSE 8080

# Pokretamo aplikaciju direktno sa mvnw (development mode)
CMD ["./mvnw", "spring-boot:run", "-Dspring-boot.run.profiles=docker"]
