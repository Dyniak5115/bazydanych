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
## LUB
SELECT kreatura.nazwa, SUM(ekwipunek.ilosc) FROM kreatura 
INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury 
GROUP BY nazwa;


### Przykład 2
SELECT k.nazwa, e.ilosc, z.nazwa FROM kreatura AS k, ekwipunek AS e, zasob AS z
WHERE k.idKreatury = e.idKreatury
AND e.idZasobu = z.idZasobu;
## LUB
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura 
INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury 
INNER JOIN zasob ON ekwipunek.idzasobu=zasob.idzasobu 
ORDER BY kreatura.nazwa;

### Przykład 3
SELECT k.idKreatury, k.nazwa, e.idZasobu FROM kreatura AS k
LEFT JOIN ekwipunek AS e ON k.idKreatury = e.idKreatury 
WHERE e.idZasobu IS NULL;

# Zad 4
### Przykład 1
SELECT k.nazwa, z.nazwa FROM kreatura AS k  
NATURAL JOIN ekwipunek AS e  
INNER JOIN zasob z ON z.idzasobu = e.idzasobu   
WHERE YEAR(k.dataUr) BETWEEN 1670 AND 1679 AND k.rodzaj = 'wiking';

### Przykład 2
SELECT k.nazwa, e.idZasobu, z.nazwa, k.dataUr FROM kreatura AS k   
NATURAL JOIN ekwipunek AS e  
JOIN zasob z ON e.idZasobu=z.idZasobu  
WHERE z.rodzaj = 'jedzenie'  
ORDER BY dataUr DESC  
LIMIT 5;

### Przykład 3
SELECT CONCAT(tabk1.nazwa, " - ", tabk2.nazwa) FROM kreatura AS tabk1, kreatura AS tabk2   
WHERE tabk1.idKreatury - tabk2.idKreatury=5;

# Zad 5
### Przykład 1
SELECT k.rodzaj, AVG(e.ilosc*z.waga), SUM(e.ilosc) FROM kreatura AS k, ekwipunek AS e, zasob AS z 
WHERE k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu AND k.rodzaj NOT IN ('malpa','waz')   
GROUP BY rodzaj  
HAVING SUM(e.ilosc) < 30;

### Przykład 2
SELECT a.nazwa, a.rodzaj, a.dataUr FROM kreatura a,
(SELECT MIN(dataUr) MIN, MAX(dataUr) MAX FROM kreatura GROUP BY rodzaj) b 
WHERE b.min = a.dataUr OR b.max=a.dataUr;
