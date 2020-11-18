# Zad 1
### Przykład  1
CREATE TABLE mikolajewskik.kreatura LIKE wikingowie.kreatura;  
INSERT INTO mikolajewskik.kreatura SELECT * FROM wikingowie.kreatura;

CREATE TABLE mikolajewskik.zasob LIKE wikingowie.zasob;  
INSERT INTO mikolajewskik.zasob SELECT * FROM wikingowie.zasob;

CREATE TABLE mikolajewskik.ekwipunek LIKE wikingowie.ekwipunek;  
INSERT INTO mikolajewskik.ekwipunek SELECT * FROM wikingowie.ekwipunek;

### Przykład  2
SELECT * FROM zasob;

### Przykład  3
SELECT * FROM zasob  
WHERE rodzaj = 'jedzenie';

### Przykład  4
SELECT IdZasobu, ilosc FROM ekwipunek  
WHERE idKreatury IN ('1','3','5');

# Zad 2
### Przykład  1
SELECT * FROM kreatura  
WHERE rodzaj != 'wiedzma' AND udzwig >= 50;

### Przykład  2
SELECT * FROM zasob  
WHERE waga BETWEEN 2 AND 5;

### Przykład  3
SELECT * FROM kreatura  
WHERE nazwa LIKE '%or%' waga BETWEEN 30 AND 70;

# Zad 3
### Przykład  1
SELECT * FROM zasob  
WHERE MONTH(dataPozyskania) IN ('7','8');

### Przykład  2
SELECT * FROM zasob  
WHERE rodzaj != ''  
ORDER BY waga ASC;

### Przykład  3
SELECT * FROM kreatura  
ORDER BY dataUr DESC  
LIMIT 5;

# Zad 4
### Przykład  1
SELECT DISTINCT rodzaj FROM zasob;

### Przykład  2
SELECT rodzaj, CONCAT(nazwa," - ",rodzaj) AS nazwa_rodzaj from kreatura  
WHERE rodzaj LIKE "wi%";

### Przykład  3
SELECT nazwa, ilosc*waga AS waga FROM zasob   
WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;

# Zad 5
### Przykład  1
SELECT nazwa, 0.3*waga AS odpad, 0.7*waga AS jedzenie FROM zasob   
WHERE rodzaj="jedzenie";

### Przykład  2
SELECT * FROM zasob  
WHERE rodzaj IS NULL;

### Przykład  3
SELECT DISTINCT rodzaj, nazwa FROM zasob  
WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os'  
ORDER BY rodzaj ASC;