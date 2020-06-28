-- Se crea la base de datos
CREATE DATABASE normalizacion;

-- se ingresa a la base de datos
\c "normalizacion";

-- se crea la tabla lector
CREATE TABLE lector(

--Se crea la columna id_lector
id_lector INT,

--Se crea la columna apellido_paterno_lector
apellido_paterno_lector VARCHAR(30),

--Se crea la columna apellido_materno_lector
apellido_materno_lector VARCHAR(30),

--Se crea la columna nombre
nombre VARCHAR(20),

--Se define como primary key id_lector
PRIMARY KEY (id_lector));

-- se crea la tabla codigo_libro
CREATE TABLE codigo_libro(

--Se crea la columna codigo_libro
codigo_libro INT,

--Se crea la columna titulo
titulo VARCHAR(30),

--Se define como primary key codigo_libro
PRIMARY KEY (codigo_libro));

-- se crea la tabla editorial
CREATE TABLE editorial(

--Se crea la columna id_editorial
id_editorial INT,

--Se crea la columna editorial
editorial VARCHAR(30),

--Se define como primary key id_editorial
PRIMARY KEY (id_editorial));

-- se crea la tabla autor
CREATE TABLE autor(

--Se crea la columna id_autor
id_autor INT,

--Se crea la columna autor
autor VARCHAR(30),

--Se define como primary key id_autor
PRIMARY KEY (id_autor));

-- se crea la tabla prestamo
CREATE TABLE prestamo(

--Se crea la columna fecha_devolucion
fecha_devolucion DATE,

--Se crea la columna codigo_libro
codigo_libro int,

--Se crea la columna id_lector
id_lector int,

--Se define como clave foranea la columna codigo_libro haciendo referencia a codigo_libro de codigo_libro
FOREIGN KEY (codigo_libro) REFERENCES codigo_libro(codigo_libro),

--Se define como clave foranea la columna id_lector haciendo referencia a id_lector de lector
FOREIGN KEY (id_lector) REFERENCES lector(id_lector),

--Se define como primary key id_lector
PRIMARY KEY (id_lector));

-- se crea la tabla codigo_libro_editorial
CREATE TABLE codigo_libro_editorial(

--Se crea la columna id_editorial
id_editorial int,

--Se crea la columna codigo_libro
codigo_libro int,

--Se define como clave foranea la columna codigo_libro haciendo referencia a codigo_libro de codigo_libro
FOREIGN KEY (codigo_libro) REFERENCES codigo_libro(codigo_libro),

--Se define como clave foranea la columna id_editorial haciendo referencia a id_editorial de editorial
FOREIGN KEY (id_editorial) REFERENCES editorial(id_editorial),

--Se define como primary key id_lector
PRIMARY KEY (codigo_libro, id_editorial));


-- se crea la tabla codigo_libro_autor
CREATE TABLE codigo_libro_autor(

--Se crea la columna id_editorial
id_editorial int,

--Se crea la columna id_autor
id_autor int,

--Se define como clave foranea la columna id_editorial haciendo referencia a id_editorial de editorial
FOREIGN KEY (id_editorial) REFERENCES editorial(id_editorial),

--Se define como clave foranea la columna id_autor haciendo referencia a id_autor de autor
FOREIGN KEY (id_autor) REFERENCES autor(id_autor),

--Se define como primary key id_lector
PRIMARY KEY (id_autor, id_editorial));
