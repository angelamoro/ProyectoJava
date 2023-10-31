CREATE DATABASE IF NOT EXISTS Farmacia;
USE Farmacia;

CREATE TABLE IF NOT EXISTS Proveedores (
    IdProveedor INT NOT NULL auto_increment UNIQUE PRIMARY KEY, 
    Contacto VARCHAR(200),
    Direccion VARCHAR(200),
    Empresa VARCHAR(200),
    Telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Medicamentos (
  Id INT NOT NULL auto_increment unique PRIMARY KEY,
  Nombre VARCHAR(200) NOT NULL,
  PVP DOUBLE NOT NULL,
  Stock INT NOT NULL,
  Fabricacion DATE NULL,
  Caducidad DATE NULL,
  IdProveedor int not null,
  FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor) ON DELETE CASCADE ON UPDATE CASCADE
  );
    
CREATE TABLE IF NOT EXISTS Empleados (
    IdEmpleado INT NOT NULL auto_increment UNIQUE PRIMARY KEY,
    Nombre VARCHAR(200) NOT NULL,
    Usuario VARCHAR(200) NOT NULL,
    Birthday DATE,
    Telefono VARCHAR(20),
    Psswrd VARCHAR(64) NOT NULL,
    Sexo VARCHAR (20)
);

CREATE TABLE IF NOT EXISTS Ventas (
    IdVenta int NOT NULL auto_increment UNIQUE PRIMARY KEY,
    CodVenta varchar(200) unique not null,
    Fecha date not null,
    IdEmpleado int not null,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS LineasVenta (
    IdLineaVenta int NOT NULL auto_increment UNIQUE PRIMARY KEY,
    IdMedicamento int not null,
    Pvp double,
    Cantidad int,
    Total double,
    IdVenta int not null,
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdMedicamento) REFERENCES Medicamentos(Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Facturacion (
	IdFactura int NOT NULL auto_increment UNIQUE PRIMARY KEY,
    TotalFact double not null,
    IdVenta int not null,
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta) ON DELETE CASCADE ON UPDATE CASCADE
);

USE Farmacia;

INSERT INTO Proveedores (Contacto, Direccion, Empresa, Telefono) VALUES
('Juan Perez', '235 East 42nd Street, New York, NY 10017, USA', 'Pfizer Inc', '1 800 879 3477'),
('Ana Ramirez', 'Johnson & Johnson Plaza, New Brunswick, NJ 08933 USA', 'Johnson & Johnson', '1 800 361 8068'),
('Pedro Hernandez', 'No.20 Zhichun Road, Haidian District, Beijing, China', 'Sinopharm', '86 10 82287727'),
('Luisa Garcia', 'Rischerstrasse 6343, Buonas, Switzerland', 'Roche', '41 41 798 8686'),
('Miguel Gomez', '51368 Leverkusen, Germany', 'Bayer', '49 214 30 1'),
('Laura Torres', 'Lichtstrasse 35, CH-4056 Basel, Switzerland', 'Novartis', '41 61 324 00 00'),
('Jorge Vazquez', 'Carrer de Frederic Mompou, 5, 08960 Sant Just Desvern, Barcelona', 'Stada', '934 73 88 89'),
('Maria Sanchez', 'MaximoAguirre 14, Leioa Bizkaia, España', 'Faes Farma', '900 924 734'),
('David Castro', 'C. San Anastasio, 4, 28005 Madrid', 'Almirall', '915 17 98 70');

INSERT INTO Medicamentos (Nombre, PVP, Stock, Fabricacion, Caducidad, IdProveedor) VALUES
('Paracetamol', 4.99, 100, '2022-01-01', '2023-12-31', 1),
('Ibuprofeno', 5.99, 75, '2021-12-01', '2024-11-30', 2),
('Aspirina', 3.99, 120, '2022-02-01', '2024-01-31', 3),
('Amoxicilina', 12.99, 50, '2022-03-01', '2023-12-31', 4),
('Omeprazol', 7.99, 80, '2022-01-01', '2023-12-31', 5),
('Diclofenaco', 6.99, 60, '2022-01-01', '2024-12-31', 6),
('Clonazepam', 9.99, 40, '2022-02-01', '2024-02-01', 7),
('Atorvastatina', 11.99, 30, '2022-03-01', '2023-12-31', 8),
('Lorazepam', 8.99, 50, '2021-12-01', '2023-11-30', 9),
('Metformina', 6.99, 90, '2022-02-01', '2024-01-31', 1),
('Ciprofloxacino', 10.99, 40, '2022-03-01', '2023-12-31', 2),
('Doxiciclina', 14.99, 20, '2022-01-01', '2024-12-31', 3),
('Fluconazol', 7.99, 30, '2022-03-01', '2023-12-31', 4),
('Naproxeno', 6.99, 70, '2021-12-01', '2024-11-30', 5),
('Metronidazol', 8.99, 60, '2022-02-01', '2024-02-01', 6),
('Lansoprazol', 9.99, 50, '2022-01-01', '2023-12-31', 7),
('Levofloxacino', 12.99, 30, '2022-02-01', '2024-01-31', 8),
('Alprazolam', 7.99, 40, '2022-03-01', '2023-12-31', 9),
('Simvastatina', 10.99, 30, '2022-01-01', '2023-12-31', 1),
('Enalapril', 6.99, 80, '2022-02-01', '2024-02-01', 2),
('Dalsy', 10.99, 50, '2023-01-01', '2024-01-01', 1),
('Betadine', 8.99, 100, '2022-12-15', '2023-12-15', 2),
('Mercromina', 5.99, 75, '2022-11-30', '2023-11-30', 2),
('Esparadrapo', 3.99, 200, '2023-02-01', '2024-02-01', 3),
('Gasas', 2.99, 300, '2023-03-15', '2024-03-15', 3),
('Agua oxigenada', 1.99, 150, '2023-04-01', '2024-04-01', 1),
('Alcohol', 4.99, 100, '2023-05-01', '2024-05-01', 1);

INSERT INTO Empleados (Nombre, usuario, Birthday, Telefono, Psswrd, sexo) VALUES
('Angela',	'angela',	'1936-08-06',	786534231,	'372c226a5736ca69249fa1a661796ec6375d870c959ffe1b1f4ebf20973d0b8d',	'Mujer'),
('Sonia',	'sonia',	'1990-07-27',	234567890,	'ac90207b57897a6c38c0fe658c6f9431114e4b94dadda918ad61335aa8938ece',	'Mujer'),
('Paula',	'paula',	'1993-05-01',	123456789,	'bc90c045be647ff96fa0c7b27c8457ff6d9713b1d82cbf3319499d87b3fb63f9',	'No especificado'),
('Daniel',	'daniel',	'2001-05-31',	123456,	'4f8e5cc4f54e5338b563b682807501c555b04c06b43fbc41b577fcfc19224376',	'Hombre');

