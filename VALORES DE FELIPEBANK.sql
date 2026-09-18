# 1 Se van a cargar los archivos en SUCURSAL
INSERT INTO Sucursal (id_sucursal, nombre, direccion, ciudad) VALUES
(1, 'Sucursal 3', 'Monaco', 'Montereal'),
(2, 'Sucursal 2021', 'Av.Centenario 2910', 'Montevideo'),
(3, 'Sucursal 04', 'Yaguaron 1414 ', 'Montevideo');

# 2. Se van a implementar datos en FUNCIONARIOS
INSERT INTO Funcionario (id_funcionario, nombre, cargo, fecha_ingreso, id_sucursal) VALUES
(101, 'Joaquin Salazar', 'Administrador', '2018-03-15', 1),
(102, 'Agustin Aguirre', 'Cajera', '2021-06-01', 1),
(103, 'Luis Torreria', 'Gestor bancario', '2020-01-10', 2),
(104, 'Sofia pacheco', 'Cajera', '2022-09-15', 3);

# 3. Clientes
INSERT INTO Cliente (documento, nombre_completo, fecha_nacimiento, direccion, telefono) VALUES
('45678901', 'Juan Pérez', '1985-04-12', 'Av.brasil', '099123456'),
('34567890', 'María López', '1992-11-23', 'Calle 18 de julio 432', '098234567'),
('23456789', 'Roberto Pimentel', '1978-08-05', 'Av. Brasil 1560', '097345678');

# 4. Cuentas Bancarias
INSERT INTO Cuenta_Bancaria (numero_cuenta, tipo, fecha_apertura, saldo_actual, id_sucursal) VALUES
('Cuenta-001', 'Ahorro', '2020-01-15', 15000.50, 1),
('Cuenta-002', 'Corriente', '2019-05-20', 85000.00, 1),
('Cuenta-003', 'Ahorro', '2021-08-10', 3200.75, 2),
('Cuenta-004', 'Corriente', '2022-02-01', 45000.00, 3);


INSERT INTO Titulares_Cuenta (documento_cliente, numero_cuenta) VALUES
('45678901', 'Cuenta-001'),
('45678901', 'Cuenta-002'), 
('34567890', 'Cuenta-002'), 
('34567890', 'Cuenta-003'),
('23456789', 'Cuenta-004');

# 6. Préstamos
INSERT INTO Prestamo (id_prestamo, monto_otorgado, tasa_interes, fecha_otorgado, cantidad_cuotas, documento_cliente) VALUES
(1001, 100000.00, 12.50, '2023-03-10', 24, '45678901'),
(1002, 50000.00, 10.00, '2023-06-15', 12, '34567890'),
(1003, 200000.00, 15.00, '2024-01-20', 36, '23456789');

# 7. Operaciones
INSERT INTO Operacion (id_operacion, fecha, hora, monto, tipo, cuenta_origen, cuenta_destino) VALUES
(5001, '2024-02-01', '10:30:00', 5000.00, 'Deposito', 'Cuenta-001', NULL),
(5002, '2024-02-02', '11:15:00', 1200.00, 'Retiro', 'Cuenta-001', NULL),
(5003, '2024-02-03', '14:20:00', 3000.00, 'Transferencia', 'Cuenta-002', 'Cuenta-003'),
(5004, '2024-02-04', '16:45:00', 10000.00, 'Deposito', 'Cuenta-004', NULL);
