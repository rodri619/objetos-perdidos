-- Creación y limpieza de la base de datos
DROP DATABASE IF EXISTS gestion_objetos;
CREATE DATABASE gestion_objetos;
USE gestion_objetos;

-- 1. Tabla Facultad
CREATE TABLE Facultad (
    id_facultad INT PRIMARY KEY,
    nombre_facultad VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Tabla Categoria
CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Tabla Estado
CREATE TABLE Estado (
    id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR(30) NOT NULL UNIQUE
);

-- 4. Tabla UbicacionFisica
CREATE TABLE UbicacionFisica (
    id_ubicacion_fisica INT PRIMARY KEY,
    nombre_ubicacion VARCHAR(150) NOT NULL UNIQUE
);

-- 5. Tabla Usuario
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    num_identificacion VARCHAR(12) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    id_facultad INT NOT NULL,
    tipo_usuario ENUM('Alumno', 'Profesor', 'Administrativo') NOT NULL,
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad)
);

-- 6. Tabla Objeto
CREATE TABLE Objeto (
    id_objeto INT PRIMARY KEY,
    descripcion_detallada TEXT NOT NULL,
    lugar_aproximado_hallazgo VARCHAR(150) NOT NULL,
    id_categoria INT NOT NULL,
    id_estado_actual INT NOT NULL,
    id_ubicacion_fisica INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_estado_actual) REFERENCES Estado(id_estado),
    FOREIGN KEY (id_ubicacion_fisica) REFERENCES UbicacionFisica(id_ubicacion_fisica)
);

-- 7. Tabla Reporte
CREATE TABLE Reporte (
    id_reporte INT PRIMARY KEY,
    id_objeto INT NOT NULL UNIQUE,
    id_usuario_reporta INT NOT NULL,
    fecha_hora_reporte DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_objeto) REFERENCES Objeto(id_objeto),
    FOREIGN KEY (id_usuario_reporta) REFERENCES Usuario(id_usuario)
);

-- 8. Tabla Reclamo
CREATE TABLE Reclamo (
    id_reclamo INT PRIMARY KEY,
    id_objeto INT NOT NULL UNIQUE,
    id_usuario_reclama INT NOT NULL,
    fecha_hora_reclamo DATETIME DEFAULT CURRENT_TIMESTAMP,
    descripcion_sucedido TEXT NOT NULL,
    FOREIGN KEY (id_objeto) REFERENCES Objeto(id_objeto),
    FOREIGN KEY (id_usuario_reclama) REFERENCES Usuario(id_usuario)
);

-- INSERCIÓN CON IDs MANUALES

INSERT INTO Facultad (id_facultad, nombre_facultad) VALUES  
(1, 'Facultad de Ciencias'), (2, 'Facultad de Ingeniería'), (3, 'Facultad de Filosofía y Letras'),  
(4, 'Facultad de Derecho'), (5, 'Facultad de Medicina'), (6, 'Facultad de Psicología'),  
(7, 'Facultad de Economía'), (8, 'Facultad de Química'), (9, 'Facultad de Odontología'),  
(10, 'Facultad de Arquitectura'), (11, 'FES Acatlán'), (12, 'FES Iztacala'),  
(13, 'FES Cuautitlán'), (14, 'FES Aragón'), (15, 'FES Zaragoza'),  
(16, 'Facultad de Artes y Diseño'), (17, 'Facultad de Música'), (18, 'Facultad de Ciencias Políticas'),  
(19, 'Facultad de Contaduría'), (20, 'Biblioteca Central');

INSERT INTO Categoria (id_categoria, nombre_categoria) VALUES  
(1, 'Electrónicos'), (2, 'Ropa'), (3, 'Libros'), (4, 'Papelería'), (5, 'Llaves'),  
(6, 'Carteras'), (7, 'Mochilas'), (8, 'Lentes'), (9, 'Identificaciones'), (10, 'Deportes'),  
(11, 'Instrumentos'), (12, 'Herramientas'), (13, 'Joyas'), (14, 'Paraguas'), (15, 'Calzado'),  
(16, 'Termos'), (17, 'Audífonos'), (18, 'Cargadores'), (19, 'Prendas de Invierno'), (20, 'Otros');

INSERT INTO Estado (id_estado, nombre_estado) VALUES  
(1, 'Reportado'), (2, 'En Custodia'), (3, 'Reclamado'), (4, 'Donado'), (5, 'Desechado'),
(6, 'En Verificación'), (7, 'Trasladado'), (8, 'Extraviado'), (9, 'En Limpieza'), (10, 'Disponible'),
(11, 'Baja'), (12, 'Almacén A'), (13, 'Almacén B'), (14, 'Pendiente'), (15, 'Exhibición'),
(16, 'Autorizado'), (17, 'Reciclaje'), (18, 'Destrucción'), (19, 'Aclaración'), (20, 'Finalizado');

INSERT INTO UbicacionFisica (id_ubicacion_fisica, nombre_ubicacion) VALUES  
(1, 'Conserjería Ciencias'), (2, 'Servicios Escolares Ingeniería'), (3, 'Biblioteca Central - Piso 1'),  
(4, 'Cafetería Filosofía'), (5, 'Gimnasio Central'), (6, 'Auditorio Derecho'),  
(7, 'Vigilancia Puerta 1'), (8, 'Vigilancia Puerta 3'), (9, 'Oficina Medicina'),  
(10, 'Laboratorio Química'), (11, 'Coordinación Psicología'), (12, 'Caseta FES A'),  
(13, 'Biblioteca Iztacala'), (14, 'Depto Becas'), (15, 'Sala Profesores Economía'),  
(16, 'Dirección Artes'), (17, 'Módulo Informes Música'), (18, 'Control Polakas'),  
(19, 'Cubículo Contaduría'), (20, 'Área Objetos Central');

INSERT INTO Usuario (id_usuario, num_identificacion, nombre_completo, correo_electronico, id_facultad, tipo_usuario) VALUES
(1, '321173579', 'Rodrigo Jiménez', 'rodrigo.jimenez@ciencias.unam.mx', 1, 'Alumno'),
(2, '316283941', 'María García', 'mariag@ingenieria.unam.mx', 2, 'Alumno'),
(3, '421093842', 'Roberto Gómez', 'robertog@filos.unam.mx', 3, 'Profesor'),
(4, '312948573', 'Laura Torres', 'laurat@derecho.unam.mx', 4, 'Alumno'),
(5, '518273645', 'Carlos Ruiz', 'cruiz@medicina.unam.mx', 5, 'Administrativo'),
(6, '314059281', 'Ana López', 'alopez@psicologia.unam.mx', 6, 'Alumno'),
(7, '422039485', 'David Silva', 'dsilva@economia.unam.mx', 7, 'Profesor'),
(8, '317283940', 'Elena Martínez', 'emartinez@quimica.unam.mx', 8, 'Alumno'),
(9, '311029384', 'Jorge Hernández', 'jhernandez@odontologia.unam.mx', 9, 'Alumno'),
(10, '519283746', 'Sofía Castro', 'scastro@arquitectura.unam.mx', 10, 'Administrativo'),
(11, '316293847', 'Miguel Ángel', 'mangel@acatlan.unam.mx', 11, 'Alumno'),
(12, '315283749', 'Lucía Méndez', 'lmendez@iztacala.unam.mx', 12, 'Alumno'),
(13, '423049586', 'Pedro Infante', 'pinfante@cuautitlan.unam.mx', 13, 'Profesor'),
(14, '318273640', 'Carmen Bustillo', 'cbustillo@aragon.unam.mx', 14, 'Profesor'),
(15, '314293845', 'Raúl Velasco', 'rvelasco@zaragoza.unam.mx', 15, 'Alumno'),
(16, '517283946', 'Paola Rojas', 'projas@artes.unam.mx', 16, 'Administrativo'),
(17, '313293841', 'Luis Miguel', 'lmiguel@musica.unam.mx', 17, 'Alumno'),
(18, '312283745', 'Silvia Pinal', 'spinal@politicas.unam.mx', 18, 'Alumno'),
(19, '424059281', 'Andrés Guardado', 'aguardado@contaduria.unam.mx', 19, 'Profesor'),
(20, '516273849', 'Hugo Sánchez', 'hsanchez@biblioteca.unam.mx', 20, 'Administrativo');

INSERT INTO Objeto (id_objeto, descripcion_detallada, lugar_aproximado_hallazgo, id_categoria, id_estado_actual, id_ubicacion_fisica) VALUES
(1, 'Laptop Dell negra con stickers', 'Facultad de Ingeniería', 1, 2, 2),
(2, 'Chamarra azul marino Pumas', 'Cafetería de Ciencias', 2, 1, 1),
(3, 'Libro Cálculo Diferencial Stewart', 'Biblioteca Central', 3, 2, 3),
(4, 'Llavero de metal con llaves Ford', 'Gimnasio Central', 5, 2, 5),
(5, 'Cartera café sin ID', 'Pasillo Derecho', 6, 6, 6),
(6, 'Termo metálico rojo', 'Jardín Filosofía', 16, 2, 4),
(7, 'Mochila negra JanSport', 'Biblioteca Economía', 7, 2, 15),
(8, 'Audífonos Sony negros', 'Lab Química', 1, 2, 10), -- Ajustado a Categoría 1 (Electrónicos)
(9, 'Credencial UNAM Licenciatura', 'Entrada Facultad', 9, 3, 7),
(10, 'Paraguas grande negro', 'Servicios Medicina', 14, 2, 9),
(11, 'Calculadora Casio fx-991LA', 'Salón 102 Acatlán', 1, 4, 12),
(12, 'Gorra deportiva blanca', 'Canchas Aragón', 2, 5, 14),
(13, 'Libreta de apuntes verde', 'Salón Psicología', 4, 2, 11),
(14, 'Lentes de sol Ray-Ban', 'Patio Cuautitlán', 8, 2, 13),
(15, 'Cargador iPhone 20W', 'Auditorio Música', 1, 2, 17), -- Ajustado a Categoría 1
(16, 'Reloj Casio vintage plata', 'Pasillo Zaragoza', 13, 1, 18),
(17, 'Tenis Nike blancos 27cm', 'Vestidores Gimnasio', 15, 2, 5),
(18, 'Carpeta de dibujo A3', 'Taller Arquitectura', 4, 1, 16),
(19, 'Smartphone Samsung A52', 'Sala C Contaduría', 1, 2, 19),
(20, 'USB 64GB color azul', 'Cómputo Central', 1, 2, 20);

INSERT INTO Reporte (id_reporte, id_objeto, id_usuario_reporta) VALUES
(1, 1, 1), (2, 2, 1), (3, 3, 1), (4, 4, 1), (5, 5, 1), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10),
(11, 11, 11), (12, 12, 12), (13, 13, 13), (14, 14, 14), (15, 15, 15), (16, 16, 16), (17, 17, 17), (18, 18, 18), (19, 19, 19), (20, 20, 20);

-- Se omiten los reclamos de los objetos 8 y 20 para que la Consulta 2 devuelva resultados.
INSERT INTO Reclamo (id_reclamo, id_objeto, id_usuario_reclama, descripcion_sucedido) VALUES
(1, 5, 4, 'Se cayó mi cartera al salir de clase'),
(2, 9, 1, 'Olvidé mi credencial en la jardinera'),
(3, 1, 2, 'Dejé la laptop cargando en el salón'),
(4, 11, 11, 'La olvidé tras el examen de física'),
(5, 15, 17, 'Perdí mi cargador en el concierto de ayer'),
(6, 19, 19, 'Me sacaron el cel de la mochila'),
(7, 3, 3, 'Lo dejé en la mesa de estudio'),
(8, 2, 5, 'Olvidé la chamarra después de comer'),
(9, 7, 7, 'Dejé la mochila en el cubículo'),
(10, 4, 10, 'Cayeron mis llaves al correr'),
(11, 6, 6, 'Olvidé el termo en el banco'),
(12, 10, 12, 'Se me quedó el paraguas en el módulo'),
(13, 12, 13, 'Dejé la gorra en las gradas'),
(14, 13, 14, 'Perdí mi libreta en el auditorio'),
(15, 14, 15, 'Se cayeron los lentes de mi bolso'),
(16, 16, 16, 'Olvidé el reloj en el lavabo'),
(17, 17, 18, 'Los dejé en el casillero abierto'),
(18, 18, 20, 'Se me quedó el portafolios en el pasillo');