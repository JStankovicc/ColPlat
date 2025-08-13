-- Inicijalizacija MySQL baze za ABPlat aplikaciju
CREATE DATABASE IF NOT EXISTS colplat CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Kreiranje korisnika (opciono, ako je potreban dodatni korisnik)
-- CREATE USER IF NOT EXISTS 'abplat'@'%' IDENTIFIED BY 'abplat123';
-- GRANT ALL PRIVILEGES ON colplat.* TO 'abplat'@'%';
-- FLUSH PRIVILEGES;

USE colplat;

-- Ovde možete dodati dodatne inicijalizacione skriptove ako je potrebno
