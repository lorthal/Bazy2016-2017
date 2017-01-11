-- Funkcja
-- Zwraca iloœæ osób zapisanych na zajêcia w podanym dniu tygodnia

if exists (select 1 from sys.objects where type = 'FN' and name = 'fun')
	drop function fun

go
create function fun(@dzienTygodnia varchar(12) = 'poniedzia³ek') returns int
begin
	declare @ile int = 0;
	set @ile = (select count(*) 
				from dbo.Osoby 
				join dbo.Zajecia on dbo.Osoby.nrZajec = dbo.Zajecia.nrZajec
				where dbo.Zajecia.dzienTygodnia = @dzienTygodnia)
	return @ile
end
go

--Przyk³ad u¿ycia Funkcji
--declare @i int
--exec @i = fun 'wtorek'
--print cast(@i as varchar)