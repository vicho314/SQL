CREATE TABLE IF NOT EXISTS metodos_de_pago (
  id_metodo_de_pago INT PRIMARY KEY,
  tipo_de_pago VARCHAR(8),
  banco TEXT,
  nombre_titular TEXT,
  numero_tarjeta BIGINT,
  fecha_vencimiento DATE,
  codigo_seguridad INT,
  rut_titular VARCHAR(30));
  
INSERT INTO metodos_de_pago(243,'credito','Banco_de_Chile','Juan Pérez',1243547698364716,09/24,123456,22.556.874-0)
INSERT INTO metodos_de_pago(543,'debito','Scotiabank_Chile','María Gómez',9871345627654372,10/22,765389,13.876.653-8)
INSERT INTO metodos_de_pago(763,'debito','Banco_Santander','Carlos López',9876456345431231,05/29,091253,16.765.767-8)
INSERT INTO metodos_de_pago(846,'credito','BCI','Ana Ramírez',1928374657482910,12/30,576378,11.654.789-4)
INSERT INTO metodos_de_pago(873,'credito','Banco_Falabella','Lucas Díaz',2323454765431298,04/27,121378,12.654.821-7)

  
CREATE IF NOT EXISTS carrito (
  id_carro INT PRIMARY KEY,
  id_usuario INT,
  cantidad_elementos INT,
  total_pago INT,
  estado_carrito BOOLEAN,
  id_metodo_de_pago INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
  FOREIGN KEY (id_metodo_de_pago) REFERENCES metodos_de_pago(id_metodo_de_pago));

INSERT INTO carrito(12345656754321879,1,4,12.990,'En proceso',1243547698364716)
INSERT INTO carrito(12534467682736456,2,1,3.990,'Enviado',9871345627654372)
INSERT INTO carrito(98765374652635476,3,2,8.990,'Entregado',9876456345431231)
INSERT INTO carrito(01998253678473645,4,7,17.990,'Listo para recoger',1928374657482910)
INSERT INTO carrito(09162536784765389,5,5,15.990,'Devuelto',2323454765431298)
  

CREATE IF NOT EXISTS Boleta (
  id_boleta INT PRIMARY KEY,
  id_carro INT,
  id_metodo_de_pago INT,
  fecha_boleta DATETIME_INTERVAL_CODE,
  FOREIGN KEY (id_carro) REFERENCES carrito(id_carro)
  FOREIGN KEY (id_metodo_de_pago) REFERENCES metodos_de_pago(id_metodo_de_pago));

INSERT INTO Boleta(12345678,12345656754321879,1243547698364716,10/05/2024)
INSERT INTO Boleta(98564377,12534467682736456,9871345627654372,12/07/2022)
INSERT INTO Boleta(11354626,98765374652635476,9876456345431231,25/09/2026)
INSERT INTO Boleta(01027787,01998253678473645,1928374657482910,13/04/2020)
INSERT INTO Boleta(22345256,09162536784765389,2323454765431298,27/11/2023)


