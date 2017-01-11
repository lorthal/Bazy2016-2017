use OsrodekSportowy
-- 1. Wyœwietl numerOsoby, Imiê, oraz Nazwisko osób, które bior¹ udzia³ w zawodach i zajêciach.
--select o.nrOsoby, o.imie, o.nazwisko 
--from Osoby o 
--where o.nrZawodow is not null and o.nrZajec is not null

-- 2. Wyœwietl Imiê i Nazwisko osób, które wynajmowali Obiekt Sportowy, wraz z Nazw¹ Obiektu i Miastem, w którym znajduje siê dany obiekt, posortowane rosn¹co wzglêdem nazwiska.
--select o.imie, o.nazwisko, os.nazwaObiektu, os.miejscowosc 
--from Osoby o, WynajecieObiektu wo, ObiektSportowy os 
--where o.nrOsoby=wo.nrOsoby and wo.nrObiektu = os.nrObiektu 
--order by o.nazwisko asc

-- 3. Wyœwietl Imiê i Nazwisko osób, które wypo¿yczy³y sprzêt wiêcej ni¿ raz.
--select o.imie, o.nazwisko from 
--(select nrOsoby, COUNT(nrOsoby) as counted from WypozyczenieSprzetu group by nrOsoby) a, Osoby o 
--where a.counted>1 and a.nrOsoby=o.nrOsoby

-- 4. Wyœwietl Imiê i Nazwisko osób, które wypo¿yczy³y sprzêt przed 11.01.2017
--select o.imie, o.nazwisko 
--from Osoby o, WypozyczenieSprzetu ws 
--where o.nrOsoby = ws.nrOsoby and ws.dataWypozyczenia < '2017-01-11'

-- 5. Wyœwietl nrSprzêtu, nazwêSprzêtu, oraz koszt jego wypo¿yczenia, którego wypo¿yczenie kosztowa³o mniej ni¿ œredni koszt wszystkich zanotowanych wypo¿yczeñ
--select s.nrSprzetu, s.nazwaSprzetu, ws.koszt 
--from WypozyczenieSprzetu ws, Sprzet s 
--where ws.nrSprzetu=s.nrSprzetu and ws.koszt<(select AVG(koszt) from WypozyczenieSprzetu)

-- 6. Wyœwietl nrObiektu i nazwêObiektu, w którym znajduje siê najwiêcej sprzêtu do wypo¿yczenia.
--select distinct os.nrObiektu, os.nazwaObiektu 
--from ObiektSportowy os, Sprzet s, (select nrObiektu, count(*) as counted from Sprzet group by nrObiektu) sx
--where os.nrObiektu=s.nrObiektu and s.nrObiektu in 
--(select sx.nrObiektu where sx.counted = (select MAX(sp.counted) from (select nrObiektu, count(nrSprzetu) as counted from Sprzet group by nrObiektu) sp))

-- 7. Wypisz nrZawodów i nazwêZawodów odbywaj¹ce siê w obiekcie z punktu 6.
--select nrZawodow, nazwaZawodow from Zawody where nrObiektu in 
--(select distinct os.nrObiektu
--from ObiektSportowy os, Sprzet s, (select nrObiektu, count(*) as counted from Sprzet group by nrObiektu) sx
--where os.nrObiektu=s.nrObiektu and s.nrObiektu in 
--(select sx.nrObiektu where sx.counted = (select MAX(sp.counted) from (select nrObiektu, count(nrSprzetu) as counted from Sprzet group by nrObiektu) sp)))

-- 8. Wypisz Imiê i Nazwisko osób, które wziê³y udzia³ w zawodach odbywaj¹cych siê w innych miastach ni¿ miasto zamieszkania.
--select o.imie, o.nazwisko 
--from Osoby o, ObiektSportowy os, Zawody z 
--where z.nrObiektu=os.nrObiektu and o.nrZawodow = z.nrZawodow and o.miejscowosc != os.miejscowosc

