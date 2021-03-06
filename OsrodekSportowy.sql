USE [master]
GO
/****** Object:  Database [OsrodekSportowy]    Script Date: 11.01.2017 04:27:29 ******/
CREATE DATABASE [OsrodekSportowy]
 CONTAINMENT = NONE
ALTER DATABASE [OsrodekSportowy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OsrodekSportowy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OsrodekSportowy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET ARITHABORT OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OsrodekSportowy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OsrodekSportowy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OsrodekSportowy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OsrodekSportowy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OsrodekSportowy] SET  MULTI_USER 
GO
ALTER DATABASE [OsrodekSportowy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OsrodekSportowy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OsrodekSportowy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OsrodekSportowy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OsrodekSportowy] SET DELAYED_DURABILITY = DISABLED 
GO
USE [OsrodekSportowy]
GO
/****** Object:  Table [dbo].[ObiektSportowy]    Script Date: 11.01.2017 04:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ObiektSportowy](
	[nrObiektu] [int] NOT NULL,
	[nazwaObiektu] [varchar](50) NOT NULL,
	[ulica] [varchar](50) NOT NULL,
	[nrBudynku] [varchar](5) NOT NULL,
	[miejscowosc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ObiektSportowy] PRIMARY KEY CLUSTERED 
(
	[nrObiektu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Osoby]    Script Date: 11.01.2017 04:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Osoby](
	[nrOsoby] [int] IDENTITY(1,1) NOT NULL,
	[imie] [varchar](20) NOT NULL,
	[nazwisko] [varchar](20) NOT NULL,
	[ulica] [varchar](50) NOT NULL,
	[nrBudynku] [varchar](5) NOT NULL,
	[miejscowosc] [varchar](50) NOT NULL,
	[telefon] [decimal](15, 0) NOT NULL,
	[nrZawodow] [int] NULL,
	[nrZajec] [int] NULL,
 CONSTRAINT [PK_Osoby] PRIMARY KEY CLUSTERED 
(
	[nrOsoby] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sprzet]    Script Date: 11.01.2017 04:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sprzet](
	[nrSprzetu] [int] IDENTITY(1,1) NOT NULL,
	[nazwaSprzetu] [varchar](10) NOT NULL,
	[nrObiektu] [int] NOT NULL,
 CONSTRAINT [PK_Sprzet] PRIMARY KEY CLUSTERED 
(
	[nrSprzetu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WynajecieObiektu]    Script Date: 11.01.2017 04:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WynajecieObiektu](
	[nrWynajęcia] [int] IDENTITY(1,1) NOT NULL,
	[dataOd] [datetime] NOT NULL,
	[dataDo] [datetime] NOT NULL,
	[nrObiektu] [int] NOT NULL,
	[nrOsoby] [int] NULL,
	[koszt] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_WynajecieObiektu] PRIMARY KEY CLUSTERED 
(
	[nrWynajęcia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WypozyczenieSprzetu]    Script Date: 11.01.2017 04:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WypozyczenieSprzetu](
	[nrWypozyczenia] [int] IDENTITY(1,1) NOT NULL,
	[dataWypozyczenia] [datetime] NOT NULL,
	[dataZwrotu] [datetime] NULL,
	[nrSprzetu] [int] NOT NULL,
	[nrOsoby] [int] NOT NULL,
	[koszt] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_WypozyczenieSprzetu] PRIMARY KEY CLUSTERED 
(
	[nrWypozyczenia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zajecia]    Script Date: 11.01.2017 04:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zajecia](
	[nrZajec] [int] IDENTITY(1,1) NOT NULL,
	[nazwaZajec] [varchar](50) NOT NULL,
	[nrObiektu] [int] NOT NULL,
	[dzienTygodnia] [varchar](12) NOT NULL,
	[godzina] [time](7) NOT NULL,
 CONSTRAINT [PK_Zajecia] PRIMARY KEY CLUSTERED 
(
	[nrZajec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zawody]    Script Date: 11.01.2017 04:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zawody](
	[nrZawodow] [int] IDENTITY(1,1) NOT NULL,
	[nazwaZawodow] [varchar](50) NOT NULL,
	[dataZawodow] [datetime] NOT NULL,
	[nrObiektu] [int] NOT NULL,
 CONSTRAINT [PK_Zawody] PRIMARY KEY CLUSTERED 
(
	[nrZawodow] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Osoby]  WITH CHECK ADD  CONSTRAINT [FK_Osoby_Zajecia] FOREIGN KEY([nrZajec])
REFERENCES [dbo].[Zajecia] ([nrZajec])
GO
ALTER TABLE [dbo].[Osoby] CHECK CONSTRAINT [FK_Osoby_Zajecia]
GO
ALTER TABLE [dbo].[Osoby]  WITH CHECK ADD  CONSTRAINT [FK_Osoby_Zawody] FOREIGN KEY([nrZawodow])
REFERENCES [dbo].[Zawody] ([nrZawodow])
GO
ALTER TABLE [dbo].[Osoby] CHECK CONSTRAINT [FK_Osoby_Zawody]
GO
ALTER TABLE [dbo].[Sprzet]  WITH CHECK ADD  CONSTRAINT [FK_Sprzet_ObiektSportowy] FOREIGN KEY([nrObiektu])
REFERENCES [dbo].[ObiektSportowy] ([nrObiektu])
GO
ALTER TABLE [dbo].[Sprzet] CHECK CONSTRAINT [FK_Sprzet_ObiektSportowy]
GO
ALTER TABLE [dbo].[WynajecieObiektu]  WITH CHECK ADD  CONSTRAINT [FK_WynajecieObiektu_ObiektSportowy] FOREIGN KEY([nrObiektu])
REFERENCES [dbo].[ObiektSportowy] ([nrObiektu])
GO
ALTER TABLE [dbo].[WynajecieObiektu] CHECK CONSTRAINT [FK_WynajecieObiektu_ObiektSportowy]
GO
ALTER TABLE [dbo].[WynajecieObiektu]  WITH CHECK ADD  CONSTRAINT [FK_WynajecieObiektu_Osoby] FOREIGN KEY([nrOsoby])
REFERENCES [dbo].[Osoby] ([nrOsoby])
GO
ALTER TABLE [dbo].[WynajecieObiektu] CHECK CONSTRAINT [FK_WynajecieObiektu_Osoby]
GO
ALTER TABLE [dbo].[WypozyczenieSprzetu]  WITH CHECK ADD  CONSTRAINT [FK_WypozyczenieSprzetu_Osoby] FOREIGN KEY([nrOsoby])
REFERENCES [dbo].[Osoby] ([nrOsoby])
GO
ALTER TABLE [dbo].[WypozyczenieSprzetu] CHECK CONSTRAINT [FK_WypozyczenieSprzetu_Osoby]
GO
ALTER TABLE [dbo].[WypozyczenieSprzetu]  WITH CHECK ADD  CONSTRAINT [FK_WypozyczenieSprzetu_Sprzet] FOREIGN KEY([nrSprzetu])
REFERENCES [dbo].[Sprzet] ([nrSprzetu])
GO
ALTER TABLE [dbo].[WypozyczenieSprzetu] CHECK CONSTRAINT [FK_WypozyczenieSprzetu_Sprzet]
GO
ALTER TABLE [dbo].[Zajecia]  WITH CHECK ADD  CONSTRAINT [FK_Zajecia_ObiektSportowy] FOREIGN KEY([nrObiektu])
REFERENCES [dbo].[ObiektSportowy] ([nrObiektu])
GO
ALTER TABLE [dbo].[Zajecia] CHECK CONSTRAINT [FK_Zajecia_ObiektSportowy]
GO
ALTER TABLE [dbo].[Zawody]  WITH CHECK ADD  CONSTRAINT [FK_Zawody_ObiektSportowy] FOREIGN KEY([nrObiektu])
REFERENCES [dbo].[ObiektSportowy] ([nrObiektu])
GO
ALTER TABLE [dbo].[Zawody] CHECK CONSTRAINT [FK_Zawody_ObiektSportowy]
GO
USE [master]
GO
ALTER DATABASE [OsrodekSportowy] SET  READ_WRITE 
GO
