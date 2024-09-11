-- Eliminar el esquema si existe y crear uno nuevo
DROP SCHEMA IF EXISTS tienda_store;
CREATE SCHEMA tienda_store;
USE tienda_store;

-- Crear tablas

CREATE TABLE municipio(
    idmunicipio INT PRIMARY KEY AUTO_INCREMENT,
    municipio VARCHAR(25)
);

CREATE TABLE tipo_documento(
    idtipo_documento INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(2)
);

CREATE TABLE empleado (   
    idempleado INT PRIMARY KEY AUTO_INCREMENT,    
    documento VARCHAR(12) NOT NULL,
    idtipo_documento INT,
    nombre VARCHAR(50) NOT NULL,   
    apellido VARCHAR(50) NOT NULL,  
    email VARCHAR(100) NOT NULL,   
    contrasena VARCHAR(100) NOT NULL,   
    telefono VARCHAR(10),
    idmunicipio INT,
    FOREIGN KEY (idtipo_documento) REFERENCES tipo_documento(idtipo_documento),
    FOREIGN KEY (idmunicipio) REFERENCES municipio(idmunicipio)
);

CREATE TABLE cliente (   
    idcliente INT PRIMARY KEY AUTO_INCREMENT, 
    documento VARCHAR(12) NOT NULL,
    idtipo_documento INT,
    nombre VARCHAR(50) NOT NULL,   
    apellido VARCHAR(50) NOT NULL,  
    email VARCHAR(100) NOT NULL,  
    telefono VARCHAR(10),
    contrasena VARCHAR(100) NOT NULL,   
    fecha_nacimiento DATE,
    idmunicipio INT,
    FOREIGN KEY (idtipo_documento) REFERENCES tipo_documento(idtipo_documento),
    FOREIGN KEY (idmunicipio) REFERENCES municipio(idmunicipio)
);

CREATE TABLE producto (
    idproducto INT PRIMARY KEY AUTO_INCREMENT,   
    nombre VARCHAR(100) NOT NULL,  
    descripcion TEXT,   
    precio DECIMAL(10, 2) NOT NULL, 
    imagen VARCHAR(255),   
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categoria (   
    idcategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,  
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE producto_categoria (   
    idproducto_categoria INT PRIMARY KEY AUTO_INCREMENT,   
    idproducto INT NOT NULL,  
    idcategoria INT NOT NULL, 
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idproducto) REFERENCES producto(idproducto),
    FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);

CREATE TABLE pedido (  
    idpedido INT PRIMARY KEY AUTO_INCREMENT,   
    idcliente INT,
    idempleado INT,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    fecha_envio TIMESTAMP,  
    fecha_entrega TIMESTAMP,   
    total DECIMAL(10, 2) NOT NULL, 
    estado VARCHAR(50) NOT NULL,   
    direccion_envio VARCHAR(255) NOT NULL,
    FOREIGN KEY (idcliente) REFERENCES cliente(idcliente),
    FOREIGN KEY (idempleado) REFERENCES empleado(idempleado)
);

CREATE TABLE producto_pedido (   
    idproducto_pedido INT PRIMARY KEY AUTO_INCREMENT,    
    idpedido INT NOT NULL,    
    idproducto INT NOT NULL,    
    cantidad INT NOT NULL,   
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (idpedido) REFERENCES pedido(idpedido),
    FOREIGN KEY (idproducto) REFERENCES producto(idproducto)
);

CREATE TABLE pago (   
    idpago INT PRIMARY KEY AUTO_INCREMENT,   
    idpedido INT NOT NULL,    
    metodo VARCHAR(50) NOT NULL,   
    total DECIMAL(10, 2) NOT NULL,  
    estado VARCHAR(50) NOT NULL, 
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idpedido) REFERENCES pedido(idpedido)
);

CREATE TABLE envio (  
    idenvio INT PRIMARY KEY AUTO_INCREMENT,  
    idpedido INT NOT NULL,  
    proveedor VARCHAR(100) NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    fecha_entrega_estimada TIMESTAMP,  
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (idpedido) REFERENCES pedido(idpedido)
);

CREATE TABLE stock (    
    idstock INT PRIMARY KEY AUTO_INCREMENT, 
    idproducto INT NOT NULL,  
    cantidad INT NOT NULL,
    FOREIGN KEY (idproducto) REFERENCES producto(idproducto)
);
