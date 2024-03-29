USE [Tesis_Inv2]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTenenciaWI'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTenenciaWI'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversionesEsteAnio'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversionesEsteAnio'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversion_tenencia'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversion_tenencia'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversion_tenencia'
GO
ALTER TABLE [dbo].[Wallet] DROP CONSTRAINT [FK_Wallet_TipoDeWallet]
GO
ALTER TABLE [dbo].[NuevaTenencia] DROP CONSTRAINT [FK_NuevaTenencia_Wallet]
GO
ALTER TABLE [dbo].[NuevaTenencia] DROP CONSTRAINT [FK_NuevaTenencia_Exchange]
GO
ALTER TABLE [dbo].[InversionTemporal] DROP CONSTRAINT [FK_InversionT_NuevaTenencia]
GO
ALTER TABLE [dbo].[InversionTemporal] DROP CONSTRAINT [FK_InversionT_Instrumento]
GO
ALTER TABLE [dbo].[InversionTemporal] DROP CONSTRAINT [FK_InversionT_Criptomoneda]
GO
ALTER TABLE [dbo].[Inversion] DROP CONSTRAINT [FK_Inversion_NuevaTenencia]
GO
ALTER TABLE [dbo].[Inversion] DROP CONSTRAINT [FK_Inversion_Instrumento]
GO
ALTER TABLE [dbo].[Inversion] DROP CONSTRAINT [FK_Inversion_Criptomoneda]
GO
ALTER TABLE [dbo].[Criptomoneda] DROP CONSTRAINT [FK_Criptomoneda_TipoCriptomonedaA]
GO
/****** Object:  Table [dbo].[TipoDeWallet]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoDeWallet]') AND type in (N'U'))
DROP TABLE [dbo].[TipoDeWallet]
GO
/****** Object:  Table [dbo].[TipoCriptomoneda]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoCriptomoneda]') AND type in (N'U'))
DROP TABLE [dbo].[TipoCriptomoneda]
GO
/****** Object:  View [dbo].[vwInformeTenencia]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInformeTenencia]
GO
/****** Object:  View [dbo].[Inversion_Cripto_Instr]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Inversion_Cripto_Instr]
GO
/****** Object:  View [dbo].[vwCriptomoneda]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwCriptomoneda]
GO
/****** Object:  View [dbo].[Capital_Cripto_Resumen]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Capital_Cripto_Resumen]
GO
/****** Object:  View [dbo].[Capital_Cripto]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Capital_Cripto]
GO
/****** Object:  View [dbo].[capital_tipocripto_Resumen]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[capital_tipocripto_Resumen]
GO
/****** Object:  View [dbo].[Capital_TipoCripto]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Capital_TipoCripto]
GO
/****** Object:  View [dbo].[vwInversionDetalle]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInversionDetalle]
GO
/****** Object:  View [dbo].[vwCapital_LugarSeparadoWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwCapital_LugarSeparadoWI]
GO
/****** Object:  View [dbo].[vwLugaresUtilizadosWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwLugaresUtilizadosWI]
GO
/****** Object:  View [dbo].[vwTenenciaWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwTenenciaWI]
GO
/****** Object:  View [dbo].[EvolucionInversionesTipoCripto]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[EvolucionInversionesTipoCripto]
GO
/****** Object:  View [dbo].[vwCapital_LugarArupado]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwCapital_LugarArupado]
GO
/****** Object:  View [dbo].[vwCapital_LugarSeparado]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwCapital_LugarSeparado]
GO
/****** Object:  View [dbo].[vwInversion_tenenciaWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInversion_tenenciaWI]
GO
/****** Object:  View [dbo].[Inversion_Cripto_InstruWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Inversion_Cripto_InstruWI]
GO
/****** Object:  View [dbo].[capital_tipocripto_ResumenWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[capital_tipocripto_ResumenWI]
GO
/****** Object:  View [dbo].[Capital_TipoCriptoWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Capital_TipoCriptoWI]
GO
/****** Object:  View [dbo].[Capital_Cripto_ResumenWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Capital_Cripto_ResumenWI]
GO
/****** Object:  View [dbo].[Capital_CriptoWI]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Capital_CriptoWI]
GO
/****** Object:  View [dbo].[vwInversionesReales_Simuladas]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInversionesReales_Simuladas]
GO
/****** Object:  View [dbo].[vwInversionesReales_Simuladas2]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInversionesReales_Simuladas2]
GO
/****** Object:  Table [dbo].[InversionTemporal]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InversionTemporal]') AND type in (N'U'))
DROP TABLE [dbo].[InversionTemporal]
GO
/****** Object:  View [dbo].[vwCriptosDWB]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwCriptosDWB]
GO
/****** Object:  View [dbo].[vwInvEvolucion]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInvEvolucion]
GO
/****** Object:  View [dbo].[vwInversionEvolucion]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInversionEvolucion]
GO
/****** Object:  View [dbo].[vwInversionesTop]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInversionesTop]
GO
/****** Object:  View [dbo].[vwInversionesEsteAnio]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInversionesEsteAnio]
GO
/****** Object:  View [dbo].[vwCapital_TipoCriptoAgrupadas]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwCapital_TipoCriptoAgrupadas]
GO
/****** Object:  View [dbo].[vwCapital_TipoCriptoSeparadas]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwCapital_TipoCriptoSeparadas]
GO
/****** Object:  View [dbo].[vwInversion_tenencia]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwInversion_tenencia]
GO
/****** Object:  View [dbo].[Inversion_Cripto_Instru]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[Inversion_Cripto_Instru]
GO
/****** Object:  Table [dbo].[Instrumento]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Instrumento]') AND type in (N'U'))
DROP TABLE [dbo].[Instrumento]
GO
/****** Object:  Table [dbo].[Inversion]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inversion]') AND type in (N'U'))
DROP TABLE [dbo].[Inversion]
GO
/****** Object:  Table [dbo].[Criptomoneda]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Criptomoneda]') AND type in (N'U'))
DROP TABLE [dbo].[Criptomoneda]
GO
/****** Object:  View [dbo].[vwTenencia]    Script Date: 27/10/2022 12:03:53 ******/
DROP VIEW [dbo].[vwTenencia]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Wallet]') AND type in (N'U'))
DROP TABLE [dbo].[Wallet]
GO
/****** Object:  Table [dbo].[Exchange]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exchange]') AND type in (N'U'))
DROP TABLE [dbo].[Exchange]
GO
/****** Object:  Table [dbo].[NuevaTenencia]    Script Date: 27/10/2022 12:03:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NuevaTenencia]') AND type in (N'U'))
DROP TABLE [dbo].[NuevaTenencia]
GO
/****** Object:  Table [dbo].[NuevaTenencia]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NuevaTenencia](
	[idTenencia] [int] IDENTITY(1,1) NOT NULL,
	[Exchange] [varchar](50) NULL,
	[Wallet] [varchar](50) NULL,
 CONSTRAINT [PK_NuevaTenencia] PRIMARY KEY CLUSTERED 
(
	[idTenencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exchange]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exchange](
	[Nombre] [varchar](50) NOT NULL,
	[Nacional] [bit] NOT NULL,
	[Centralizado] [bit] NOT NULL,
	[Url] [varchar](50) NULL,
 CONSTRAINT [PK_Exchange] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[Nombre] [varchar](50) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Semilla] [varchar](250) NULL,
 CONSTRAINT [PK_Wallet] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwTenencia]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwTenencia]
AS
SELECT        dbo.NuevaTenencia.idTenencia, dbo.NuevaTenencia.Wallet, dbo.Wallet.Tipo, dbo.Wallet.Semilla, dbo.NuevaTenencia.Exchange, dbo.Exchange.Nacional, dbo.Exchange.Centralizado, dbo.Exchange.Url
,IIF(NuevaTenencia.wallet is  null, NuevaTenencia.exchange , NuevaTenencia.wallet) AS Lugar
FROM            dbo.Exchange RIGHT OUTER JOIN
                         dbo.NuevaTenencia ON dbo.Exchange.Nombre = dbo.NuevaTenencia.Exchange LEFT OUTER JOIN
                         dbo.Wallet ON dbo.NuevaTenencia.Wallet = dbo.Wallet.Nombre
GO
/****** Object:  Table [dbo].[Criptomoneda]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criptomoneda](
	[Nombre] [varchar](50) NOT NULL,
	[Ticker] [varchar](50) NOT NULL,
	[Precio] [float] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Logo] [image] NULL,
	[Capitalizacion] [float] NULL,
 CONSTRAINT [PK_Criptomoneda] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inversion]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inversion](
	[IdInversion] [int] IDENTITY(1,1) NOT NULL,
	[Instrumento] [varchar](50) NOT NULL,
	[Criptomoneda] [varchar](50) NOT NULL,
	[CriptomonedaGanada] [varchar](50) NOT NULL,
	[TasaEstimada] [float] NOT NULL,
	[TasaReal] [float] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL,
	[CantidadInvertida] [float] NOT NULL,
	[CantidadGanada] [float] NULL,
	[Lugar] [int] NULL,
	[PrecioInicio] [float] NOT NULL,
	[PrecioFin] [float] NULL,
	[Finalizado] [bit] NOT NULL,
 CONSTRAINT [PK_Inversion] PRIMARY KEY CLUSTERED 
(
	[IdInversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instrumento]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instrumento](
	[Nombre] [varchar](50) NOT NULL,
	[Bloqueado] [bit] NOT NULL,
	[InteresFijo] [bit] NOT NULL,
	[PagoDeInteres] [bit] NOT NULL,
 CONSTRAINT [PK_Instrumento] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Inversion_Cripto_Instru]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Inversion_Cripto_Instru]
AS
SELECT        dbo.Inversion.IdInversion, dbo.Inversion.Lugar, dbo.Inversion.Instrumento, dbo.Inversion.Criptomoneda, dbo.Inversion.CriptomonedaGanada, dbo.Inversion.TasaEstimada, dbo.Inversion.TasaReal, dbo.Inversion.FechaInicio, 
                         dbo.Inversion.FechaFin, dbo.Inversion.CantidadInvertida, dbo.Criptomoneda.Ticker, dbo.Instrumento.Nombre, dbo.Instrumento.Bloqueado, dbo.Instrumento.InteresFijo, dbo.Instrumento.PagoDeInteres, 
                         dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital
FROM            dbo.Criptomoneda RIGHT OUTER JOIN
                         dbo.Inversion ON dbo.Criptomoneda.Nombre = dbo.Inversion.Criptomoneda LEFT OUTER JOIN
                         dbo.Instrumento ON dbo.Inversion.Instrumento = dbo.Instrumento.Nombre
						 WHERE        (dbo.Inversion.FechaFin IS NULL) OR
                        (dbo.Inversion.FechaFin < GETDATE())

GO
/****** Object:  View [dbo].[vwInversion_tenencia]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInversion_tenencia]
AS
SELECT        dbo.Inversion.IdInversion, dbo.Inversion.Instrumento, dbo.Inversion.Criptomoneda, dbo.Inversion.CriptomonedaGanada, dbo.Inversion.TasaEstimada, dbo.Inversion.TasaReal, dbo.Inversion.FechaInicio, 
                         dbo.Inversion.FechaFin, dbo.Inversion.CantidadInvertida, dbo.Inversion.CantidadGanada, dbo.Inversion.Lugar, dbo.NuevaTenencia.idTenencia, dbo.NuevaTenencia.Exchange, dbo.NuevaTenencia.Wallet, 
                         dbo.Exchange.Centralizado, dbo.Exchange.Nacional, dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital
FROM            dbo.Exchange RIGHT OUTER JOIN
                         dbo.NuevaTenencia ON dbo.Exchange.Nombre = dbo.NuevaTenencia.Exchange RIGHT OUTER JOIN
                         dbo.Inversion ON dbo.NuevaTenencia.idTenencia = dbo.Inversion.Lugar LEFT OUTER JOIN
                         dbo.Criptomoneda ON dbo.Inversion.Criptomoneda = dbo.Criptomoneda.Nombre
WHERE        (dbo.Inversion.FechaFin IS NULL) OR
                         (dbo.Inversion.FechaFin < GETDATE()) OR
                         (dbo.Inversion.Finalizado <> 1)
GO
/****** Object:  View [dbo].[vwCapital_TipoCriptoSeparadas]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCapital_TipoCriptoSeparadas]
AS
SELECT        dbo.Inversion.IdInversion, dbo.Criptomoneda.Ticker, dbo.Criptomoneda.Tipo, dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital
FROM            dbo.Inversion INNER JOIN
                         dbo.Criptomoneda ON dbo.Inversion.Criptomoneda = dbo.Criptomoneda.Nombre
WHERE        (dbo.Inversion.FechaFin IS NULL) OR
                         (dbo.Inversion.FechaFin < GETDATE())
GO
/****** Object:  View [dbo].[vwCapital_TipoCriptoAgrupadas]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCapital_TipoCriptoAgrupadas]
AS
SELECT        Ticker, Tipo, SUM(Capital) AS Capital
FROM            dbo.vwCapital_TipoCriptoSeparadas
GROUP BY Ticker, Tipo
GO
/****** Object:  View [dbo].[vwInversionesEsteAnio]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInversionesEsteAnio]
AS
SELECT        IdInversion, Lugar, Instrumento, Criptomoneda, CriptomonedaGanada, TasaEstimada, TasaReal, FechaInicio, FechaFin, CantidadInvertida, CantidadGanada, Lugar AS Expr1
FROM            dbo.Inversion
WHERE        (YEAR(FechaFin) <= YEAR(GETDATE()))
GO
/****** Object:  View [dbo].[vwInversionesTop]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInversionesTop]
AS
SELECT        TOP (5) dbo.Inversion.Criptomoneda, dbo.Criptomoneda.Tipo, SUM(dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio) AS Capital
FROM            dbo.Inversion INNER JOIN
                         dbo.Criptomoneda ON dbo.Inversion.Criptomoneda = dbo.Criptomoneda.Nombre
WHERE        (YEAR(dbo.Inversion.FechaFin) <= YEAR(GETDATE()))
GROUP BY dbo.Inversion.Criptomoneda, dbo.Criptomoneda.Tipo
GO
/****** Object:  View [dbo].[vwInversionEvolucion]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInversionEvolucion]
AS
SELECT        dbo.Inversion.IdInversion, dbo.Inversion.FechaInicio, dbo.Inversion.FechaFin, dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.Criptomoneda.Tipo, dbo.Inversion.Criptomoneda
FROM            dbo.Inversion LEFT OUTER JOIN
                         dbo.Criptomoneda ON dbo.Inversion.Criptomoneda = dbo.Criptomoneda.Nombre
GO
/****** Object:  View [dbo].[vwInvEvolucion]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInvEvolucion]
AS
SELECT        YEAR(FechaInicio) AS Inicio, Tipo, SUM(Capital) AS Capital
FROM            dbo.vwInversionEvolucion
GROUP BY YEAR(FechaInicio), Tipo
GO
/****** Object:  View [dbo].[vwCriptosDWB]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCriptosDWB]
AS
SELECT        Nombre, UPPER(Ticker) AS Ticker, Precio, Tipo, Logo, Capitalizacion
FROM            dbo.Criptomoneda
GO
/****** Object:  Table [dbo].[InversionTemporal]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InversionTemporal](
	[IdInversion] [int] IDENTITY(1,1) NOT NULL,
	[Instrumento] [varchar](50) NOT NULL,
	[Criptomoneda] [varchar](50) NOT NULL,
	[CriptomonedaGanada] [varchar](50) NOT NULL,
	[TasaEstimada] [float] NOT NULL,
	[TasaReal] [float] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NULL,
	[CantidadInvertida] [float] NOT NULL,
	[CantidadGanada] [float] NULL,
	[Lugar] [int] NULL,
	[PrecioInicio] [float] NULL,
	[PrecioFin] [float] NULL,
	[Finalizado] [bit] NULL,
 CONSTRAINT [PK_InversionT] PRIMARY KEY CLUSTERED 
(
	[IdInversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwInversionesReales_Simuladas2]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInversionesReales_Simuladas2]
AS
SELECT        Inversion.*, 'Real' AS TipoInversion, Criptomoneda.Tipo, Criptomoneda.Ticker,dbo.vwTenencia.Lugar as LugarNombre
, Inversion.CantidadInvertida * Criptomoneda.Precio as CapitalActual

FROM            Inversion INNER JOIN
                         criptomoneda ON inversion.criptomoneda = criptomoneda.nombre  INNER JOIN
                         dbo.vwTenencia ON dbo.inversion.Lugar = dbo.vwTenencia.idTenencia
UNION
SELECT        InversionTemporal.*, 'Simulada' AS TipoInversion, Criptomoneda.Tipo, Criptomoneda.Ticker,dbo.vwTenencia.Lugar as LugarNombre
, InversionTemporal.CantidadInvertida * Criptomoneda.Precio as CapitalActual
FROM            InversionTemporal INNER JOIN
                         criptomoneda ON InversionTemporal.criptomoneda = criptomoneda.nombre INNER JOIN
                         dbo.vwTenencia ON dbo.InversionTemporal.Lugar = dbo.vwTenencia.idTenencia


GO
/****** Object:  View [dbo].[vwInversionesReales_Simuladas]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwInversionesReales_Simuladas] as
SELECT        Inversion.*, 'Real' AS TipoInversion, Criptomoneda.Tipo, Criptomoneda.Ticker, dbo.vwTenencia.Lugar AS LugarNombre, Inversion.CantidadInvertida * Criptomoneda.Precio AS CapitalActual
FROM            Inversion INNER JOIN
                         criptomoneda ON inversion.criptomoneda = criptomoneda.nombre INNER JOIN
                         dbo.vwTenencia ON dbo.inversion.Lugar = dbo.vwTenencia.idTenencia
UNION
SELECT        InversionTemporal.*, 'Simulada' AS TipoInversion, Criptomoneda.Tipo, Criptomoneda.Ticker, dbo.vwTenencia.Lugar AS LugarNombre, InversionTemporal.CantidadInvertida * Criptomoneda.Precio AS CapitalActual
FROM            InversionTemporal INNER JOIN
                         criptomoneda ON InversionTemporal.criptomoneda = criptomoneda.nombre INNER JOIN
                         dbo.vwTenencia ON dbo.InversionTemporal.Lugar = dbo.vwTenencia.idTenencia
GO
/****** Object:  View [dbo].[Capital_CriptoWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Capital_CriptoWI]
AS
SELECT        dbo.vwInversionesReales_Simuladas.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.Criptomoneda.Ticker, dbo.Criptomoneda.Tipo, dbo.vwTenencia.idTenencia, dbo.vwTenencia.Centralizado, 
                         dbo.vwTenencia.Lugar
FROM            dbo.vwInversionesReales_Simuladas INNER JOIN
                         dbo.Criptomoneda ON dbo.Criptomoneda.Nombre = dbo.vwInversionesReales_Simuladas.Criptomoneda INNER JOIN
                         dbo.vwTenencia ON dbo.vwInversionesReales_Simuladas.Lugar = dbo.vwTenencia.idTenencia
GO
/****** Object:  View [dbo].[Capital_Cripto_ResumenWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Capital_Cripto_ResumenWI]
AS
SELECT        Ticker, SUM(Capital) AS CapitalTotal, Tipo, idTenencia, Centralizado, Lugar
FROM            dbo.Capital_CriptoWI
GROUP BY Ticker, Tipo, idTenencia, Lugar, Centralizado
GO
/****** Object:  View [dbo].[Capital_TipoCriptoWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Capital_TipoCriptoWI]
AS
SELECT        dbo.vwInversionesReales_Simuladas.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.Criptomoneda.Tipo, dbo.Criptomoneda.Ticker, dbo.vwTenencia.idTenencia, dbo.vwTenencia.Lugar, 
                         dbo.vwTenencia.Centralizado
FROM            dbo.vwInversionesReales_Simuladas INNER JOIN
                         dbo.Criptomoneda ON dbo.vwInversionesReales_Simuladas.Criptomoneda = dbo.Criptomoneda.Nombre INNER JOIN
                         dbo.vwTenencia ON dbo.vwInversionesReales_Simuladas.Lugar = dbo.vwTenencia.idTenencia
WHERE        (dbo.vwInversionesReales_Simuladas.FechaFin IS NULL) OR
                         (dbo.vwInversionesReales_Simuladas.FechaFin > GETDATE())
GO
/****** Object:  View [dbo].[capital_tipocripto_ResumenWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	capital_tipocripto_Resumen*/
CREATE VIEW [dbo].[capital_tipocripto_ResumenWI]
AS
SELECT        Tipo, SUM(Capital) AS CapitalTotal, Ticker, idTenencia, Lugar, Centralizado
FROM            dbo.Capital_TipoCriptoWI
GROUP BY Tipo, Ticker, idTenencia, Lugar, Centralizado
GO
/****** Object:  View [dbo].[Inversion_Cripto_InstruWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Inversion_Cripto_InstruWI]
AS
SELECT        dbo.vwInversionesReales_Simuladas.IdInversion, dbo.vwInversionesReales_Simuladas.Lugar, dbo.vwInversionesReales_Simuladas.Instrumento, dbo.vwInversionesReales_Simuladas.Criptomoneda, 
                         dbo.vwInversionesReales_Simuladas.CriptomonedaGanada, dbo.vwInversionesReales_Simuladas.TasaEstimada, dbo.vwInversionesReales_Simuladas.TasaReal, dbo.vwInversionesReales_Simuladas.FechaInicio, 
                         dbo.vwInversionesReales_Simuladas.FechaFin, dbo.vwInversionesReales_Simuladas.CantidadInvertida, dbo.Criptomoneda.Ticker, dbo.Instrumento.Nombre, dbo.Instrumento.Bloqueado, dbo.Instrumento.InteresFijo, 
                         dbo.Instrumento.PagoDeInteres, dbo.vwInversionesReales_Simuladas.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.Criptomoneda.Tipo
FROM            dbo.Criptomoneda RIGHT OUTER JOIN
                         dbo.vwInversionesReales_Simuladas ON dbo.Criptomoneda.Nombre = dbo.vwInversionesReales_Simuladas.Criptomoneda LEFT OUTER JOIN
                         dbo.Instrumento ON dbo.vwInversionesReales_Simuladas.Instrumento = dbo.Instrumento.Nombre
WHERE        (dbo.vwInversionesReales_Simuladas.FechaFin IS NULL) OR
                         (dbo.vwInversionesReales_Simuladas.FechaFin < GETDATE())
GO
/****** Object:  View [dbo].[vwInversion_tenenciaWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInversion_tenenciaWI]
AS
SELECT        dbo.vwInversionesReales_Simuladas.IdInversion, dbo.vwInversionesReales_Simuladas.Instrumento, dbo.vwInversionesReales_Simuladas.Criptomoneda, dbo.vwInversionesReales_Simuladas.CriptomonedaGanada, 
                         dbo.vwInversionesReales_Simuladas.TasaEstimada, dbo.vwInversionesReales_Simuladas.TasaReal, dbo.vwInversionesReales_Simuladas.FechaInicio, dbo.vwInversionesReales_Simuladas.FechaFin, 
                         dbo.vwInversionesReales_Simuladas.CantidadInvertida, dbo.vwInversionesReales_Simuladas.CantidadGanada, dbo.vwInversionesReales_Simuladas.Lugar, dbo.NuevaTenencia.idTenencia, dbo.NuevaTenencia.Exchange, 
                         dbo.NuevaTenencia.Wallet, dbo.Exchange.Centralizado, dbo.Exchange.Nacional, dbo.vwInversionesReales_Simuladas.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.Criptomoneda.Ticker, 
                         dbo.Criptomoneda.Tipo
FROM            dbo.Exchange RIGHT OUTER JOIN
                         dbo.NuevaTenencia ON dbo.Exchange.Nombre = dbo.NuevaTenencia.Exchange RIGHT OUTER JOIN
                         dbo.vwInversionesReales_Simuladas ON dbo.NuevaTenencia.idTenencia = dbo.vwInversionesReales_Simuladas.Lugar LEFT OUTER JOIN
                         dbo.Criptomoneda ON dbo.vwInversionesReales_Simuladas.Criptomoneda = dbo.Criptomoneda.Nombre
WHERE        (dbo.vwInversionesReales_Simuladas.FechaFin IS NULL) OR
                         (dbo.vwInversionesReales_Simuladas.FechaFin < GETDATE())
GO
/****** Object:  View [dbo].[vwCapital_LugarSeparado]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCapital_LugarSeparado]
AS
SELECT        dbo.Inversion.IdInversion, dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.vwTenencia.Lugar
FROM            dbo.Inversion INNER JOIN
                         dbo.Criptomoneda ON dbo.Inversion.Criptomoneda = dbo.Criptomoneda.Nombre INNER JOIN
                         dbo.vwTenencia ON dbo.Inversion.Lugar = dbo.vwTenencia.idTenencia
WHERE        (dbo.Inversion.FechaFin IS NULL) OR
                         (dbo.Inversion.FechaFin < GETDATE())
GO
/****** Object:  View [dbo].[vwCapital_LugarArupado]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCapital_LugarArupado]
AS
SELECT        Lugar, SUM(Capital) AS Capital
FROM            dbo.vwCapital_LugarSeparado
GROUP BY Lugar
GO
/****** Object:  View [dbo].[EvolucionInversionesTipoCripto]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[EvolucionInversionesTipoCripto] as
select IdInversion,year(FechaInicio) as Inicio,year(FechaFin)as Fin, Tipo,(CantidadInvertida * Precio) as Capital
from Inversion inner join Criptomoneda on Inversion.Criptomoneda = Criptomoneda.Nombre
GO
/****** Object:  View [dbo].[vwTenenciaWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwTenenciaWI]
AS
SELECT        IdInversion, Instrumento, Criptomoneda, FechaInicio, FechaFin, vwTenencia.Lugar
FROM            InversionTemporal JOIN
                         vwTenencia ON InversionTemporal.Lugar = vwTenencia.idTenencia
UNION
SELECT        IdInversion, Instrumento, Criptomoneda, FechaInicio, FechaFin, vwTenencia.Lugar
FROM            Inversion JOIN
                         vwTenencia ON Inversion.Lugar = vwTenencia.idTenencia
GO
/****** Object:  View [dbo].[vwLugaresUtilizadosWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE VIEW vwTenenciaWI AS
--(
--select IdInversion,Instrumento,Criptomoneda,FechaInicio,FechaFin,vwTenencia.Lugar from InversionTemporal join vwTenencia 
--on InversionTemporal.Lugar = vwTenencia.idTenencia
--UNION
--select IdInversion,Instrumento,Criptomoneda,FechaInicio,FechaFin,vwTenencia.Lugar from Inversion join vwTenencia 
--on Inversion.Lugar = vwTenencia.idTenencia
--)
--on (InversionTemporal.Lugar = vwTenencia.Wallet or InversionTemporal.Lugar = vwTenencia.Exchange)
create view [dbo].[vwLugaresUtilizadosWI] as
select Distinct(Lugar) from vwTenenciaWI
GO
/****** Object:  View [dbo].[vwCapital_LugarSeparadoWI]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* vwInversionesReales_Simuladas
11*/
CREATE VIEW [dbo].[vwCapital_LugarSeparadoWI]
AS
SELECT        dbo.vwInversionesReales_Simuladas.IdInversion, dbo.vwInversionesReales_Simuladas.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.vwTenencia.Lugar, dbo.vwTenencia.idTenencia, 
                         dbo.vwInversionesReales_Simuladas.Ticker, dbo.vwInversionesReales_Simuladas.Tipo
FROM            dbo.vwInversionesReales_Simuladas INNER JOIN
                         dbo.Criptomoneda ON dbo.vwInversionesReales_Simuladas.Criptomoneda = dbo.Criptomoneda.Nombre INNER JOIN
                         dbo.vwTenencia ON dbo.vwInversionesReales_Simuladas.Lugar = dbo.vwTenencia.idTenencia
WHERE        (dbo.vwInversionesReales_Simuladas.FechaFin IS NULL) OR
                         (dbo.vwInversionesReales_Simuladas.FechaFin < GETDATE())
GO
/****** Object:  View [dbo].[vwInversionDetalle]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInversionDetalle]
AS
SELECT        dbo.Inversion.IdInversion, dbo.Inversion.Instrumento, dbo.Inversion.Criptomoneda, dbo.Inversion.CriptomonedaGanada, dbo.Inversion.TasaEstimada, dbo.Inversion.TasaReal, dbo.Inversion.FechaInicio, 
                         dbo.Inversion.FechaFin, dbo.Inversion.CantidadInvertida, dbo.Inversion.CantidadGanada, dbo.Inversion.Lugar, dbo.Inversion.PrecioInicio, dbo.Inversion.PrecioFin, dbo.Inversion.Finalizado, dbo.Instrumento.Bloqueado, 
                         dbo.Exchange.Centralizado, dbo.NuevaTenencia.idTenencia, dbo.NuevaTenencia.Exchange, dbo.NuevaTenencia.Wallet, dbo.Criptomoneda.Ticker, dbo.Criptomoneda.Precio, dbo.Criptomoneda.Tipo, dbo.Criptomoneda.Logo, 
                         dbo.Criptomoneda.Capitalizacion
FROM            dbo.Criptomoneda RIGHT OUTER JOIN
                         dbo.NuevaTenencia INNER JOIN
                         dbo.Inversion ON dbo.NuevaTenencia.idTenencia = dbo.Inversion.Lugar ON dbo.Criptomoneda.Nombre = dbo.Inversion.Criptomoneda LEFT OUTER JOIN
                         dbo.Wallet INNER JOIN
                         dbo.Exchange INNER JOIN
                         dbo.Instrumento ON dbo.Exchange.Nombre = dbo.Instrumento.Nombre ON dbo.Wallet.Nombre = dbo.Instrumento.Nombre ON dbo.NuevaTenencia.Exchange = dbo.Exchange.Nombre AND 
                         dbo.NuevaTenencia.Wallet = dbo.Wallet.Nombre AND dbo.Inversion.Instrumento = dbo.Instrumento.Nombre
GO
/****** Object:  View [dbo].[Capital_TipoCripto]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Capital_TipoCripto]
AS
SELECT        dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.Criptomoneda.Tipo
FROM            dbo.Inversion INNER JOIN
                         dbo.Criptomoneda ON dbo.Inversion.Criptomoneda = dbo.Criptomoneda.Nombre
WHERE        (dbo.Inversion.FechaFin IS NULL) OR
                         (dbo.Inversion.FechaFin > GETDATE())
GO
/****** Object:  View [dbo].[capital_tipocripto_Resumen]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create view [dbo].[capital_tipocripto_Resumen] as 
	SELECT Tipo , sum(capital) as CapitalTotal
	from capital_tipocripto
	group by Tipo

--	capital_tipocripto_Resumen
GO
/****** Object:  View [dbo].[Capital_Cripto]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Capital_Cripto]
AS
SELECT        dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.Criptomoneda.Ticker
FROM            dbo.Criptomoneda INNER JOIN
                         dbo.Inversion ON dbo.Criptomoneda.Nombre = dbo.Inversion.Criptomoneda
GO
/****** Object:  View [dbo].[Capital_Cripto_Resumen]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Capital_Cripto_Resumen]
AS
SELECT        Ticker, SUM(Capital) AS CapitalTotal
FROM            dbo.Capital_Cripto
GROUP BY Ticker
GO
/****** Object:  View [dbo].[vwCriptomoneda]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCriptomoneda]
AS
SELECT        dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital, dbo.Criptomoneda.Ticker, IIF(inversion.FechaFin <= GETDATE(), 'Finalizada', 'En Proceso') AS Estado, dbo.Inversion.*
FROM            dbo.Criptomoneda INNER JOIN
                         dbo.Inversion ON dbo.Criptomoneda.Nombre = dbo.Inversion.Criptomoneda
GO
/****** Object:  View [dbo].[Inversion_Cripto_Instr]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Inversion_Cripto_Instr]
AS
SELECT        dbo.Inversion.IdInversion, dbo.Inversion.Lugar, dbo.Inversion.Instrumento, dbo.Inversion.Criptomoneda, dbo.Inversion.CriptomonedaGanada, dbo.Inversion.TasaEstimada, dbo.Inversion.TasaReal, dbo.Inversion.FechaInicio, 
                         dbo.Inversion.FechaFin, dbo.Inversion.CantidadInvertida, dbo.Criptomoneda.Ticker, dbo.Instrumento.Nombre, dbo.Instrumento.Bloqueado, dbo.Instrumento.InteresFijo, dbo.Instrumento.PagoDeInteres, 
                         dbo.Inversion.CantidadInvertida * dbo.Criptomoneda.Precio AS Capital
FROM            dbo.Criptomoneda RIGHT OUTER JOIN
                         dbo.Inversion ON dbo.Criptomoneda.Nombre = dbo.Inversion.Criptomoneda LEFT OUTER JOIN
                         dbo.Instrumento ON dbo.Inversion.Instrumento = dbo.Instrumento.Nombre
GO
/****** Object:  View [dbo].[vwInformeTenencia]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwInformeTenencia] as
select vwTenencia.Lugar, SUM(vwInversion_tenencia.Capital) as Capital, count(vwInversion_tenencia.IdInversion) as Cantidad ,
iif(vwTenencia.Wallet is null,'Exchange','Wallet' ) as Tipo
from vwTenencia left join vwInversion_tenencia
on vwTenencia.idTenencia = vwInversion_tenencia.Lugar
group by vwTenencia.Lugar ,Tipo,vwTenencia.Wallet

-- select * from vwTenencia
--10
-- select * from vwTenencia
--16
GO
/****** Object:  Table [dbo].[TipoCriptomoneda]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCriptomoneda](
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoCriptomonedaA_1] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeWallet]    Script Date: 27/10/2022 12:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeWallet](
	[TipoWallet] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDeWallet] PRIMARY KEY CLUSTERED 
(
	[TipoWallet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'0x', N'zrx', 0.29382, N'Volátil', NULL, 248926852)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'1inch', N'1inch', 0.690251, N'Volátil', NULL, 400829305)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Aave', N'aave', 86.83, N'Volátil', NULL, 1216396872)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Alchemix USD', N'alusd', 1, N'Volátil', NULL, 181029046)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Algorand', N'algo', 0.30305, N'Volátil', NULL, 2089840875)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Amp', N'amp', 0.00603942, N'Volátil', NULL, 465077019)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Ankr', N'ankr', 0.03461721, N'Volátil', NULL, 282373976)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'ApeCoin', N'ape', 4.73, N'Volátil', NULL, 1486418784)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'APENFT', N'nft', 5.81405E-07, N'Volátil', NULL, 160952303)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Arweave', N'ar', 10.12, N'Volátil', NULL, 506563442)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Audius', N'audio', 0.283406, N'Volátil', NULL, 234117717)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Avalanche', N'avax', 18.85, N'Volátil', NULL, 5555031268)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Axie Infinity', N'axs', 15.32, N'Volátil', NULL, 1380371589)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Baby Doge Coin', N'babydoge', 1.204E-09, N'Volátil', NULL, 191960287)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Balancer', N'bal', 7.17, N'Volátil', NULL, 257554872)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Basic Attention', N'bat', 0.334762, N'Volátil', NULL, 501129623)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Basic Attention Token', N'bat', 0.412889, N'Volátil', NULL, 620510520)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Binance USD', N'busd', 1, N'Estable', NULL, 19550002152)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Bitcoin', N'btc', 19798.36, N'Volátil', NULL, 378825879300)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Bitcoin Cash', N'bch', 117.38, N'Volátil', NULL, 2250203045)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Bitcoin Gold', N'btg', 22.56, N'Volátil', NULL, 395042606)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Bitcoin SV', N'bsv', 52.54, N'Volátil', NULL, 1005806604)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'BitDAO', N'bit', 0.62664, N'Volátil', NULL, 654537103)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'BitTorrent', N'btt', 8.79111E-07, N'Volátil', NULL, 825287146)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'BNB', N'bnb', 277.24, N'Volátil', NULL, 45242232346)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Cardano', N'ada', 0.481572, N'Volátil', NULL, 16302897160)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Casper Network', N'cspr', 0.02773196, N'Volátil', NULL, 165439500)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'cDAI', N'cdai', 0.02204194, N'Volátil', NULL, 687513121)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Celo', N'celo', 0.826375, N'Volátil', NULL, 381730874)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Celsius Network', N'cel', 1.51, N'Volátil', NULL, 635171029)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'cETH', N'ceth', 31.26, N'Volátil', NULL, 810981945)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Chain', N'xcn', 0.077764, N'Volátil', NULL, 1665728939)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Chainlink', N'link', 6.83, N'Volátil', NULL, 3196429413)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Chia', N'xch', 36.9, N'Volátil', NULL, 183983967)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Chiliz', N'chz', 0.217129, N'Volátil', NULL, 1161994530)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Coinmetro', N'xcm', 0.59717, N'Volátil', NULL, 180505338)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Compound', N'comp', 47.81, N'Volátil', NULL, 327932994)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Constellation', N'dag', 0.076784, N'Volátil', NULL, 200182386)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Convex CRV', N'cvxcrv', 1.02, N'Volátil', NULL, 287488061)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Convex Finance', N'cvx', 5.12, N'Volátil', NULL, 344098277)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Cosmos Hub', N'atom', 12.67, N'Volátil', NULL, 3708005250)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Cronos', N'cro', 0.119338, N'Volátil', NULL, 3012786087)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Curve DAO', N'crv', 1.07, N'Volátil', NULL, 418991270)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'cUSDC', N'cusdc', 0.02265652, N'Estable', NULL, 956027585)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'cUSDT', N'cusdt', 0.0219708, N'Estable', NULL, 379237620)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Dai', N'dai', 0.998574, N'Estable', NULL, 6533280923)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'DAO Maker', N'dao', 1.71, N'Volátil', NULL, 191710767)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Dash', N'dash', 46.75, N'Volátil', NULL, 509121508)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Decentraland', N'mana', 0.789386, N'Volátil', NULL, 1429950266)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Decred', N'dcr', 30.49, N'Volátil', NULL, 436358582)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'DeFiChain', N'dfi', 1.085, N'Volátil', NULL, 629549626)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'DigiByte', N'dgb', 0.01040954, N'Volátil', NULL, 162433398)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Dogecoin', N'doge', 0.062689, N'Volátil', NULL, 8314196607)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Dogelon Mars', N'elon', 2.8315E-07, N'Volátil', NULL, 155109099)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'dYdX', N'dydx', 1.56, N'Volátil', NULL, 188844464)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'eCash', N'xec', 4.518E-05, N'Volátil', NULL, 865950541)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'ECOMI', N'omi', 0.00135936, N'Volátil', NULL, 385966560)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Elrond', N'egld', 51.11, N'Volátil', NULL, 1170433409)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Energy Web', N'ewt', 4.02, N'Volátil', NULL, 173234846)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Enjin Coin', N'enj', 0.521381, N'Volátil', NULL, 486979221)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'EOS', N'eos', 1.53, N'Volátil', NULL, 1539061523)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Ergo', N'erg', 4.31, N'Volátil', NULL, 257074113)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Escoin', N'elg', 3.08, N'Volátil', NULL, 228752259)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Ethereum', N'eth', 1555.57, N'Volátil', NULL, 187107477301)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Ethereum Classic', N'etc', 32.34, N'Volátil', NULL, 4421461039)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Ethereum Name Service', N'ens', 14.01, N'Volátil', NULL, 360899989)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Euro Tether', N'eurt', 0.997442, N'Volátil', NULL, 206135486)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Evmos', N'evmos', 2.54, N'Volátil', NULL, 730803182)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Fantom', N'ftm', 0.266654, N'Volátil', NULL, 677077786)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Filecoin', N'fil', 6.48, N'Volátil', NULL, 1781696416)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Flow', N'flow', 1.95, N'Volátil', NULL, 2024631719)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Flux', N'flux', 1.003, N'Volátil', NULL, 259484636)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Frax', N'frax', 0.995574, N'Volátil', NULL, 1485666867)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Frax Share', N'fxs', 6.02, N'Volátil', NULL, 434128303)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'FTX', N'ftt', 26.16, N'Volátil', NULL, 3508854863)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'FTX Token', N'ftt', 30.46, N'Volátil', NULL, 4157123340)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Gala', N'gala', 0.050458, N'Volátil', NULL, 380428106)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Gate', N'gt', 4.25, N'Volátil', NULL, 617226473)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'GateToken', N'gt', 5.86, N'Volátil', NULL, 888142508)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Gemini Dollar', N'gusd', 0.994604, N'Volátil', NULL, 344323602)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'GMX', N'gmx', 52, N'Volátil', NULL, 414688616)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Gnosis', N'gno', 153.8, N'Volátil', NULL, 396283952)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Golem', N'glm', 0.240079, N'Volátil', NULL, 239964227)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Harmony', N'one', 0.02015659, N'Volátil', NULL, 248026755)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Hedera', N'hbar', 0.061127, N'Volátil', NULL, 1402894970)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Helium', N'hnt', 4.16, N'Volátil', NULL, 527737767)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Hive', N'hive', 0.549577, N'Volátil', NULL, 204015399)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Holo', N'hot', 0.00205878, N'Volátil', NULL, 365528376)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Horizen', N'zen', 15.53, N'Volátil', NULL, 198388228)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Huobi', N'ht', 4.71, N'Volátil', NULL, 721873575)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Huobi BTC', N'hbtc', 19821.03, N'Volátil', NULL, 770485572)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Huobi Token', N'ht', 7, N'Volátil', NULL, 1084328377)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'ICON', N'icx', 0.266696, N'Volátil', NULL, 211571378)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Immutable X', N'imx', 0.824029, N'Volátil', NULL, 193765324)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Internet Computer', N'icp', 6.45, N'Volátil', NULL, 1648968800)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'IOST', N'iost', 0.01288188, N'Volátil', NULL, 300919958)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'IOTA', N'miota', 0.279924, N'Volátil', NULL, 777792813)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'IoTeX', N'iotx', 0.02977769, N'Volátil', NULL, 281635850)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'JUNO', N'juno', 5.15, N'Volátil', NULL, 301786160)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'JUST', N'jst', 0.02735075, N'Volátil', NULL, 243298319)
GO
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Kadena', N'kda', 1.56, N'Volátil', NULL, 309373436)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Kava', N'kava', 1.68, N'Volátil', NULL, 421021113)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Klaytn', N'klay', 0.229009, N'Volátil', NULL, 690078556)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'KuCoin', N'kcs', 9.18, N'Volátil', NULL, 897300079)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'KuCoin Token', N'kcs', 16.83, N'Volátil', NULL, 1647245170)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Kusama', N'ksm', 48.69, N'Volátil', NULL, 437155372)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Kyber Network Crystal', N'knc', 1.7, N'Volátil', NULL, 174317826)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'LEO Token', N'leo', 5.19, N'Volátil', NULL, 4849296626)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Lido DAO', N'ldo', 2, N'Volátil', NULL, 1200350269)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Lido Staked Ether', N'steth', 1505.87, N'Volátil', NULL, 6472385512)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'LINK', N'ln', 34.89, N'Volátil', NULL, 218468667)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Liquity USD', N'lusd', 1.015, N'Volátil', NULL, 185329753)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Lisk', N'lsk', 1.062, N'Volátil', NULL, 153766382)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Litecoin', N'ltc', 59.95, N'Volátil', NULL, 4258406751)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Livepeer', N'lpt', 10.15, N'Volátil', NULL, 265801303)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'LooksRare', N'looks', 0.27233, N'Volátil', NULL, 148394882)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Loopring', N'lrc', 0.354107, N'Volátil', NULL, 441123881)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Magic Internet Money', N'mim', 0.997291, N'Volátil', NULL, 224205670)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Maiar DEX', N'mex', 5.329E-05, N'Volátil', NULL, 313947531)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Maker', N'mkr', 741.33, N'Volátil', NULL, 667619403)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Marinade staked SOL', N'msol', 33.05, N'Volátil', NULL, 221985497)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Merit Circle', N'mc', 0.706203, N'Volátil', NULL, 198459769)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Microsoft', N'MSFT', 7558.5, N'Acción', NULL, 119000000)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Mina Protocol', N'mina', 0.672119, N'Volátil', NULL, 395072410)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Monero', N'xmr', 154.08, N'Volátil', NULL, 2794850213)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Moonbeam', N'glmr', 0.526449, N'Volátil', NULL, 190990168)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'MXC', N'mxc', 0.069904, N'Volátil', NULL, 170315124)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'NEAR Protocol', N'near', 4.16, N'Volátil', NULL, 3226303766)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'NEM', N'xem', 0.04363896, N'Volátil', NULL, 392608981)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'NEO', N'neo', 9.14, N'Volátil', NULL, 644723573)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Neutrino USD', N'usdn', 0.933235, N'Estable', NULL, 639523075)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'NEXO', N'nexo', 1.035, N'Volátil', NULL, 578886044)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Nexus Mutual', N'nxm', 49.68, N'Volátil', NULL, 337087233)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'NuCypher', N'nu', 0.16292, N'Volátil', NULL, 202650014)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Oasis Network', N'rose', 0.062611, N'Volátil', NULL, 314660768)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'OKB', N'okb', 15.22, N'Volátil', NULL, 3898143993)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'OKC', N'okt', 16.58, N'Volátil', NULL, 286315276)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Olympus', N'ohm', 11.17, N'Volátil', NULL, 291041372)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'OMG Network', N'omg', 1.79, N'Volátil', NULL, 251447250)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Ontology', N'ont', 0.240252, N'Volátil', NULL, 210314089)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Optimism', N'op', 1.19, N'Volátil', NULL, 256537929)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Osmosis', N'osmo', 1.21, N'Volátil', NULL, 534331364)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'PancakeSwap', N'cake', 4.02, N'Volátil', NULL, 567343876)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Pax Dollar', N'usdp', 0.998459, N'Estable', NULL, 963848204)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'PAX Gold', N'paxg', 1704.89, N'Commodity ', NULL, 556235306)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'PlayDapp', N'pla', 0.35771, N'Volátil', NULL, 151593549)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'PLEX', N'plex', 0.650622, N'Volátil', NULL, 183771331)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Pocket Network', N'pokt', 0.128394, N'Volátil', NULL, 157387326)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Polkadot', N'dot', 7.27, N'Volátil', NULL, 8338951893)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Polygon', N'matic', 0.887392, N'Volátil', NULL, 6593032193)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Polymath', N'poly', 0.189513, N'Volátil', NULL, 170150979)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Qtum', N'qtum', 3.15, N'Volátil', NULL, 329027271)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Quant', N'qnt', 93.37, N'Volátil', NULL, 1252027312)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Radix', N'xrd', 0.056059, N'Volátil', NULL, 559077149)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Ravencoin', N'rvn', 0.02879887, N'Volátil', NULL, 334406439)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Reserve Rights', N'rsr', 0.00622828, N'Volátil', NULL, 263277982)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Rocket Pool', N'rpl', 23.66, N'Volátil', NULL, 383111308)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'SafeMoon', N'sfm', 0.00037692, N'Volátil', NULL, 210619305)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'SafeMoon [OLD]', N'safemoon', 5.359E-09, N'Volátil', NULL, 277800683)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Secret', N'scrt', 1.062, N'Volátil', NULL, 190503925)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Serum', N'srm', 0.781121, N'Volátil', NULL, 290747483)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Shiba Inu', N'shib', 1.229E-05, N'Volátil', NULL, 7262577567)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Siacoin', N'sc', 0.00398484, N'Volátil', NULL, 205032525)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'SKALE', N'skl', 0.04857999, N'Volátil', NULL, 179878458)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Smooth Love Potion', N'slp', 0.00404621, N'Volátil', NULL, 161520522)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Solana', N'sol', 31.12, N'Volátil', NULL, 10874780405)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Songbird', N'sgb', 0.02662185, N'Volátil', NULL, 223679795)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Stacks', N'stx', 0.361919, N'Volátil', NULL, 481606382)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Stellar', N'xlm', 0.105297, N'Volátil', NULL, 2662247018)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'STEPN', N'gmt', 0.676478, N'Volátil', NULL, 406020441)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Sushi', N'sushi', 1.13, N'Volátil', NULL, 217542352)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'SwissBorg', N'chsb', 0.161675, N'Volátil', NULL, 153836054)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'SXP', N'sxp', 0.372736, N'Volátil', NULL, 184983177)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Synapse', N'syn', 1.27, N'Volátil', NULL, 237646157)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Synthetix Network', N'snx', 2.93, N'Volátil', NULL, 692653366)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Synthetix Network Token', N'snx', 2.85, N'Volátil', NULL, 635001617)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Tenset', N'10set', 2.33, N'Volátil', NULL, 428717732)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Terra', N'luna', 1.83, N'Volátil', NULL, 299978381)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'TerraClassicUSD', N'ustc', 0.03185497, N'Volátil', NULL, 312764821)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'TerraUSD', N'ust', 0.070654, N'Volátil', NULL, 792570179)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Tesla Token', N'tsl', 994, N'Acción', NULL, 1020000000000.21)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Tether', N'usd', 0.999236, N'Estable', NULL, 67522922779)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Tether Gold', N'xaut', 1710.56, N'Volátil', NULL, 421272521)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Tezos', N'xtz', 1.52, N'Volátil', NULL, 1368537520)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'The Graph', N'grt', 0.101498, N'Volátil', NULL, 751641710)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'The Sandbox', N'sand', 0.93162, N'Volátil', NULL, 1370898594)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Theta Fuel', N'tfuel', 0.056874, N'Volátil', NULL, 331776760)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Theta Network', N'theta', 1.15, N'Volátil', NULL, 1144032296)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'THORChain', N'rune', 1.89, N'Volátil', NULL, 569577236)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Tokenize Xchange', N'tkx', 5.3, N'Volátil', NULL, 425024704)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'TRON', N'trx', 0.063161, N'Volátil', NULL, 5833141937)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'TrueUSD', N'tusd', 0.999563, N'Estable', NULL, 1060300806)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Trust Wallet', N'twt', 0.968188, N'Volátil', NULL, 403088358)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'UMA', N'uma', 2.74, N'Volátil', NULL, 188124937)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Uniswap', N'uni', 6.3, N'Volátil', NULL, 2877227415)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'USD Coin', N'usdc', 0.999763, N'Estable', NULL, 51805855509)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'USDD', N'usdd', 0.999891, N'Volátil', NULL, 724316607)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'VeChain', N'vet', 0.02419731, N'Volátil', NULL, 1755376547)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Voyager VGX', N'vgx', 0.537515, N'Volátil', NULL, 156950967)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'VVS Finance', N'vvs', 6.09E-06, N'Volátil', NULL, 154772394)
GO
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Waves', N'waves', 4.52, N'Volátil', NULL, 452029226)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'WAX', N'waxp', 0.096126, N'Volátil', NULL, 205801953)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'WOO Network', N'woo', 0.152112, N'Volátil', NULL, 174725271)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Wrapped Bitcoin', N'wbtc', 19850.19, N'Volátil', NULL, 4923509962)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'XDC Network', N'xdc', 0.0257212, N'Volátil', NULL, 353571645)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'yearn.finance', N'yfi', 9802.57, N'Volátil', NULL, 309689096)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Zcash', N'zec', 62.58, N'Volátil', NULL, 800365628)
INSERT [dbo].[Criptomoneda] ([Nombre], [Ticker], [Precio], [Tipo], [Logo], [Capitalizacion]) VALUES (N'Zilliqa', N'zil', 0.03567464, N'Volátil', NULL, 527016005)
GO
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'Binance', 0, 1, N'https://binance.com/')
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'BuenBit', 1, 1, N'https://www.buenbit.com/')
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'CoinBase', 0, 1, N'https://www.coinbase.com/es')
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'Kava', 0, 0, N'https://www.kava.io/')
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'Kucoin', 0, 0, N'https://www.kucoin.com/es')
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'LetsBit', 1, 1, N'https://letsbit.io/')
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'LordToken', 0, 1, N'https://lordtoken.com/es')
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'Nexo', 0, 1, N'https://nexo.io/')
INSERT [dbo].[Exchange] ([Nombre], [Nacional], [Centralizado], [Url]) VALUES (N'Ripio', 1, 1, N'https://www.ripio.com/ar/')
GO
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Ahorros Bloqueados', 1, 1, 1)
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Ahorros Flexibles', 0, 0, 1)
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Alquiler NFT', 0, 0, 1)
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Farming', 0, 0, 1)
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Holding', 0, 0, 0)
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Indice', 0, 0, 0)
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Pool de liquidez', 0, 0, 1)
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Proof of Stake', 0, 0, 1)
INSERT [dbo].[Instrumento] ([Nombre], [Bloqueado], [InteresFijo], [PagoDeInteres]) VALUES (N'Stacking', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Inversion] ON 

INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (6, N'Ahorros Bloqueados', N'Bitcoin', N'Bitcoin', 0, 0, CAST(N'2022-01-05' AS Date), CAST(N'2022-09-01' AS Date), 2.62, NULL, 1, 45300, 29100, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (7, N'Holding', N'Ethereum', N'Ethereum', 0, 0, CAST(N'2022-04-16' AS Date), NULL, 45, NULL, 5, 1555.57, NULL, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (8, N'Ahorros Flexibles', N'Tether', N'Theter', 8, 8, CAST(N'2021-04-16' AS Date), CAST(N'2022-04-16' AS Date), 45876, 36, 2, 1, 1.1, 1)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (9, N'Stacking', N'Tesla Token', N'Tesla Token', 30, 6, CAST(N'2022-02-16' AS Date), CAST(N'2022-11-05' AS Date), 40, NULL, 3, 994, 1093.4, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (10, N'Stacking', N'PAX Gold', N'PAX Gold', 6, 7, CAST(N'2022-02-16' AS Date), CAST(N'2022-04-20' AS Date), 1, NULL, 4, 1872.45, 2059.695, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (11, N'Ahorros Bloqueados', N'Tesla Token', N'Tesla Token', 4, 4, CAST(N'2022-05-19' AS Date), NULL, 31, NULL, 4, 994, 1093.4, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (12, N'Ahorros Bloqueados', N'USD Coin', N'USD Coin', 8, 0, CAST(N'2022-09-12' AS Date), CAST(N'2022-05-25' AS Date), 21000, NULL, 2, 1.002, 1.1022, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (13, N'Farming', N'USD Coin', N'USD Coin', 3, 1, CAST(N'2022-06-06' AS Date), CAST(N'2023-02-08' AS Date), 26000, NULL, 3, 0.999763, NULL, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (14, N'Stacking', N'Dai', N'Dai', 15, 0, CAST(N'2017-06-06' AS Date), CAST(N'2022-09-30' AS Date), 40000, NULL, 11, 1.002, 1.1022, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (15, N'Ahorros Bloqueados', N'PAX Gold', N'PAX Gold', 2, 0, CAST(N'2022-06-06' AS Date), CAST(N'2023-01-05' AS Date), 1, NULL, 16, 1872.45, 2059.695, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (1016, N'Ahorros Flexibles', N'PAX Gold', N'PAX Gold', 6, 0, CAST(N'2022-09-01' AS Date), NULL, 32, NULL, 7, 1872.45, NULL, 0)
INSERT [dbo].[Inversion] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (1019, N'Ahorros Bloqueados', N'Litecoin', N'Litecoin', 3, 0, CAST(N'2022-10-19' AS Date), CAST(N'2022-12-29' AS Date), 1000, NULL, 12, 59.95, NULL, 0)
SET IDENTITY_INSERT [dbo].[Inversion] OFF
GO
SET IDENTITY_INSERT [dbo].[InversionTemporal] ON 

INSERT [dbo].[InversionTemporal] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (4, N'Holding', N'Amp', N'Amp', 3, 1, CAST(N'2019-06-08' AS Date), CAST(N'2022-06-23' AS Date), 2333, NULL, 7, NULL, NULL, NULL)
INSERT [dbo].[InversionTemporal] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (6, N'Alquiler NFT', N'Neutrino USD', N'Neutrino USD', 8, 1, CAST(N'2021-06-08' AS Date), CAST(N'2022-06-08' AS Date), 25100, NULL, 15, NULL, NULL, NULL)
INSERT [dbo].[InversionTemporal] ([IdInversion], [Instrumento], [Criptomoneda], [CriptomonedaGanada], [TasaEstimada], [TasaReal], [FechaInicio], [FechaFin], [CantidadInvertida], [CantidadGanada], [Lugar], [PrecioInicio], [PrecioFin], [Finalizado]) VALUES (9, N'Ahorros Flexibles', N'Binance USD', N'Binance USD', 0, 0, CAST(N'2022-09-04' AS Date), NULL, 9845, NULL, 7, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[InversionTemporal] OFF
GO
SET IDENTITY_INSERT [dbo].[NuevaTenencia] ON 

INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (1, NULL, N'Ledger')
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (2, NULL, N'MetaMask')
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (3, NULL, N'Trezor')
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (4, N'Binance', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (5, N'Kava', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (6, N'Kucoin', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (7, N'Nexo', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (8, N'CoinBase', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (9, N'BuenBit', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (10, N'LetsBit', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (11, N'Ripio', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (12, N'LordToken', NULL)
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (14, NULL, N'CoolWallet')
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (15, NULL, N'KeepKey')
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (16, NULL, N'electrum')
INSERT [dbo].[NuevaTenencia] ([idTenencia], [Exchange], [Wallet]) VALUES (17, NULL, N'Cotipay')
SET IDENTITY_INSERT [dbo].[NuevaTenencia] OFF
GO
INSERT [dbo].[TipoCriptomoneda] ([Nombre]) VALUES (N'Acción')
INSERT [dbo].[TipoCriptomoneda] ([Nombre]) VALUES (N'Commodity ')
INSERT [dbo].[TipoCriptomoneda] ([Nombre]) VALUES (N'Estable')
INSERT [dbo].[TipoCriptomoneda] ([Nombre]) VALUES (N'Volátil')
GO
INSERT [dbo].[TipoDeWallet] ([TipoWallet]) VALUES (N'App Movil')
INSERT [dbo].[TipoDeWallet] ([TipoWallet]) VALUES (N'Escritorio')
INSERT [dbo].[TipoDeWallet] ([TipoWallet]) VALUES (N'Hardware')
INSERT [dbo].[TipoDeWallet] ([TipoWallet]) VALUES (N'OnLine')
INSERT [dbo].[TipoDeWallet] ([TipoWallet]) VALUES (N'Papel')
GO
INSERT [dbo].[Wallet] ([Nombre], [Tipo], [Semilla]) VALUES (N'CoolWallet', N'Hardware', NULL)
INSERT [dbo].[Wallet] ([Nombre], [Tipo], [Semilla]) VALUES (N'Cotipay', N'OnLine', N'Telaraña  Breve  Esfera  Manchado  Repartir  Crédulo  Software  Existente  Pavo  Sincero  Horrible  Encender')
INSERT [dbo].[Wallet] ([Nombre], [Tipo], [Semilla]) VALUES (N'electrum', N'Escritorio', NULL)
INSERT [dbo].[Wallet] ([Nombre], [Tipo], [Semilla]) VALUES (N'KeepKey', N'Hardware', NULL)
INSERT [dbo].[Wallet] ([Nombre], [Tipo], [Semilla]) VALUES (N'Ledger', N'Hardware', NULL)
INSERT [dbo].[Wallet] ([Nombre], [Tipo], [Semilla]) VALUES (N'MetaMask', N'OnLine', NULL)
INSERT [dbo].[Wallet] ([Nombre], [Tipo], [Semilla]) VALUES (N'Trezor', N'Hardware', N'Apetitoso  Lento  Gestión  Fornido  Cumpleaños  Bang  Vampiro  Cuchara  Tratar  Apretar  Mirar  Holístico')
GO
ALTER TABLE [dbo].[Criptomoneda]  WITH CHECK ADD  CONSTRAINT [FK_Criptomoneda_TipoCriptomonedaA] FOREIGN KEY([Tipo])
REFERENCES [dbo].[TipoCriptomoneda] ([Nombre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Criptomoneda] CHECK CONSTRAINT [FK_Criptomoneda_TipoCriptomonedaA]
GO
ALTER TABLE [dbo].[Inversion]  WITH CHECK ADD  CONSTRAINT [FK_Inversion_Criptomoneda] FOREIGN KEY([Criptomoneda])
REFERENCES [dbo].[Criptomoneda] ([Nombre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inversion] CHECK CONSTRAINT [FK_Inversion_Criptomoneda]
GO
ALTER TABLE [dbo].[Inversion]  WITH CHECK ADD  CONSTRAINT [FK_Inversion_Instrumento] FOREIGN KEY([Instrumento])
REFERENCES [dbo].[Instrumento] ([Nombre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inversion] CHECK CONSTRAINT [FK_Inversion_Instrumento]
GO
ALTER TABLE [dbo].[Inversion]  WITH CHECK ADD  CONSTRAINT [FK_Inversion_NuevaTenencia] FOREIGN KEY([Lugar])
REFERENCES [dbo].[NuevaTenencia] ([idTenencia])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Inversion] CHECK CONSTRAINT [FK_Inversion_NuevaTenencia]
GO
ALTER TABLE [dbo].[InversionTemporal]  WITH CHECK ADD  CONSTRAINT [FK_InversionT_Criptomoneda] FOREIGN KEY([Criptomoneda])
REFERENCES [dbo].[Criptomoneda] ([Nombre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InversionTemporal] CHECK CONSTRAINT [FK_InversionT_Criptomoneda]
GO
ALTER TABLE [dbo].[InversionTemporal]  WITH CHECK ADD  CONSTRAINT [FK_InversionT_Instrumento] FOREIGN KEY([Instrumento])
REFERENCES [dbo].[Instrumento] ([Nombre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InversionTemporal] CHECK CONSTRAINT [FK_InversionT_Instrumento]
GO
ALTER TABLE [dbo].[InversionTemporal]  WITH CHECK ADD  CONSTRAINT [FK_InversionT_NuevaTenencia] FOREIGN KEY([Lugar])
REFERENCES [dbo].[NuevaTenencia] ([idTenencia])
GO
ALTER TABLE [dbo].[InversionTemporal] CHECK CONSTRAINT [FK_InversionT_NuevaTenencia]
GO
ALTER TABLE [dbo].[NuevaTenencia]  WITH CHECK ADD  CONSTRAINT [FK_NuevaTenencia_Exchange] FOREIGN KEY([Exchange])
REFERENCES [dbo].[Exchange] ([Nombre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NuevaTenencia] CHECK CONSTRAINT [FK_NuevaTenencia_Exchange]
GO
ALTER TABLE [dbo].[NuevaTenencia]  WITH CHECK ADD  CONSTRAINT [FK_NuevaTenencia_Wallet] FOREIGN KEY([Wallet])
REFERENCES [dbo].[Wallet] ([Nombre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NuevaTenencia] CHECK CONSTRAINT [FK_NuevaTenencia_Wallet]
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD  CONSTRAINT [FK_Wallet_TipoDeWallet] FOREIGN KEY([Tipo])
REFERENCES [dbo].[TipoDeWallet] ([TipoWallet])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wallet] CHECK CONSTRAINT [FK_Wallet_TipoDeWallet]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Exchange"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NuevaTenencia"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Inversion"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 250
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Criptomoneda"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversion_tenencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversion_tenencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversion_tenencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Inversion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversionesEsteAnio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInversionesEsteAnio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTenenciaWI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTenenciaWI'
GO
