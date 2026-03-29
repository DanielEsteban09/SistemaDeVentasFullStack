/* Primero ejecutar solamente el create database, despues lo comento y ejecuto el resto del codigo
CREATE DATABASE DBVENTA
*/

USE DBVENTA

CREATE TABLE Rol(
IdRol INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Menu(
IdMenu INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
Icono VARCHAR(50),
UrlMenu VARCHAR(50)
);

--Tabla parametrica que define los roles de cada usuario
CREATE TABLE MenuRol(
IdMenuRol INT PRIMARY KEY IDENTITY(1,1),
IdRol INT REFERENCES Rol(IdRol),
IdMenu INT REFERENCES Menu(IdMenu)
);

CREATE TABLE Usuarios(
IdUsuario INT PRIMARY KEY IDENTITY(1,1),
NombreCompleto VARCHAR(150),
Correo VARCHAR(50),
IdRol INT REFERENCES Rol(IdRol),
Clave VARCHAR(40),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Categorias(
IdCategoria INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Productos(
IdProducto INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(100),
IdCategoria INT REFERENCES Categorias(IdCategoria),
Stock INT,
Precio DECIMAL(10,2),
Activo BIT DEFAULT 1,
FechaRegistro DATETIME DEFAULT GETDATE()
);

--Tabla para controlar los numeros que se le muestran al usuario al agregar un registro
CREATE TABLE NumeroDocumentos(
IdNumeroDocumento INT PRIMARY KEY IDENTITY(1,1),
UltimoNumero INT NOT NULL,
FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Ventas(
IdVenta INT PRIMARY KEY IDENTITY(1,1),
NumeroDocumento VARCHAR(40),
TipoPago VARCHAR(50),
Total DECIMAL(10,2),
FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE DetalleVentas(
IdDetalleVenta INT PRIMARY KEY IDENTITY(1,1),
IdVenta INT REFERENCES Ventas(IdVenta),
IdProducto INT REFERENCES Productos(IdProducto),
Cantidad INT,
Precio DECIMAL(10,2),
Total DECIMAL(10,2)
);