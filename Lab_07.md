# Zad 1
### Przykład 1
CREATE TABLE mikolajewskik.kreatura LIKE wikingowie.kreatura;  
INSERT INTO mikolajewskik.kreatura SELECT * FROM wikingowie.kreatura;  

CREATE TABLE mikolajewskik.uczestnicy LIKE wikingowie.uczestnicy;  
INSERT INTO mikolajewskik.uczestnicy SELECT * FROM wikingowie.uczestnicy;  

CREATE TABLE mikolajewskik.etapy_wyprawy LIKE wikingowie.etapy_wyprawy;  
INSERT INTO mikolajewskik.etapy_wyprawy SELECT * FROM wikingowie.etapy_wyprawy;  

CREATE TABLE mikolajewskik.sektor LIKE wikingowie.sektor;  
INSERT INTO mikolajewskik.sektor SELECT * FROM wikingowie.sektor;  

CREATE TABLE mikolajewskik.wyprawa LIKE wikingowie.wyprawa;  
INSERT INTO mikolajewskik.wyprawa SELECT * FROM wikingowie.wyprawa;  


### Przyklad 2
SELECT k.nazwa, u.id_uczestnika FROM kreatura AS k  
LEFT JOIN uczestnicy AS u ON u.id_uczestnika=k.Idkreatury   
WHERE u.id_uczestnika IS NULL;

### Przykład 3
SELECT w.nazwa, SUM(e.ilosc) FROM wyprawa AS w  
INNER JOIN uczestnicy AS u ON u.id_wyprawy=w.id_wyprawy   
INNER JOIN kreatura AS k ON u.id_uczestnika=k.idkreatury  
INNER JOIN ekwipunek AS e ON e.idKreatury=k.idkreatury  
GROUP BY w.nazwa;
