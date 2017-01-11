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
			set nrZawodow = (select top 1 nrZawodow from Zawody where nazwaZawodow = @nazwaZawodow)
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
exec proc1 @nrOsoby = 1, @nazwaZawodow = 'Turniej siatkówki' 