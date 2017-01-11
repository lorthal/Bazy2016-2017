-- Wyzwalacz 1
-- Usuwaj¹c Sprzêt usuwamy wszystkie wypozyczenia tego sprzêtu

if exists (select 1 from sys.triggers where name = 'trigger1')
	drop trigger trigger1
go
create trigger trigger1
on dbo.Sprzet
instead of delete
as
	delete from dbo.WypozyczenieSprzetu where nrSprzetu = (select nrSprzetu from deleted)
	delete from dbo.Sprzet where nrSprzetu = (select nrSprzetu from deleted)
go

-- Przyk³ad u¿ycia wyzwalacza 1
--select * from WypozyczenieSprzetu

--delete dbo.Sprzet where nrSprzetu = 18

--select * from WypozyczenieSprzetu


-- Wyzwalacz 2
-- Przy utworzeniu zawodów dodaje wynajêcie obiektu na 4 godziny

if exists (select 1 from sys.triggers where name = 'trigger2')
	drop trigger trigger2
go
create trigger trigger2
on dbo.Zawody
instead of insert
as

	insert into WynajecieObiektu values((select inserted.dataZawodow from inserted), 
		DATEADD(hour, 4, (select inserted.dataZawodow from inserted)),
		(select inserted.nrObiektu from inserted), null, 0.00 )

		insert into dbo.Zawody (nazwaZawodow, dataZawodow, nrObiektu)
		select nazwaZawodow, dataZawodow, nrObiektu from inserted
go

-- Przyk³ad u¿ycia wyzwalacza 2
--select * from WynajecieObiektu

--insert into Zawody values('Turniej koszykówki', '2017-06-01 10:00', 2)

--select * from WynajecieObiektu