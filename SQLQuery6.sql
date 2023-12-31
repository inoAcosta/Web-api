USE [master]
GO
/****** Object:  Database [TIENDABD]    Script Date: 30/10/2023 23:42:28 ******/
CREATE DATABASE [TIENDABD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TIENDABD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TIENDABD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TIENDABD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TIENDABD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TIENDABD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TIENDABD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TIENDABD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TIENDABD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TIENDABD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TIENDABD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TIENDABD] SET ARITHABORT OFF 
GO
ALTER DATABASE [TIENDABD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TIENDABD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TIENDABD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TIENDABD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TIENDABD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TIENDABD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TIENDABD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TIENDABD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TIENDABD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TIENDABD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TIENDABD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TIENDABD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TIENDABD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TIENDABD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TIENDABD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TIENDABD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TIENDABD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TIENDABD] SET RECOVERY FULL 
GO
ALTER DATABASE [TIENDABD] SET  MULTI_USER 
GO
ALTER DATABASE [TIENDABD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TIENDABD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TIENDABD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TIENDABD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TIENDABD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TIENDABD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TIENDABD', N'ON'
GO
ALTER DATABASE [TIENDABD] SET QUERY_STORE = OFF
GO
USE [TIENDABD]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 30/10/2023 23:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](80) NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PRODUCTOS] ON 
GO
INSERT [dbo].[PRODUCTOS] ([id], [descripcion], [precio]) VALUES (14, N'celular samsumg', 3500.0000)
GO
INSERT [dbo].[PRODUCTOS] ([id], [descripcion], [precio]) VALUES (16, N'Refrigerador', 2500.0000)
GO
INSERT [dbo].[PRODUCTOS] ([id], [descripcion], [precio]) VALUES (17, N'Plancha', 500.0000)
GO
INSERT [dbo].[PRODUCTOS] ([id], [descripcion], [precio]) VALUES (19, N'Xbox-apple', 2600.0000)
GO
INSERT [dbo].[PRODUCTOS] ([id], [descripcion], [precio]) VALUES (20, N'Laptop-lenovo', 4000.0000)
GO
INSERT [dbo].[PRODUCTOS] ([id], [descripcion], [precio]) VALUES (21, N'Silla gamer con led', 1000.0000)
GO
SET IDENTITY_INSERT [dbo].[PRODUCTOS] OFF
GO
/****** Object:  StoredProcedure [dbo].[actualizarProductos]    Script Date: 30/10/2023 23:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarProductos]
@id INT,
@precio MONEY
AS
UPDATE PRODUCTOS
SET precio=@precio
WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[eleminarProductos]    Script Date: 30/10/2023 23:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eleminarProductos]
@id INT
AS
DELETE FROM PRODUCTOS
WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[insertarProductos]    Script Date: 30/10/2023 23:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarProductos]

@descripcion VARCHAR(80),
@precio MONEY
AS
INSERT INTO PRODUCTOS (descripcion,precio)
VALUES (@descripcion,@precio)
GO
/****** Object:  StoredProcedure [dbo].[mostrarProductos]    Script Date: 30/10/2023 23:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mostrarProductos]
AS
SELECT * FROM PRODUCTOS
GO
USE [master]
GO
ALTER DATABASE [TIENDABD] SET  READ_WRITE 
GO
