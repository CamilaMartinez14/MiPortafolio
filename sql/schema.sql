-- Creo la base de datos para guardar la informacion de mi portafolio
CREATE DATABASE IF NOT EXISTS portafolio_db;

-- Selecciono la base de datos que voy a utilizar
USE portafolio_db;

-- Creo una tabla para guardar mis proyectos
CREATE TABLE IF NOT EXISTS proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    tecnologias VARCHAR(150) NOT NULL,
    anio INT NOT NULL
);

-- Creo una tabla para guardar los mensajes de contacto
CREATE TABLE IF NOT EXISTS mensajes_contacto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL,
    motivo VARCHAR(50) NOT NULL,
    mensaje VARCHAR(500) NOT NULL,
    fecha_envio DATETIME NOT NULL
);

-- Reviso las tablas que cree
SHOW TABLES;

-- Agrego los proyectos que voy a mostrar en mi portafolio
INSERT INTO proyectos (nombre, descripcion, tecnologias, anio)
VALUES
('Inventario Web','Proyecto realizado para llevar un control de productos, movimientos de inventario y stock.','HTML, CSS, JavaScript, PHP y MySQL',2025),
('Realidad Aumentada','Proyecto realizado en Unity donde trabajé con realidad aumentada para mostrar objetos digitales mediante la cámara.','Unity, C# y Vuforia',2026);

-- Reviso los proyectos guardados
SELECT * FROM proyectos;

-- Creo una tabla para guardar los comentarios del portafolio
CREATE TABLE IF NOT EXISTS comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    comentario VARCHAR(500) NOT NULL,
    fecha_comentario DATETIME NOT NULL
);

-- Reviso las tablas que tengo
SHOW TABLES;

-- Reviso los comentarios guardados
SELECT * FROM comentarios;

USE portafolio_db;

-- Creo una tabla para guardar mis habilidades
CREATE TABLE IF NOT EXISTS habilidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300) NOT NULL
);
-- Reviso que este creada 
SELECT * FROM habilidades;

-- Agrego las habilidades que voy a mostrar en mi portafolio
INSERT INTO habilidades (categoria, descripcion)
VALUES
('Desarrollo Web', 'HTML, CSS, JavaScript y Bootstrap.'),
('Bases de Datos', 'MySQL, SQL Server y Oracle SQL.'),
('Programación', 'C#, PHP y JavaScript.'),
('Herramientas', 'Visual Studio Code, Visual Studio, MySQL Workbench, SQL Developer, Unity, Git y GitHub.');

-- Reviso las habilidades guardadas
SELECT * FROM habilidades;

-- Reviso los mensajes de contacto
SELECT * FROM mensajes_contacto;