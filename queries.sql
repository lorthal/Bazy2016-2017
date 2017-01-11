use OsrodekSportowy
-- 1. Wy�wietl numerOsoby, Imi�, oraz Nazwisko os�b, kt�re bior� udzia� w zawodach i zaj�ciach.
--select o.nrOsoby, o.imie, o.nazwisko 
--from Osoby o 
--where o.nrZawodow is not null and o.nrZajec is not null

-- 2. Wy�wietl Imi� i Nazwisko os�b, kt�re wynajmowali Obiekt Sportowy, wraz z Nazw� Obiektu i Miastem, w kt�rym znajduje si� dany obiekt, posortowane rosn�co wzgl�dem nazwiska.
--select o.imie, o.nazwisko, os.nazwaObiektu, os.miejscowosc 
--from Osoby o, WynajecieObiektu wo, ObiektSportowy os 
--where o.nrOsoby=wo.nrOsoby and wo.nrObiektu = os.nrObiektu 
--order by o.nazwisko asc

-- 3. Wy�wietl Imi� i Nazwisko os�b, kt�re wypo�yczy�y sprz�t wi�cej ni� raz.
--select o.imie, o.nazwisko from 
--(select nrOsoby, COUNT(nrOsoby) as counted from WypozyczenieSprzetu group by nrOsoby) a, Osoby o 
--where a.counted>1 and a.nrOsoby=o.nrOsoby

-- 4. Wy�wietl Imi� i Nazwisko os�b, kt�re wypo�yczy�y sprz�t przed 11.01.2017
--select o.imie, o.nazwisko 
--from Osoby o, WypozyczenieSprzetu ws 
--where o.nrOsoby = ws.nrOsoby and ws.dataWypozyczenia < '2017-01-11'

-- 5. Wy�wietl nrSprz�tu, nazw�Sprz�tu, oraz koszt jego wypo�yczenia, kt�rego wypo�yczenie kosztowa�o mniej ni� �redni koszt wszystkich zanotowanych wypo�ycze�
--select s.nrSprzetu, s.nazwaSprzetu, ws.koszt 
--from WypozyczenieSprzetu ws, Sprzet s 
--where ws.nrSprzetu=s.nrSprzetu and ws.koszt<(select AVG(koszt) from WypozyczenieSprzetu)

-- 6. Wy�wietl nrObiektu i nazw�Obiektu, w kt�rym znajduje si� najwi�cej sprz�tu do wypo�yczenia.
--select distinct os.nrObiektu, os.nazwaObiektu 
--from ObiektSportowy os, Sprzet s, (select nrObiektu, count(*) as counted from Sprzet group by nrObiektu) sx
--where os.nrObiektu=s.nrObiektu and s.nrObiektu in 
--(select sx.nrObiektu where sx.counted = (select MAX(sp.counted) from (select nrObiektu, count(nrSprzetu) as counted from Sprzet group by nrObiektu) sp))

-- 7. Wypisz nrZawod�w i nazw�Zawod�w odbywaj�ce si� w obiekcie z punktu 6.
--select nrZawodow, nazwaZawodow from Zawody where nrObiektu in 
--(select distinct os.nrObiektu
--from ObiektSportowy os, Sprzet s, (select nrObiektu, count(*) as counted from Sprzet group by nrObiektu) sx
--where os.nrObiektu=s.nrObiektu and s.nrObiektu in 
--(select sx.nrObiektu where sx.counted = (select MAX(sp.counted) from (select nrObiektu, count(nrSprzetu) as counted from Sprzet group by nrObiektu) sp)))

-- 8. Wypisz Imi� i Nazwisko os�b, kt�re wzi�y udzia� w zawodach odbywaj�cych si� w innych miastach ni� miasto zamieszkania.
--select o.imie, o.nazwisko 
--from Osoby o, ObiektSportowy os, Zawody z 
--where z.nrObiektu=os.nrObiektu and o.nrZawodow = z.nrZawodow and o.miejscowosc != os.miejscowosc

