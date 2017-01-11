use OsrodekSportowy

-- Procedura 1 
-- Przypisz Osobê do pierwszych zajêæ lub zawodów o podanej nazwie o ile istnieje.

if exists(select 1 from sys.objects where type = 'P' and name = 'proc1')
	drop procedure proc1
go
create procedure proc1	@nrOsoby int = null,
						@nazwaZawodow varchar(50) = null,
						@nazwaZajec varchar(50) = null
as
begin
	if @nazwaZajec is null and @nazwaZawodow is null
	begin
		print 'Nie podano nazwy zajêæ ani zawodów.'
	end
	else if @nrOsoby is null
	begin
		print 'Nie podano numeru osoby.'
	end

	if @nazwaZajec is not null
	begin
		declare @ile int
		set @ile = (select count(*) from dbo.Zajecia where nazwaZajec = @nazwaZajec)
		if @ile > 0
		begin
			update Osoby
			set nrZajec = (select top 1 nrZajec from Zajecia where nazwaZajec = @nazwaZajec)
			where nrOsoby = @nrOsoby

			declare @imie varchar(20)
			set @imie = (select imie from Osoby where nrOsoby = @nrOsoby)

			declare @nazwisko varchar(20)
			set @nazwisko = (select nazwisko from Osoby where nrOsoby = @nrOsoby)
			print @imie + ' ' + @nazwisko + ' przypisany do zajêæ: ' + @nazwaZajec
		end
		else
		begin
			print 'Nie ma Zajêæ o nazwie: ' + @nazwaZajec
		end
	end

	if @nazwaZawodow is not null
	begin
		set @ile = (select count(*) from dbo.Zawody where nazwaZawodow = @nazwaZawodow)
		if @ile > 0
		begin
			update Osoby
			set nrZawodow = (select top 1 nrZawodow from Zawody where nazwaZawodow = @nazwaZawodow order by dataZawodow)
			where nrOsoby = @nrOsoby

			set @imie = (select imie from Osoby where nrOsoby = @nrOsoby)

			set @nazwisko = (select nazwisko from Osoby where nrOsoby = @nrOsoby)
			print @imie + ' ' + @nazwisko + ' przypisany do zajêæ: ' + @nazwaZawodow
		end
		else
		begin
			print 'Nie ma Zawodow o nazwie: ' + @nazwaZawodow
		end
	end
end
go

-- Przyk³ad u¿ycia Procedury 1
--exec proc1 @nrOsoby = 1, @nazwaZawodow = 'Turniej siatkówki'


-- Procedura 2
-- Dodanie nowego wynajêcia obiektu sportowego.

if exists(select 1 from sys.objects where type = 'P' and name = 'proc2')
	drop procedure proc2
go
create procedure proc2	@dataOd datetime = null,
						@dataDo datetime = null,
						@nrObiektu int = null,
						@nrOsoby int = null,
						@koszt decimal(6,2) = null
as
begin
	if @dataOd is null or @dataDo is null or @nrObiektu is null or @nrOsoby is null or @koszt is null
	begin
		print 'Nie podano wszystkich danych.'
	end
	else
	begin
		declare @nazwaObiektu varchar(50)
		set @nazwaObiektu = (select nazwaObiektu from ObiektSportowy where nrObiektu = @nrObiektu)

		declare @imie varchar(50)
		set @imie = (select imie from Osoby where nrOsoby = @nrOsoby)

		declare @nazwisko varchar(50)
		set @nazwisko = (select nazwisko from Osoby where nrOsoby = @nrOsoby)

		if @nazwaObiektu is null
		begin
			print 'Obiekt o numerze: ' + cast(@nrObiektu as varchar) + ' nie istnieje'
		end
		else if @imie is null or @nazwisko is null
		begin
			print 'Nie ma osoby o numerze: ' + cast(@nrOsoby as varchar)
		end 
		else
		begin
			insert into WynajecieObiektu values(@dataOd, @dataDo, @nrObiektu, @nrOsoby, @koszt)
			print 'Uda³o sie wynaj¹æ obiekt ' + @nazwaObiektu + ' osobie ' + @imie + ' ' + @nazwisko + ' w terminie od: ' + cast(@dataOd as varchar) + ' do: ' + cast(@dataDo as varchar) + ' za ' + cast(@koszt as varchar) 
		end
	end
end
go

-- Przyk³ady u¿ycia Procedury 2
--exec proc2 '2017-04-12 09:00', '2017-04-12 10:00', 1 

--exec proc2 @dataOd = '2017-04-12 09:00', @dataDo ='2017-04-12 10:00',  @nrObiektu = 1, @nrOsoby = 10, @koszt = 10.00

--exec proc2 @dataOd = '2017-04-12 09:00', @dataDo ='2017-04-12 10:00',  @nrObiektu = 25, @nrOsoby = 10, @koszt = 10.00

--exec proc2 @dataOd = '2017-04-12 09:00', @dataDo ='2017-04-12 10:00',  @nrObiektu = 1, @nrOsoby = 49, @koszt = 10.00


-- Procedura 3
-- Wypozyczenia sprzêtu starsze ni¿ podana iloœc godzin
if exists(select 1 from sys.objects where type = 'P' and name = 'proc3')
	drop procedure proc3
go
create procedure proc3 @ileGodzin int = 5
as
begin
	declare @ile int
	set @ile = (select count(*) from WypozyczenieSprzetu where datediff(hour, dataZwrotu, getdate()) > @ileGodzin)

	if @ile > 0
	begin
		select nrSprzetu from WypozyczenieSprzetu where datediff(hour, dataZwrotu, getdate()) > @ileGodzin
	end
	else 
	begin
		print 'Nie ma wypo¿yczeñ sprzêtu starszych ni¿ ' + cast(@ileGodzin as varchar) + ' godzin'
	end
end
go

-- Przyk³ady u¿ycia Procedury 3
--exec proc3 1