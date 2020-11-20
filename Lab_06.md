# Zad 1
### Przykład 1
SELECT AVG(waga) FROM kreatura   
WHERE rodzaj='wiking';

### Przykład 2
SELECT rodzaj, AVG(waga), COUNT(idKreatury) FROM kreatura   
GROUP BY rodzaj;

### Przykład 3
SELECT rodzaj, AVG(year(now())-YEAR(dataUr)) FROM kreatura   
GROUP BY rodzaj;

# Zad 2
### Przykład 1
SELECT rodzaj, SUM(waga) FROM zasob   
GROUP BY rodzaj;

### Przykład 2
SELECT nazwa, AVG(waga) FROM zasob   
GROUP BY nazwa   
HAVING SUM(ilosc) >= 4 AND SUM(waga) > 10;  

### Przykład 3
SELECT COUNT(DISTINCT(nazwa)), rodzaj FROM zasob   
GROUP BY rodzaj   
HAVING COUNT(nazwa)>1;  

# Zad 3
### Przykład 1
SELECT k.nazwa, e.idZasobu, e.ilosc FROM kreatura AS k, ekwipunek AS e  
WHERE k.idKreatury = e.idKreatury;  

#LUB

SELECT kreatura.nazwa, SUM(ekwipunek.ilosc) FROM kreatura   
INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury   
GROUP BY nazwa;  


### Przykład 2
SELECT k.nazwa, e.ilosc, z.nazwa FROM kreatura AS k, ekwipunek AS e, zasob AS z  
WHERE k.idKreatury = e.idKreatury  
AND e.idZasobu = z.idZasobu;    

LUB  

SELECT kreatura.nazwa,zasob.nazwa FROM kreatura   
INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury   
INNER JOIN zasob ON ekwipunek.idzasobu=zasob.idzasobu   
ORDER BY kreatura.nazwa;

### Przykład 3
SELECT k.idKreatury, k.nazwa, e.idZasobu FROM kreatura AS k  
LEFT JOIN ekwipunek AS e ON k.idKreatury = e.idKreatury   
WHERE e.idZasobu IS NULL;  
