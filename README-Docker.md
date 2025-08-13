# ABPlat - Docker Setup

Ova aplikacija je dockerizovana i sadrži:
- **Spring Boot Backend** (port 8080)
- **React Frontend** (port 3000)  
- **MySQL Database** (port 3306)
- **phpMyAdmin** (port 8081)

## Preduslovi

Potrebno je da imate instaliran:
- Docker
- Docker Compose

## Pokretanje aplikacije

### 1. Kloniranje repositorija
```bash
git clone <repository-url>
cd ABPLAT
```

### 2. Pokretanje svih servisa
```bash
docker-compose up --build
```

### 3. Pristup aplikaciji

Kada se svi servisi pokrenu, možete pristupiti:

- **Frontend aplikacija**: http://localhost (port 80)
- **Backend API**: http://localhost:8080
- **phpMyAdmin**: http://localhost:8081
  - Server: mysql
  - Username: root
  - Password: ROOT

### 4. Pristup na Ubuntu serveru

Na Ubuntu serveru možete pristupiti aplikaciji preko:
- **Frontend aplikacija**: http://server-ip (port 80)
- **Backend API**: http://server-ip:8080
- **phpMyAdmin**: http://server-ip:8081

## Korisne komande

### Pokretanje u background-u
```bash
docker-compose up -d --build
```

### Zaustavljanje servisa
```bash
docker-compose down
```

### Zaustavljanje i brisanje volume-a (baza podataka)
```bash
docker-compose down -v
```

### Pregled logova
```bash
# Svi servisi
docker-compose logs -f

# Specifičan servis
docker-compose logs -f backend
docker-compose logs -f frontend
docker-compose logs -f mysql
```

### Rebuild specifičnog servisa
```bash
docker-compose build backend
docker-compose build frontend
```

## Struktura servisa

### Backend (Spring Boot)
- **Container**: abplat-backend
- **Port**: 8080
- **Health check**: /actuator/health
- **Profile**: docker

### Frontend (React + Nginx)
- **Container**: abplat-frontend
- **Port**: 80
- **Nginx**: Servira statičke fajlove i proxy API pozive

### MySQL
- **Container**: abplat-mysql
- **Port**: 3306
- **Database**: colplat
- **Username**: root
- **Password**: ROOT

### phpMyAdmin
- **Container**: abplat-phpmyadmin
- **Port**: 8081

## Troubleshooting

### Problem sa MySQL konekcijom
Sačekajte da se MySQL potpuno pokrene. Backend ima health check koji čeka da baza bude dostupna.

### Problem sa frontend build-om
```bash
# Obriši node_modules i reinstaliraj
cd abplat-front
rm -rf node_modules package-lock.json
npm install
cd ..
docker-compose build frontend
```

### Problem sa backend build-om
```bash
# Očisti Maven cache
cd ColPlatBack
./mvnw clean
cd ..
docker-compose build backend
```

### Pregled Docker volume-a
```bash
docker volume ls
docker volume inspect abplat_mysql_data
```

## Ubuntu Server Setup

### Instalacija Docker-a na Ubuntu

```bash
# Ažuriranje sistema
sudo apt update && sudo apt upgrade -y

# Instalacija Docker-a
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Dodavanje korisnika u docker grupu
sudo usermod -aG docker $USER

# Instalacija Docker Compose
sudo apt install docker-compose-plugin -y

# Restart sesije ili logout/login da bi grupa stupila na snagu
newgrp docker
```

### Pokretanje na serveru

```bash
# Kloniranje repositorija
git clone <repository-url>
cd ABPLAT

# Pokretanje u background-u
docker compose up -d --build

# Provera statusa
docker compose ps
```

### Firewall podešavanja (ukoliko je potrebno)

```bash
# Otvaranje portova
sudo ufw allow 80/tcp    # Frontend
sudo ufw allow 8080/tcp  # Backend API
sudo ufw allow 8081/tcp  # phpMyAdmin
```

### Pristup aplikaciji

Nakon pokretanja na serveru:
- **Aplikacija**: http://your-server-ip
- **API**: http://your-server-ip:8080
- **phpMyAdmin**: http://your-server-ip:8081

## Development

Za development možete pokrenuti servise pojedinačno:

```bash
# Samo baza i phpMyAdmin
docker compose up mysql phpmyadmin

# Backend lokalno
cd ColPlatBack
./mvnw spring-boot:run

# Frontend lokalno  
cd abplat-front
npm start
```
