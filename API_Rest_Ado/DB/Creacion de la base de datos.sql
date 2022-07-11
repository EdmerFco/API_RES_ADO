create database CRUD_Vue

use CRUD_Vue


---Crear la base de datos 
Create table Usuario
(
idUsuario int primary key not null, 
Nombre varchar(60) not null,
ApellidoP varchar(60) not null,
ApellidoM varchar(60) not null,
FNacimiento date  not null,
Curp Char(18) not null,
Correo Varchar(60) not null,
Telefono nchar(10) NOT null
);


---Crear usuario 
alter procedure Agregar 
(
@Nombre varchar(60) ,
@ApellidoP varchar(60) ,
@ApellidoM varchar(60) ,
@FNacimiento date  ,
@Curp Char(18) ,
@Correo Varchar(60) ,
@Telefono nchar(10)
)
AS
Insert Into Usuario 
(
Nombre,
ApellidoP,
ApellidoM,
FNacimiento,
Curp,
Correo,
Telefono
)
Values 
(
@Nombre,
@ApellidoP,
@ApellidoM,
@FNacimiento,
@Curp,
@Correo,
@Telefono
)

exec Agregar 'Edmer','Herandez','Roque','2000-04-28','HERE000428HQTRQDA0','Edmer.fco2804@gmail.com',4411512168

----Actualizar 
Create procedure Actualizar 
(
@idUsuario int, 
@Nombre varchar(60) ,
@ApellidoP varchar(60) ,
@ApellidoM varchar(60) ,
@FNacimiento date  ,
@Curp Char(18) ,
@Correo Varchar(60) ,
@Telefono nchar(10)
)
AS
BEGIN 
update Usuario set

Nombre        = @Nombre,
ApellidoP	  = @ApellidoP,
ApellidoM	  = @ApellidoM,
FNacimiento	  = @FNacimiento,
Curp		  = @Curp,
Correo		  = @Correo,
Telefono	  = @Telefono
where idUsuario = @idUsuario
SELECT @@ROWCOUNT
end 
go 

exec Actualizar 1,'Edmer Francisco','Heranandez','Roque','2000-04-28','HERE000428HQTRQDA0','pacohernandezroque@gmail.com',4411512168
---Consultar todos

Create procedure Consultar
as
begin 
Select * from Usuario
end
go 

Exec Consultar

---Consultar uno 
create procedure ConsultarUno
(
@id int 
)
as 
begin 
Select * from Usuario
where idUsuario = @id
end 
go 

exec ConsultarUno 2
--Eliminar 

Create procedure Eliminar 
(
@id int
)
as
begin
Delete from Usuario
where idUsuario = @id
end 
go 

Exec Eliminar 2