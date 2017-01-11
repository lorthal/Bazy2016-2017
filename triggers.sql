-- Wyzwalacz 1
-- Usuwaj¹c Sprzêt usuwamy wszystkie wypozyczenia tego sprzêtu

drop trigger trigger1
go
create trigger trigger1
on dbo.Sprzet
instead of delete
as
	delete from dbo.WypozyczenieSprzetu where nrSprzetu = (select nrSprzetu from deleted)
	delete from dbo.Sprzet where nrSprzetu = (select nrSprzetu from deleted)
go

select * from WypozyczenieSprzetu

delete dbo.Sprzet where nrSprzetu = 18

select * from WypozyczenieSprzetu