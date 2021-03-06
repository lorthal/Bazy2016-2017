USE [OsrodekSportowy]
GO
INSERT [dbo].[ObiektSportowy] ([nrObiektu], [nazwaObiektu], [ulica], [nrBudynku], [miejscowosc]) VALUES (1, N'Boisko Piłkarskie', N'Cała', N'1', N'Łódź')
INSERT [dbo].[ObiektSportowy] ([nrObiektu], [nazwaObiektu], [ulica], [nrBudynku], [miejscowosc]) VALUES (2, N'Hala Sportowa', N'Cała', N'5a', N'Łódź')
INSERT [dbo].[ObiektSportowy] ([nrObiektu], [nazwaObiektu], [ulica], [nrBudynku], [miejscowosc]) VALUES (3, N'Kort Tenisowy', N'Długa', N'40', N'Łódź')
INSERT [dbo].[ObiektSportowy] ([nrObiektu], [nazwaObiektu], [ulica], [nrBudynku], [miejscowosc]) VALUES (4, N'Siłownia', N'Długa', N'35c', N'Łódź')
SET IDENTITY_INSERT [dbo].[Sprzet] ON 

INSERT [dbo].[Sprzet] ([nrSprzetu], [nazwaSprzetu], [nrObiektu]) VALUES (17, N'Piłka N', 1)
INSERT [dbo].[Sprzet] ([nrSprzetu], [nazwaSprzetu], [nrObiektu]) VALUES (18, N'Piłka R', 2)
INSERT [dbo].[Sprzet] ([nrSprzetu], [nazwaSprzetu], [nrObiektu]) VALUES (19, N'Piłka S', 2)
INSERT [dbo].[Sprzet] ([nrSprzetu], [nazwaSprzetu], [nrObiektu]) VALUES (20, N'Piłka K', 2)
INSERT [dbo].[Sprzet] ([nrSprzetu], [nazwaSprzetu], [nrObiektu]) VALUES (21, N'Rakieta', 3)
INSERT [dbo].[Sprzet] ([nrSprzetu], [nazwaSprzetu], [nrObiektu]) VALUES (22, N'Paletka', 2)
INSERT [dbo].[Sprzet] ([nrSprzetu], [nazwaSprzetu], [nrObiektu]) VALUES (23, N'Piłka T', 3)
SET IDENTITY_INSERT [dbo].[Sprzet] OFF
SET IDENTITY_INSERT [dbo].[Zajecia] ON 

INSERT [dbo].[Zajecia] ([nrZajec], [nazwaZajec], [nrObiektu], [dzienTygodnia], [godzina]) VALUES (1, N'Tenis', 3, N'piątek', CAST(N'10:00:00' AS Time))
INSERT [dbo].[Zajecia] ([nrZajec], [nazwaZajec], [nrObiektu], [dzienTygodnia], [godzina]) VALUES (3, N'Siatkówka', 2, N'czwartek', CAST(N'18:00:00' AS Time))
INSERT [dbo].[Zajecia] ([nrZajec], [nazwaZajec], [nrObiektu], [dzienTygodnia], [godzina]) VALUES (4, N'Koszykówka', 2, N'środa', CAST(N'18:00:00' AS Time))
INSERT [dbo].[Zajecia] ([nrZajec], [nazwaZajec], [nrObiektu], [dzienTygodnia], [godzina]) VALUES (5, N'Piłka Nożna', 1, N'sobota', CAST(N'09:30:00' AS Time))
INSERT [dbo].[Zajecia] ([nrZajec], [nazwaZajec], [nrObiektu], [dzienTygodnia], [godzina]) VALUES (7, N'Piłka Ręczna', 2, N'wtorek', CAST(N'18:00:00' AS Time))
INSERT [dbo].[Zajecia] ([nrZajec], [nazwaZajec], [nrObiektu], [dzienTygodnia], [godzina]) VALUES (8, N'Siłownia z trenerem', 4, N'poniedziałek', CAST(N'16:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Zajecia] OFF
SET IDENTITY_INSERT [dbo].[Zawody] ON 

INSERT [dbo].[Zawody] ([nrZawodow], [nazwaZawodow], [dataZawodow], [nrObiektu]) VALUES (1, N'Turniej piłki nożnej halowej', CAST(N'2017-02-18 12:00:00.000' AS DateTime), 2)
INSERT [dbo].[Zawody] ([nrZawodow], [nazwaZawodow], [dataZawodow], [nrObiektu]) VALUES (4, N'Turniej tenisa', CAST(N'2017-02-11 10:00:00.000' AS DateTime), 3)
INSERT [dbo].[Zawody] ([nrZawodow], [nazwaZawodow], [dataZawodow], [nrObiektu]) VALUES (5, N'Podnoszenie ciężarów', CAST(N'2017-03-25 16:30:00.000' AS DateTime), 4)
INSERT [dbo].[Zawody] ([nrZawodow], [nazwaZawodow], [dataZawodow], [nrObiektu]) VALUES (7, N'Turniej piłki ręcznej', CAST(N'2017-02-25 09:00:00.000' AS DateTime), 2)
INSERT [dbo].[Zawody] ([nrZawodow], [nazwaZawodow], [dataZawodow], [nrObiektu]) VALUES (8, N'Turniej piłki nożnej', CAST(N'2017-04-29 12:00:00.000' AS DateTime), 1)
INSERT [dbo].[Zawody] ([nrZawodow], [nazwaZawodow], [dataZawodow], [nrObiektu]) VALUES (9, N'Turniej trójek siatkarskich', CAST(N'2017-02-18 16:30:00.000' AS DateTime), 2)
INSERT [dbo].[Zawody] ([nrZawodow], [nazwaZawodow], [dataZawodow], [nrObiektu]) VALUES (11, N'Turniej siatkówki', CAST(N'2017-03-18 12:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Zawody] OFF
SET IDENTITY_INSERT [dbo].[Osoby] ON 

INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (1, N'Adam', N'Nowak', N'Politechniki', N'42', N'Łódź', CAST(521654241 AS Decimal(15, 0)), 1, 5)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (3, N'Błażej', N'Sobczak', N'Mieleszyńska', N'2', N'Łódź', CAST(665212548 AS Decimal(15, 0)), NULL, 3)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (5, N'Dyta', N'Czarnecka', N'Józefowska', N'133', N'Łódź', CAST(886832491 AS Decimal(15, 0)), NULL, 3)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (6, N'Bonifacy', N'Zając', N'Bzów', N'22', N'Łódź', CAST(532366783 AS Decimal(15, 0)), 5, 8)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (7, N'Serfaina', N'Szczepańska', N'Pl. Czackiego Tadeusza', N'7', N'Łódź', CAST(792811352 AS Decimal(15, 0)), NULL, NULL)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (8, N'Bronisław', N'Zieliński', N'Gimnazjalna', N'25', N'Łódź', CAST(696859353 AS Decimal(15, 0)), NULL, NULL)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (10, N'Henryk', N'Górski', N'Długosza Jana', N'32', N'Łódź', CAST(728291443 AS Decimal(15, 0)), NULL, 7)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (11, N'Kuba', N'Jaworski', N'Krzewowa', N'140', N'Łódź', CAST(693637116 AS Decimal(15, 0)), NULL, NULL)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (12, N'Kajetan', N'Zając', N'Bożywoja', N'15', N'Łódź', CAST(609456119 AS Decimal(15, 0)), NULL, 8)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (13, N'Grażyna', N'Adamczyk', N'Mosiężna', N'2', N'Pabianice', CAST(797212990 AS Decimal(15, 0)), 7, 8)
INSERT [dbo].[Osoby] ([nrOsoby], [imie], [nazwisko], [ulica], [nrBudynku], [miejscowosc], [telefon], [nrZawodow], [nrZajec]) VALUES (14, N'Gabrysia', N'Nowak', N'Macieja', N'2', N'Pabianice', CAST(675819120 AS Decimal(15, 0)), 11, NULL)
SET IDENTITY_INSERT [dbo].[Osoby] OFF
SET IDENTITY_INSERT [dbo].[WynajecieObiektu] ON 

INSERT [dbo].[WynajecieObiektu] ([nrWynajęcia], [dataOd], [dataDo], [nrObiektu], [nrOsoby], [koszt]) VALUES (1, CAST(N'2017-01-12 09:00:00.000' AS DateTime), CAST(N'2017-01-12 11:00:00.000' AS DateTime), 3, 7, CAST(30.00 AS Decimal(6, 2)))
INSERT [dbo].[WynajecieObiektu] ([nrWynajęcia], [dataOd], [dataDo], [nrObiektu], [nrOsoby], [koszt]) VALUES (3, CAST(N'2017-01-12 11:00:00.000' AS DateTime), CAST(N'2017-01-12 12:00:00.000' AS DateTime), 3, 12, CAST(15.00 AS Decimal(6, 2)))
INSERT [dbo].[WynajecieObiektu] ([nrWynajęcia], [dataOd], [dataDo], [nrObiektu], [nrOsoby], [koszt]) VALUES (4, CAST(N'2017-01-12 08:00:00.000' AS DateTime), CAST(N'2017-01-12 10:00:00.000' AS DateTime), 1, 5, CAST(20.00 AS Decimal(6, 2)))
INSERT [dbo].[WynajecieObiektu] ([nrWynajęcia], [dataOd], [dataDo], [nrObiektu], [nrOsoby], [koszt]) VALUES (5, CAST(N'2017-01-12 15:00:00.000' AS DateTime), CAST(N'2017-01-12 17:00:00.000' AS DateTime), 2, 1, CAST(60.00 AS Decimal(6, 2)))
INSERT [dbo].[WynajecieObiektu] ([nrWynajęcia], [dataOd], [dataDo], [nrObiektu], [nrOsoby], [koszt]) VALUES (6, CAST(N'2017-01-13 12:00:00.000' AS DateTime), CAST(N'2017-01-13 13:00:00.000' AS DateTime), 4, 3, CAST(12.00 AS Decimal(6, 2)))
INSERT [dbo].[WynajecieObiektu] ([nrWynajęcia], [dataOd], [dataDo], [nrObiektu], [nrOsoby], [koszt]) VALUES (7, CAST(N'2017-01-13 15:00:00.000' AS DateTime), CAST(N'2017-01-13 16:00:00.000' AS DateTime), 4, 10, CAST(12.00 AS Decimal(6, 2)))
INSERT [dbo].[WynajecieObiektu] ([nrWynajęcia], [dataOd], [dataDo], [nrObiektu], [nrOsoby], [koszt]) VALUES (8, CAST(N'2017-01-13 15:00:00.000' AS DateTime), CAST(N'2017-01-13 18:00:00.000' AS DateTime), 3, 13, CAST(45.00 AS Decimal(6, 2)))
INSERT [dbo].[WynajecieObiektu] ([nrWynajęcia], [dataOd], [dataDo], [nrObiektu], [nrOsoby], [koszt]) VALUES (9, CAST(N'2017-01-14 10:00:00.000' AS DateTime), CAST(N'2017-01-13 12:00:00.000' AS DateTime), 1, 11, CAST(20.00 AS Decimal(6, 2)))
SET IDENTITY_INSERT [dbo].[WynajecieObiektu] OFF
SET IDENTITY_INSERT [dbo].[WypozyczenieSprzetu] ON 

INSERT [dbo].[WypozyczenieSprzetu] ([nrWypozyczenia], [dataWypozyczenia], [dataZwrotu], [nrSprzetu], [nrOsoby], [koszt]) VALUES (1, CAST(N'2017-01-10 15:00:00.000' AS DateTime), CAST(N'2017-01-10 17:00:00.000' AS DateTime), 19, 8, CAST(8.00 AS Decimal(6, 2)))
INSERT [dbo].[WypozyczenieSprzetu] ([nrWypozyczenia], [dataWypozyczenia], [dataZwrotu], [nrSprzetu], [nrOsoby], [koszt]) VALUES (2, CAST(N'2017-01-11 10:00:00.000' AS DateTime), CAST(N'2017-01-11 11:00:00.000' AS DateTime), 17, 14, CAST(4.00 AS Decimal(6, 2)))
INSERT [dbo].[WypozyczenieSprzetu] ([nrWypozyczenia], [dataWypozyczenia], [dataZwrotu], [nrSprzetu], [nrOsoby], [koszt]) VALUES (3, CAST(N'2017-01-11 13:00:00.000' AS DateTime), CAST(N'2017-01-11 15:00:00.000' AS DateTime), 21, 6, CAST(16.00 AS Decimal(6, 2)))
INSERT [dbo].[WypozyczenieSprzetu] ([nrWypozyczenia], [dataWypozyczenia], [dataZwrotu], [nrSprzetu], [nrOsoby], [koszt]) VALUES (6, CAST(N'2017-01-11 13:00:00.000' AS DateTime), CAST(N'2017-01-11 15:00:00.000' AS DateTime), 23, 6, CAST(1.00 AS Decimal(6, 2)))
INSERT [dbo].[WypozyczenieSprzetu] ([nrWypozyczenia], [dataWypozyczenia], [dataZwrotu], [nrSprzetu], [nrOsoby], [koszt]) VALUES (8, CAST(N'2017-01-12 15:00:00.000' AS DateTime), CAST(N'2017-01-12 17:00:00.000' AS DateTime), 18, 1, CAST(8.00 AS Decimal(6, 2)))
SET IDENTITY_INSERT [dbo].[WypozyczenieSprzetu] OFF
