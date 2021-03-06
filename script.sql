USE [master]
GO
/****** Object:  Database [DB_Example]    Script Date: 1/3/2022 23:43:34 ******/
CREATE DATABASE [DB_Example]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Example', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Example.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Example_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Example_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_Example] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Example].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Example] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Example] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Example] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Example] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Example] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Example] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Example] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Example] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Example] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Example] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Example] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Example] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Example] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Example] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Example] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Example] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Example] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Example] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Example] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Example] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Example] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Example] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Example] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Example] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Example] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Example] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Example] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Example] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Example] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Example] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Example', N'ON'
GO
ALTER DATABASE [DB_Example] SET QUERY_STORE = OFF
GO
USE [DB_Example]
GO
/****** Object:  Table [dbo].[TblCliente]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCliente](
	[SisCodigo] [tinyint] NOT NULL,
	[CliRUC] [varchar](13) NOT NULL,
	[CliNombre] [varchar](50) NULL,
	[CliDireccion] [varchar](50) NULL,
	[CliTelefono] [varchar](20) NULL,
	[CliContacto] [varchar](50) NULL,
	[CliCodigo] [tinyint] NOT NULL,
 CONSTRAINT [PK_TblCliente] PRIMARY KEY CLUSTERED 
(
	[CliCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSistema]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSistema](
	[SisCodigo] [tinyint] NOT NULL,
	[SisDetalle] [varchar](50) NULL,
	[SisFechaInicio] [smalldatetime] NULL,
	[SisFechaFinal] [smalldatetime] NULL,
	[SisSistemaOperativo] [varchar](125) NULL,
	[SisBaseDatos] [varchar](125) NULL,
	[SisDesarrollo] [varchar](125) NULL,
	[SisReportes] [varchar](125) NULL,
	[SisProyectManager] [varchar](50) NULL,
	[SisDeveloperSenior] [varchar](50) NULL,
	[SisTester] [varchar](50) NULL,
	[SisSoporte] [varchar](50) NULL,
 CONSTRAINT [PK_TblSistema] PRIMARY KEY CLUSTERED 
(
	[SisCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[General]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[General]
 AS 
 SELECT 
 TblCliente.CliRUC,
 TblCliente.CliNombre,
 TblCliente.CliDireccion,
 TblCliente.CliTelefono,
 TblSistema.SisDetalle,
 FORMAT(TblSistema.SisFechaInicio,'dd/MM/yy') AS 'Fecha',
 FORMAT(TblSistema.SisFechaFinal,'dd/MM/yy') AS 'FechaFin',
 TblSistema.SisSistemaOperativo
 FROM 
 TblCliente, TblSistema
 WHERE TblCliente.CliCodigo = TblSistema.SisCodigo

GO
/****** Object:  Table [dbo].[TblSoporte]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSoporte](
	[SisCodigo] [tinyint] NOT NULL,
	[SopCodigo] [int] NOT NULL,
	[SopFecha] [datetime] NULL,
	[SopProblema] [varchar](200) NULL,
	[SopSolucion] [varchar](200) NULL,
	[SopEstado] [tinyint] NULL,
 CONSTRAINT [PK_TblSoporte] PRIMARY KEY CLUSTERED 
(
	[SopCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblVersion]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblVersion](
	[SisCodigo] [tinyint] NOT NULL,
	[VerCodigo] [int] NOT NULL,
	[VerFecha] [smalldatetime] NULL,
	[VerVersion] [varchar](15) NULL,
	[VerDetalle] [varchar](50) NULL,
	[VerCambios] [varchar](200) NULL,
	[VerInstruccion] [varchar](200) NULL,
	[VerEstado] [varchar](15) NULL,
 CONSTRAINT [PK_TblVersion] PRIMARY KEY CLUSTERED 
(
	[VerCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblCliente]  WITH CHECK ADD  CONSTRAINT [FK_TblCliente_TblSistema1] FOREIGN KEY([SisCodigo])
REFERENCES [dbo].[TblSistema] ([SisCodigo])
GO
ALTER TABLE [dbo].[TblCliente] CHECK CONSTRAINT [FK_TblCliente_TblSistema1]
GO
ALTER TABLE [dbo].[TblSoporte]  WITH CHECK ADD  CONSTRAINT [FK_TblSoporte_TblSistema] FOREIGN KEY([SisCodigo])
REFERENCES [dbo].[TblSistema] ([SisCodigo])
GO
ALTER TABLE [dbo].[TblSoporte] CHECK CONSTRAINT [FK_TblSoporte_TblSistema]
GO
ALTER TABLE [dbo].[TblVersion]  WITH CHECK ADD  CONSTRAINT [FK_TblVersion_TblSistema] FOREIGN KEY([SisCodigo])
REFERENCES [dbo].[TblSistema] ([SisCodigo])
GO
ALTER TABLE [dbo].[TblVersion] CHECK CONSTRAINT [FK_TblVersion_TblSistema]
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Cliente]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Delete_Cliente]
 @numero int 
 AS  
 if @numero >=0 
	BEGIN
	delete from TblCliente where CliCodigo = @numero 
	end
		else
		PRINT 'ERROR: EL VALOR INGRESADO ES MENOS QUE 0'
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Sistema]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Delete_Sistema]
 @numeroId int 
 AS  
 if @numeroId >=0 
	BEGIN
	delete from TblSistema where SisCodigo = @numeroId 
	end
		else
		PRINT 'ERROR: EL VALOR INGRESADO ES MENOS QUE 0'
GO
/****** Object:  StoredProcedure [dbo].[sp_Delete_Versiones]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Delete_Versiones]
 @numero int 
 AS  
 if @numero >=0 
	BEGIN
	delete from TblVersion where VerCodigo = @numero 
	end
		else
		PRINT 'ERROR: EL VALOR INGRESADO ES MENOS QUE 0'
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Cliente]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Insert_Cliente]
( 
	@SisCodigo tinyint,
	@CliRUC varchar(13),
	@CliNombre varchar(50),
	@CliDireccion varchar(50),
	@CliTelefono varchar(50),
	@CliContacto varchar(50)
)
AS
DECLARE @CliCodigo tinyint
	--conteo auto
	SELECT @CliCodigo = ISNULL(MAX(CliCodigo),0)
	FROM TblCliente
	SET @CliCodigo = @CliCodigo +1;

	INSERT INTO TblCliente
	(
	SisCodigo,
	CliRUC,
	CliNombre,
	CliDireccion,
	CliTelefono,
	CliContacto,
	CliCodigo
	)
	VALUES
	(
	@SisCodigo,
	@CliRUC,
	@CliNombre,
	@CliDireccion,
	@CliTelefono,
	@CliContacto,
	@CliCodigo
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Sistema]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Insert_Sistema]
( --@SisCodigo tinyint,
	@SisDetalle varchar(50),
	@SisFechaInicio datetime,
	@SisFechaFinal datetime,
	@SisSistemaOperativo varchar(125),
	@SisBaseDatos varchar(125),
	@SisDesarrollo varchar(125),
	@SisReportes varchar(125),
	@SisProyectManager varchar(50),
	@SisDeveloperSenior varchar(50),
	@SisTester varchar(50),
	@SisSoporte varchar(50)
)
AS
DECLARE @SisCodigo tinyint
	--conteo auto
	SELECT @SisCodigo = ISNULL(MAX(SisCodigo),0)
	FROM tblSistema
	SET @SisCodigo = @SisCodigo +1;

	INSERT INTO tblSistema
	(
	SisCodigo,
	SisDetalle,
	SisFechaInicio,
	SisFechaFinal,
	SisSistemaOperativo,
	SisBaseDatos,
	SisDesarrollo,
	SisReportes,
	SisProyectManager,
	SisDeveloperSenior,
	SisTester,
	SisSoporte
	)
	VALUES
	(
	@SisCodigo,
	@SisDetalle,
	@SisFechaInicio,
	@SisFechaFinal,
	@SisSistemaOperativo,
	@SisBaseDatos,
	@SisDesarrollo,
	@SisReportes,
	@SisProyectManager,
	@SisDeveloperSenior,
	@SisTester,
	@SisSoporte
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_Insert_Versiones]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Insert_Versiones]
	@SisCodigo tinyint,
	@VerFecha datetime,
	@VerVersion varchar(15),
	@VerDetalle varchar(50),
	@VerCambios varchar(200),
	@VerInstruccion varchar(200),
	@VerEstado varchar(15)
 AS  
 DECLARE @VerCodigo tinyint
	--conteo auto
	SELECT @VerCodigo = ISNULL(MAX(VerCodigo),0)
	FROM TblVersion
	SET @VerCodigo = @VerCodigo +1;
 INSERT INTO TblVersion
	(
	VerCodigo,
	SisCodigo,
	VerFecha,
	VerVersion,
	VerDetalle,
	VerCambios,
	VerInstruccion,
	VerEstado
	)
	VALUES
	(
	@VerCodigo,
	@SisCodigo,
	@VerFecha,
	@VerVersion,
	@VerDetalle,
	@VerCambios,
	@VerInstruccion,
	@VerEstado
	)
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_Cliente]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_Cliente]
	@numeroId tinyint, 
	@CliRUC varchar(50),
	@SisCodigo tinyint,
	@CliNombre varchar(50),
	@CliDireccion varchar(50),
	@CliTelefono varchar(125),
	@CliContacto varchar(125)
 AS  
 IF @numeroId >=0 
	BEGIN
	UPDATE TblCliente SET 
	CliRUC = @CliRUC,
	SisCodigo =  @SisCodigo,
	CliNombre = @CliNombre,
	CliDireccion = @CliDireccion,
	CliTelefono = @CliTelefono,
	CliContacto = @CliContacto
	
	WHERE CliCodigo = @numeroId 
	END
		ELSE
		PRINT 'ERROR: EL VALOR INGRESADO ES MENOS QUE 0'

GO
/****** Object:  StoredProcedure [dbo].[sp_Update_Sistema]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_Sistema]
	@numeroId tinyint, 
	@SisDetalle varchar(50),
	@SisFechaInicio datetime,
	@SisFechaFinal datetime,
	@SisSistemaOperativo varchar(125),
	@SisBaseDatos varchar(125),
	@SisDesarrollo varchar(125),
	@SisReportes varchar(125),
	@SisProyectManager varchar(50),
	@SisDeveloperSenior varchar(50),
	@SisTester varchar(50),
	@SisSoporte varchar(50)
 AS  
 if @numeroId >=0 
	BEGIN
	UPDATE TblSistema SET 
	SisDetalle = @SisDetalle,
	SisFechaInicio= @SisFechaInicio,
	SisFechaFinal = @SisFechaFinal,
	SisSistemaOperativo = @SisSistemaOperativo,
	SisBaseDatos = @SisBaseDatos,
	SisDesarrollo = @SisDesarrollo,
	SisReportes = @SisReportes,
	SisProyectManager = @SisProyectManager,
	SisDeveloperSenior = @SisDeveloperSenior,
	SisTester = @SisTester,
	SisSoporte = @SisSoporte
	WHERE SisCodigo = @numeroId 
	END
		ELSE
		PRINT 'ERROR: EL VALOR INGRESADO ES MENOS QUE 0'
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_Versiones]    Script Date: 1/3/2022 23:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_Versiones]
	@numeroId tinyint, 
	/*
	@VerCodigo tinyint,
	@SisCodigo tinyint,
	@VerFecha datetime,
	@VerVersion varchar(15),
	@VerDetalle varchar(50),
	@VerCambios varchar(200),
	@VerInstruccion varchar(200),
	*/
	@VerEstado varchar(15)
 AS  
 IF @numeroId >=0 
	BEGIN
	UPDATE TblVersion SET 
	/*
	SisCodigo = @SisCodigo,
	VerFecha = @VerFecha,
	VerVersion = @VerVersion,
	VerDetalle = @VerDetalle,
	VerCambios = @VerCambios,
	VerInstruccion = @VerInstruccion,
	*/
	VerEstado = @VerEstado
	
	WHERE VerCodigo = @numeroId 
	END
		ELSE
		PRINT 'ERROR: EL VALOR INGRESADO ES MENOS QUE 0'

GO
USE [master]
GO
ALTER DATABASE [DB_Example] SET  READ_WRITE 
GO
