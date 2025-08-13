# Multi-stage build za React aplikaciju

# Stage 1: Build stage
FROM node:18-alpine as build

# Instaliramo git (potrebno za neke npm pakete)
RUN apk add --no-cache git

# Postavljamo radni direktorijum
WORKDIR /app

# Kopiramo package.json i package-lock.json
COPY package*.json ./

# Čistimo npm cache i instaliramo dependencies
RUN npm cache clean --force
RUN npm ci --legacy-peer-deps

# Kopiramo source kod
COPY . .

# Buildujemo aplikaciju za production
RUN npm run build

# Stage 2: Nginx za serviranje
FROM nginx:alpine

# Kopiramo build fajlove iz prethodnog stage-a
COPY --from=build /app/build /usr/share/nginx/html

# Kopiramo custom nginx konfiguraciju
COPY nginx.conf /etc/nginx/nginx.conf

# Ekspozujemo port 80
EXPOSE 80

# Pokretamo nginx
CMD ["nginx", "-g", "daemon off;"]
