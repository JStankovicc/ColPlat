# Development build za React aplikaciju
FROM node:18-alpine

# Instaliramo git (potrebno za neke npm pakete)
RUN apk add --no-cache git

# Postavljamo radni direktorijum
WORKDIR /app

# Kopiramo package.json i package-lock.json
COPY package*.json ./

# Instaliramo dependencies
RUN npm ci --legacy-peer-deps

# Kopiramo source kod
COPY . .

# Ekspozujemo port 3000 (development server)
EXPOSE 3000

# Postavljamo environment varijable
ENV CHOKIDAR_USEPOLLING=true
ENV WATCHPACK_POLLING=true

# Pokretamo development server
CMD ["npm", "start"]
