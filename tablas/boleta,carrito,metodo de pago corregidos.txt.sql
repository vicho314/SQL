CREATE TABLE IF NOT EXISTS METODOS_DE_PAGO (
  id_metodo_de_pago INT PRIMARY KEY,
  tipo_de_pago VARCHAR(8),
  banco TEXT,
  nombre_titular TEXT,
  numero_tarjeta INT,
  fecha_vencimiento DATE,
  codigo_seguridad INT,
  rut_titular VARCHAR(30)
);

INSERT into METODOS_DE_PAGO
(id_metodo_de_pago, tipo_de_pago, banco, nombre_titular, numero_tarjeta, fecha_vencimiento, codigo_seguridad, rut_titular)
VALUES
(243,'credito','Banco_de_Chile','Juan Pérez',1243547,'2024-09-22',123456,'22.556.874-0'),
(543,'debito','Scotiabank_Chile','María Gómez',9874638,'2021-10-22',765389,'13.876.653-8'),
(763,'debito','Banco_Santander','Carlos López',1526376,'2029-05-15',091253,'16.765.767-8'),
(846,'credito','BCI','Ana Ramírez',576378,'2025-02-28',576378,'11.654.789-4'),
(873,'credito','Banco_Falabella','Lucas Díaz',9836472,'2027-04-03',121378,'12.654.821-7');

CREATE TABLE IF NOT EXISTS CARRITO (
  id_carro INT PRIMARY KEY,
  id_usuario INT,
  cantidad_elementos INT,
  total_pago NUMERIC,
  estado_carrito BOOLEAN,
  id_metodo_de_pago INT,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (id_metodo_de_pago) REFERENCES metodos_de_pago(id_metodo_de_pago)
);

INSERT INTO CARRITO (id_carro, id_usuario, cantidad_elementos, total_pago, estado_carrito, id_metodo_de_pago)
VALUES
(1253, 1, 4, 12.990, TRUE, 9832),
(9283, 2, 1, 3.990, TRUE, 1523),
(7384, 3, 2 ,8.990, FALSE,6473),
(8746, 4, 7, 17.990, TRUE, 8612),
(9841, 5, 5, 15.990, FALSE, 5721);

CREATE TABLE IF NOT EXISTS BOLETA (
  id_boleta INT PRIMARY KEY,
  id_carro INT,
  id_metodo_de_pago INT,
  fecha_boleta DATE,
  FOREIGN KEY (id_carro) REFERENCES carrito(id_carro),
  FOREIGN KEY (id_metodo_de_pago) REFERENCES metodos_de_pago(id_metodo_de_pago)
 );
 
INSERT INTO BOLETA (id_boleta,id_carro,id_metodo_de_pago,fecha_boleta)
VALUES
  (12345678,1565675,1216,'2024-05-10'),
  (98564377,1446768,9877,'2022-07-12'),
  (11354626,9837465,9876,'2026-09-26'),
  (01027787,0125367,1920,'2020-04-13'),
  (22345256,0963678,1298,'2023-11-23');




