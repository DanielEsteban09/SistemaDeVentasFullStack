--Insertamos data en las tablas:
USE [DBVENTA]
GO

--Insert Rol:
INSERT INTO [dbo].[Rol]
        ([Nombre])
     VALUES
        ('Administrador'),
        ('Empleado'),
        ('Supervisor')
GO

SELECT * FROM [dbo].[Rol];

GO

--Insert Usuarios:
INSERT INTO [dbo].[Usuarios]
           ([NombreCompleto]
           ,[Correo]
           ,[IdRol]
           ,[Clave])
     VALUES
           ('Codigo estudiante'
           ,'Daniel@gmail.com'
           ,1
           ,1234)
GO

SELECT * FROM [dbo].[Usuarios];

GO

--Insert Categorias:
INSERT INTO [dbo].[Categorias]
           ([Nombre])
     VALUES
           ('Laptops'),
           ('Monitores'),
           ('Teclados'),
           ('Auriculares'),
           ('Memorias'),
           ('Accesorios')
GO

SELECT * FROM [dbo].[Categorias];

GO

--Insert Productos:
INSERT INTO [dbo].[Productos]
        (nombre,idCategoria,stock,precio)
     Values
        ('laptop samsung book pro',1,20,2500),
        ('laptop lenovo idea pad',1,30,2200),
        ('laptop asus zenbook duo',1,30,2100),
        ('monitor teros gaming te-2',2,25,1050),
        ('monitor samsung curvo',2,15,1400),
        ('monitor huawei gamer',2,10,1350),
        ('teclado seisen gamer',3,10,800),
        ('teclado antryx gamer',3,10,1000),
        ('teclado logitech',3,10,1000),
        ('auricular logitech gamer',4,15,800),
        ('auricular hyperx gamer',4,20,680),
        ('auricular redragon rgb',4,25,950),
        ('memoria kingston rgb',5,10,200),
        ('ventilador cooler master',6,20,200),
        ('mini ventilador lenono',6,15,200)

SELECT * FROM [dbo].[Productos];

--Insert Menu:
INSERT INTO [dbo].[Menu]
        ([Nombre], [Icono], [UrlMenu])
     VALUES
        ('DashBoard','dashboard','/pages/dashboard'),
        ('Usuarios','group','/pages/usuarios'),
        ('Productos','collections_bookmark','/pages/productos'),
        ('Venta','currency_exchange','/pages/venta'),
        ('Historial Ventas','edit_note','/pages/historial_venta'),
        ('Reportes','receipt','/pages/reportes')
GO

SELECT * FROM [dbo].[Menu];

GO

--Insert Menu:
INSERT INTO [dbo].[MenuRol]
        ([IdMenu], [IdRol])
     VALUES
        (1,1),
        (2,1),
        (3,1),
        (4,1),
        (5,1),
        (6,1)
GO

SELECT * FROM [dbo].[Menu];

GO

--Menus para empleado:
INSERT INTO [dbo].[MenuRol]
        ([IdMenu], [IdRol])
     VALUES
        (4,2),
        (5,2)
GO

SELECT * FROM [dbo].[MenuRol];

GO

--Menus para supervisor:
INSERT INTO [dbo].[MenuRol]
        ([IdMenu], [IdRol])
     VALUES
        (3,3),
        (4,3),
        (5,3),
        (6,3)
GO

SELECT * FROM [dbo].[MenuRol];

GO

--Este insert es para que empiece desde el numero 0:
insert into NumeroDocumentos(UltimoNumero,fechaRegistro) values
(0,getdate())