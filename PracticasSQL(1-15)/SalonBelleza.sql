--SQL
USE master;
GO
IF DB_ID (N'SalonBelleza') IS NOT NULL
	DROP DATABASE ServicioMilitar;
	GO
CREATE DATABASE SalonBelleza
ON
(NAME = SalonBelleza_dat,
FILENAME = 'C:\BD\SalonBelleza.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = SalonBelleza_log,
FILENAME = 'C:\BD\SalonBelleza.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE SalonBelleza;
GO

--Tablas--

CREATE TABLE CITA
(
idCita int not null,
fecha datetime not null,
nombre varchar (50) not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE CLIENTE
(
idCliente int not null,
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
telefono int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE COMPRA
(
idCompra int not null,
cantidad int not null,
fecha datetime not null,
idEncargada int not null,
idProveedor int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE ENCARGADA
(
idEncargada int not null,
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
edad int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE ESTILISTA
(
idEstilista int not null,
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
edad int not null,
idEncargada int not null,
idCliente int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE PRODUCTO
(
idProducto int not null,
nombre varchar (50) not null,
cantidad int not null,
categoria varchar (50) not null,
idVenta int not null,
idCompra int not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE PROVEEDOR
(
idProveedor int not null,
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
calle varchar (50) not null,
numero int not null,
ciudad varchar (50) not null,
telefono int not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE REPRESENTANTE
(
idRepresentante int not null,
nombre varchar (50) not null,
apellidopaterno varchar (50) not null,
apellidomaterno varchar (50) not null,
calle varchar (50) not null,
telefono int not null,
empresa varchar (50) not null,
estatus bit default 1 not null,
);
GO


CREATE TABLE SERVICIO
(
idServicio int not null,
tipo varchar (50) not null,
precio int not null,
idVenta int not null,
idCliente int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE VENTA
(
idVenta int not null,
fecha datetime not null,
cantidad int not null,
estatus bit default 1 not null,
);
GO

CREATE TABLE ESTILISTASERVICIO
(
idEstilistaServicio int not null,
idEstilista int not null,
idServicio int not null,
estatus bit default 1 not null,
);
GO


--LLAVES PRIMARIAS
ALTER TABLE Cita ADD CONSTRAINT PK_Cita PRIMARY KEY (idCita)
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
ALTER TABLE Compra ADD CONSTRAINT PK_Compra PRIMARY KEY (idCompra)
ALTER TABLE Encargada ADD CONSTRAINT PK_Encargada PRIMARY KEY (idEncargada)
ALTER TABLE Estilista ADD CONSTRAINT PK_Estilista PRIMARY KEY (idEstilista)
ALTER TABLE Producto ADD CONSTRAINT PK_Producto PRIMARY KEY (idProducto)
ALTER TABLE Proveedor ADD CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor)
ALTER TABLE Representante ADD CONSTRAINT PK_Representante PRIMARY KEY (idRepresentante)
ALTER TABLE Servicio ADD CONSTRAINT PK_Servicio PRIMARY KEY (idServicio)
ALTER TABLE Venta ADD CONSTRAINT PK_Venta PRIMARY KEY (idVenta)


--LLAVES FORANEAS

--Compra
ALTER TABLE Compra ADD CONSTRAINT FK_CompraEncargada FOREIGN KEY (idEncargada) REFERENCES
Encargada(idEncargada)
ALTER TABLE Compra ADD CONSTRAINT FK_CompraProveedor FOREIGN KEY (idProveedor) REFERENCES
Proveedor(idProveedor)
--Estilista
ALTER TABLE Estilista ADD CONSTRAINT FK_EstilistaEncargada FOREIGN KEY (idEncargada) REFERENCES
Encargada(idEncargada)
ALTER TABLE Estilista ADD CONSTRAINT FK_EstilistaCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)
--Producto
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoVenta FOREIGN KEY (idVenta) REFERENCES
Venta(idVenta)
ALTER TABLE Producto ADD CONSTRAINT FK_ProductoCompra FOREIGN KEY (idCompra) REFERENCES
Compra(idCompra)
--Servicio
ALTER TABLE Servicio ADD CONSTRAINT FK_ServicioVenta FOREIGN KEY (idVenta) REFERENCES
Venta(idVenta)
ALTER TABLE Servicio ADD CONSTRAINT FK_ServicioCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)
--EstilistaSucursal
ALTER TABLE EstilistaServicio ADD CONSTRAINT FK_EstilistaServicioEstilista FOREIGN KEY (idEstilista) REFERENCES
Estilista (idEstilista)
ALTER TABLE EstilistaServicio ADD CONSTRAINT FK_EstilistaServicioServicio FOREIGN KEY (idServicio) REFERENCES
Servicio (idServicio)

--INDEX
CREATE INDEX IX_Cita ON Cita(idCita)
CREATE INDEX IX_Cliente ON Cliente(idCliente)
CREATE INDEX IX_Compra ON Compra(idCompra)
CREATE INDEX IX_Encargada ON Encargada(idEncargada)
CREATE INDEX IX_Estilista ON Estilista(idEstilista)
CREATE INDEX IX_Producto ON Producto(idProducto)
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor)
CREATE INDEX IX_Representante ON Representante(idRepresentante)
CREATE INDEX IX_Servicio ON Servicio(idServicio)
CREATE INDEX IX_Venta ON Venta(idVenta)
CREATE INDEX IX_EstilistaServicio ON EstilistaServicio(idEstilistaServicio)





