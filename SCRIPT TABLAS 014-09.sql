USE FelipeBank;



CREATE TABLE Sucursal (
    id_sucursal INT PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    ciudad VARCHAR(15) NOT NULL
);

CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY,
    nombre VARCHAR(15) NOT NULL,
    cargo VARCHAR(10) NOT NULL,
    fecha_ingreso DATE,
    id_sucursal INT NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);

CREATE TABLE Cliente (
    documento VARCHAR(20) PRIMARY KEY,
    nombre_completo VARCHAR(15) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(20) NOT NULL,
    telefono VARCHAR(15) UNIQUE
);

CREATE TABLE Cuenta_Bancaria (
    numero_cuenta VARCHAR(20) PRIMARY KEY,
    tipo ENUM ("ahorro" , "Cuenta_Corriente") NOT NULL,
    fecha_apertura DATE NOT NULL,
    saldo_actual DECIMAL(12, 2) NOT NULL,
    id_sucursal INT NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);

CREATE TABLE Titulares_Cuenta (
    documento_cliente VARCHAR(20) NOT NULL,
    numero_cuenta VARCHAR(20) NOT NULL,
    PRIMARY KEY (documento_cliente, numero_cuenta),
    FOREIGN KEY (documento_cliente) REFERENCES Cliente(documento),
    FOREIGN KEY (numero_cuenta) REFERENCES Cuenta_Bancaria(numero_cuenta)
);

CREATE TABLE Prestamo (
    id_prestamo INT PRIMARY KEY,
    monto_otorgado DECIMAL(12, 2) NOT NULL,
    tasa_interes DECIMAL(5, 2) NOT NULL,
    fecha_otorgado DATE NOT NULL,
    cantidad_cuotas INT NOT NULL,
    documento_cliente VARCHAR(20) NOT NULL,
    estado ENUM ("Aprobado" , "Rechazado" , "En revision"),
    FOREIGN KEY (documento_cliente) REFERENCES Cliente(documento)
);

CREATE TABLE Operacion (
    id_operacion INT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    monto DECIMAL(12, 2) NOT NULL,
    tipo ENUM ("Retiro" , "Deposito" , "Transferencia") NOT NULL,
    cuenta_origen VARCHAR(20) NOT NULL,
    cuenta_destino VARCHAR(20),
    FOREIGN KEY (cuenta_origen) REFERENCES Cuenta_Bancaria(numero_cuenta),
    FOREIGN KEY (cuenta_destino) REFERENCES Cuenta_Bancaria(numero_cuenta)
);


# SET FOREIGN_KEY_CHECKS = 1;
