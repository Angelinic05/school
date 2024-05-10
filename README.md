# PROYECTO - Productos



**Creación de la base de datos**

```
CREATE DATABASES school;
USE school
```

**DER**

![image](DER_school.png)

**Creación de tablas**

```sql
CREATE TABLE pais(
    codigo INT(10) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL);

CREATE TABLE dpto(
    codigo INT(10) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    codigo_pais INT(10),
    CONSTRAINT FK_dptopais FOREIGN KEY (codigo_pais) REFERENCES pais(codigo));

CREATE TABLE ciudad(
    codigo INT(10) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    codigo_dpto INT(10),
    CONSTRAINT FK_ciudaddpto FOREIGN KEY (codigo_dpto) REFERENCES dpto(codigo));
    
CREATE TABLE tipo_telefono(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(30) NOT NULL);

CREATE TABLE facultad(
    codigo INT(10) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL);
    
CREATE TABLE grado(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL);
    
CREATE TABLE tipo_asignatura(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(30) NOT NULL);
    
    
CREATE TABLE profesor(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nif VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),
    direccion VARCHAR(30) NOT NULL,
    fecha_nac DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    codigo_ciudad INT(10) NOT NULL,
    CONSTRAINT FK_profesorciudad FOREIGN KEY (codigo_ciudad) REFERENCES ciudad(codigo),
    codigo_facultad INT(10) NOT NULL,
    CONSTRAINT FK_profesorfacultad FOREIGN KEY (codigo_facultad ) REFERENCES facultad(codigo));
    
    
CREATE TABLE asignatura(
    id INT(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    creditos INT(10) NOT NULL,
    cuatrimestre VARCHAR(20) NOT NULL,
    id_grado INT(10) NOT NULL,
    CONSTRAINT FK_asignaturagrado FOREIGN KEY (id_grado) REFERENCES grado(id));

CREATE TABLE alumno(
    identificacion INT(10) PRIMARY KEY,
    nif VARCHAR(50) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30),
    direccion VARCHAR(30) NOT NULL,
    fecha_nac DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    codigo_ciudad INT(10) NOT NULL,
    CONSTRAINT FK_alumnociudad FOREIGN KEY (codigo_ciudad) REFERENCES ciudad(codigo));
    

CREATE TABLE curso(
    id INT(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL);
    
CREATE TABLE telefono(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    numero INT(10) NOT NULL,
    prefijo VARCHAR(5) NOT NULL,
    id_tipo_telefono INT(10),
    cedula_profesor INT(10),
    identificacion_alumno INT(10),
    CONSTRAINT FK_teltipo FOREIGN KEY (id_tipo_telefono) REFERENCES tipo_telefono(id),
    CONSTRAINT FK_telprofesor FOREIGN KEY (cedula_profesor) REFERENCES profesor(id),
    CONSTRAINT FK_telalumno FOREIGN KEY (identificacion_alumno) REFERENCES alumno(identificacion));
    
CREATE TABLE curso_escolar(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    anyo_inicio DATE NOT NULL,
    anyo_fin DATE NOT NULL);
    
CREATE TABLE alumno_asignatura(
    identificacion_alumno INT(10) NOT NULL,
    id_curso_escolar INT(10) NOT NULL,
    id_asignatura INT(10) NOT NULL,
    PRIMARY KEY (identificacion_alumno, id_curso_escolar, id_asignatura),
    CONSTRAINT FK_asal FOREIGN KEY (identificacion_alumno) REFERENCES alumno(identificacion),
    CONSTRAINT FK_ascures FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id),
    CONSTRAINT FK_asasign FOREIGN KEY (id_asignatura) REFERENCES asignatura(id));
    
    
CREATE TABLE asigna_curso_profesor(
    cedula_profesor INT(10),
    id_curso INT(10) NOT NULL,
    id_asignatura INT(10) NOT NULL,
    PRIMARY KEY (cedula_profesor, id_curso, id_asignatura),
    CONSTRAINT FK_asprof FOREIGN KEY (cedula_profesor) REFERENCES profesor(id),
    CONSTRAINT FK_ascurso FOREIGN KEY (id_curso) REFERENCES curso(id),
    CONSTRAINT FK_ascurpro FOREIGN KEY (id_asignatura) REFERENCES asignatura(id));

```



**Insercion de datos**

~~~sql

INSERT INTO pais (nombre) VALUES 
('España'),
('Francia'),
('Alemania'),
('Italia'),
('Portugal'),
('Reino Unido'),
('Estados Unidos'),
('Canadá'),
('México'),
('Brasil'),
('Argentina'),
('Chile'),
('Australia'),
('Japón'),
('China'),
('Colombia');


INSERT INTO dpto (nombre, codigo_pais) VALUES 
('Madrid', 1),
('Barcelona', 1),
('París', 2),
('Marsella', 2),
('Berlín', 3),
('Múnich', 3),
('Roma', 4),
('Milán', 4),
('Lisboa', 5),
('Oporto', 5),
('Londres', 6),
('Liverpool', 6),
('Nueva York', 7),
('Los Ángeles', 7),
('Toronto', 8),
('Montreal', 8),
('Ciudad de México', 9),
('Guadalajara', 9),
('São Paulo', 10),
('Río de Janeiro', 10),
('Buenos Aires', 11),
('Córdoba', 11),
('Santiago', 12),
('Valparaíso', 12),
('Sídney', 13),
('Melbourne', 13),
('Tokio', 14),
('Osaka', 14),
('Pekín', 15),
('Shanghái', 15),
('Bogotá', 16); 


INSERT INTO ciudad (nombre, codigo_dpto) VALUES 
('Madrid', 1),
('Barcelona', 2),
('París', 3),
('Marsella', 4),
('Berlín', 5),
('Múnich', 6),
('Roma', 7),
('Milán', 8),
('Lisboa', 9),
('Oporto', 10),
('Londres', 11),
('Liverpool', 12),
('Nueva York', 13),
('Los Ángeles', 14),
('Toronto', 15),
('Montreal', 16),
('Ciudad de México', 17),
('Guadalajara', 18),
('São Paulo', 19),
('Río de Janeiro', 20),
('Buenos Aires', 21),
('Córdoba', 22),
('Santiago', 23),
('Valparaíso', 24),
('Sídney', 25),
('Melbourne', 26),
('Tokio', 27),
('Osaka', 28),
('Pekín', 29),
('Shanghái', 30),
('Bogotá', 31); 



INSERT INTO tipo_telefono (descripcion) VALUES 
('Móvil'),
('Fijo');

INSERT INTO facultad (nombre) VALUES 
('Facultad de Ciencias'),
('Facultad de Letras'),
('Facultad de Medicina'),
('Facultad de Ingeniería'),
('Facultad de Derecho');

INSERT INTO grado (nombre) VALUES 
('Ingeniería Informática'),
('Matemáticas'),
('Biología'),
('Historia'),
('Medicina'); 

INSERT INTO tipo_asignatura (descripcion) VALUES 
('Troncal'),
('Obligatoria'),
('Optativa'),
('Prácticas');


INSERT INTO profesor (nif, nombre, apellido1, apellido2, direccion, fecha_nac, sexo, codigo_ciudad, codigo_facultad) VALUES 
(123456789, 'Juan', 'García', 'López', 'Calle Mayor 123', '1980-05-15', 'Masculino', 1, 3),
(234567890, 'María', 'Martínez', 'Sánchez', 'Avenida Libertad 456', '1975-10-20', 'Femenino', 2, 2),
(345678901, 'Pedro', 'Fernández', 'Gómez', 'Plaza España 789', '1982-03-10', 'Masculino', 3, 1),
(456789012, 'Ana', 'Pérez', 'Rodríguez', 'Calle Real 234', '1978-08-25', 'Femenino', 4, 4),
(567890123, 'David', 'López', 'Martín', 'Paseo de la Castellana 567', '1985-12-05
', 'Masculino', 5, 5),
(678901234, 'Laura', 'Gómez', 'Hernández', 'Avenida Diagonal 890', '1983-07-30', 'Femenino', 6, 1),
(789012345, 'Carlos', 'Sánchez', 'Díaz', 'Rambla Cataluña 123', '1970-11-18', 'Masculino', 7, 2),
(890123456, 'Elena', 'Rodríguez', 'Fernández', 'Calle Gran Vía 456', '1972-09-03', 'Femenino', 8, 3),
(901234567, 'Francisco', 'Martín', 'Pérez', 'Plaza Mayor 789', '1976-04-12', 'Masculino', 9, 5),
(123012301, 'Isabel', 'Hernández', 'Gutiérrez', 'Avenida de la Constitución 012', '1988-02-20', 'Femenino', 10, 4),
(230123012, 'Andrés', 'López', 'Soto', 'Carrera 7 # 50-21', '1972-03-25', 'Masculino', 16, 1); 


INSERT INTO asignatura (id, nombre, creditos, cuatrimestre, id_grado) VALUES 
(1, 'Programación', 6, 'Primero', 1),
(2, 'Matemáticas Avanzadas', 6, 'Segundo', 1),
(3, 'Base de Datos', 6, 'Tercero', 1),
(4, 'Inteligencia Artificial', 6, 'Cuarto', 1),
(5, 'Historia del Arte', 6, 'Primero', 2),
(6, 'Literatura Española', 6, 'Segundo', 2),
(7, 'Geometría', 6, 'Tercero', 2),
(8, 'Probabilidad y Estadística', 6, 'Cuarto', 2),
(9, 'Biología Celular', 6, 'Primero', 3),
(10, 'Genética', 6, 'Segundo', 3),
(11, 'Ecología', 6, 'Tercero', 3),
(12, 'Bioquímica', 6, 'Cuarto', 3),
(13, 'Historia Antigua', 6, 'Primero', 4),
(14, 'Historia Contemporánea', 6, 'Segundo', 4),
(15, 'Historia del Mundo Actual', 6, 'Tercero', 4),
(16, 'Historia del Pensamiento Político', 6, 'Cuarto', 4),
(17, 'Anatomía', 6, 'Primero', 5),
(18, 'Fisiología', 6, 'Segundo', 5),
(19, 'Farmacología', 6, 'Tercero', 5),
(20, 'Patología', 6, 'Cuarto', 5),
(21, 'Física Cuántica', 6, 'Primero', 1), -- Agregado para garantizar resultados en las consultas
(22, 'Geografía Mundial', 6, 'Segundo', 2), -- Agregado para garantizar resultados en las consultas
(23, 'Microbiología', 6, 'Tercero', 3), -- Agregado para garantizar resultados en las consultas
(24, 'Arte Moderno', 6, 'Cuarto', 4), -- Agregado para garantizar resultados en las consultas
(25, 'Anatomía Patológica', 6, 'Primero', 5); 


INSERT INTO alumno (identificacion, nif, nombre, apellido1, apellido2, direccion, fecha_nac, sexo, codigo_ciudad) VALUES 
(111111111, '11111111A', 'Ana', 'García', 'López', 'Calle Mayor 1', '2000-01-15', 'Femenino', 1),
(222222222, '22222222B', 'José', 'Martínez', 'Sánchez', 'Avenida Libertad 2', '1999-05-20', 'Masculino', 2),
(333333333, '33333333C', 'María', 'Fernández', 'Gómez', 'Plaza España 3', '2001-07-10', 'Femenino', 3),
(444444444, '44444444D', 'Juan', 'Pérez', 'Rodríguez',

 'Calle Real 4', '2002-09-25', 'Masculino', 4),
(555555555, '55555555E', 'Laura', 'López', 'Martín', 'Paseo de la Castellana 5', '2003-12-05', 'Femenino', 5),
(666666666, '66666666F', 'Carlos', 'Gómez', 'Hernández', 'Avenida Diagonal 6', '2000-07-30', 'Masculino', 6),
(777777777, '77777777G', 'Elena', 'Sánchez', 'Díaz', 'Rambla Cataluña 7', '1998-11-18', 'Femenino', 7),
(888888888, '88888888H', 'Andrés', 'Rodríguez', 'Fernández', 'Calle Gran Vía 8', '1999-09-03', 'Masculino', 8),
(999999999, '99999999I', 'Isabel', 'Hernández', 'Gutiérrez', 'Avenida de la Constitución 9', '1998-02-20', 'Femenino', 9),
(101010101, '10101010J', 'Francisco', 'López', 'Soto', 'Carrera 10', '1999-03-25', 'Masculino', 10); 


INSERT INTO curso (id, nombre) VALUES 
(1, 'Curso 1'),
(2, 'Curso 2'),
(3, 'Curso 3'),
(4, 'Curso 4'),
(5, 'Curso 5'),
(6, 'Curso 6'),
(7, 'Curso 7'),
(8, 'Curso 8'),
(9, 'Curso 9'),
(10, 'Curso 10'); 


INSERT INTO telefono (numero, prefijo, id_tipo_telefono, cedula_profesor, identificacion_alumno) VALUES 
(123456789, '+34', 1, NULL, NULL),
(987654321, '+34', 2, NULL, 111111111),
(555444333, '+34', 1, NULL, NULL),
(111222333, '+34', 2, NULL, 222222222),
(999888777, '+34', 1, NULL, NULL),
(222333444, '+34', 2, NULL, 444444444),
(666777888, '+34', 1, NULL, NULL),
(444555666, '+34', 2, NULL, 555555555),
(888999000, '+34', 1, NULL, NULL),
(333444555, '+34', 2, NULL, 777777777),
(111222333, '+34', 1, NULL, NULL),
(555666777, '+34', 2, NULL, 999999999),
(222333444, '+34', 1, NULL, NULL);


```

### Para la tabla `curso_escolar`:
```sql
INSERT INTO curso_escolar (anyo_inicio, anyo_fin) VALUES 
('2018-09-01', '2019-06-30'),
('2019-09-01', '2020-06-30'),
('2020-09-01', '2021-06-30'),
('2021-09-01', '2022-06-30'),
('2022-09-01', '2023-06-30'); -- Ya estaba completo
```

### Para la tabla `alumno_asignatura`:
```sql
INSERT INTO alumno_asignatura (identificacion_alumno, id_curso_escolar, id_asignatura) VALUES 
(111111111, 1, 1),
(111111111, 2, 2),
(222222222, 1, 3),
(222222222, 2, 4),
(333333333, 1, 5),
(333333333, 2, 6),
(444444444, 1, 7),
(444444444, 2, 8),
(555555555, 1, 9),
(555555555, 2, 10),
(666666666, 1, 11),
(666666666, 2, 12),
(777777777, 1, 13),
(777777777, 2, 14),
(888888888, 1, 15),
(888888888, 2, 16),
(999999999, 1, 17),
(999999999, 2, 18),
(101010101, 1, 19),
(101010101, 2, 20); 

INSERT INTO asigna_curso_profesor (cedula_profesor, id_curso, id_asignatura) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 1, 3),
(2, 2, 4),
(3, 1, 5),
(3, 2, 6),
(4, 1, 7),
(4, 2, 8),
(5, 1, 9),
(5, 2, 10),
(6, 1, 11),
(6, 2, 12),
(7, 1, 13),
(7, 2, 14),
(8, 1, 15),
(8, 2, 16),
(9, 1, 17),
(9, 2, 18),
(10, 1, 19),
(10, 2, 20);

INSERT INTO pais (nombre) VALUES 
('España'),
('Francia'),
('Alemania');


INSERT INTO dpto (nombre, codigo_pais) VALUES
('Departamento 1', 1),
('Departamento 2', 2),
('Departamento 3', 3);


INSERT INTO ciudad (nombre, codigo_dpto) VALUES
('Ciudad 1', 1),
('Ciudad 2', 2),
('Ciudad 3', 3);


INSERT INTO tipo_telefono (descripcion) VALUES
('Móvil'),
('Fijo');


INSERT INTO facultad (nombre) VALUES
('Facultad 1'),
('Facultad 2'),
('Facultad 3');

INSERT INTO alumno (identificacion, nif, nombre, apellido1, apellido2, direccion, fecha_nac, sexo, codigo_ciudad) VALUES
(1, '12345678K', 'Alumno', 'Apellido1', 'Apellido2', 'Dirección 1', '2000-01-01', 'Masculino', 1),
(2, '87654321K', 'Alumna', 'Apellido1', 'Apellido2', 'Dirección 2', '2000-01-01', 'Femenino', 2);



INSERT INTO tipo_telefono (descripcion) VALUES
('Móvil'),
('Fijo');

INSERT INTO telefono (numero, prefijo, id_tipo_telefono, cedula_profesor) VALUES
(123456789, '+34', 1, 1),
(987654321, '+34', 1, 2);


INSERT INTO curso_escolar (anyo_inicio, anyo_fin) VALUES
('2022-09-01', '2023-06-30'),
('2023-09-01', '2024-06-30');


INSERT INTO alumno_asignatura (identificacion_alumno, id_curso_escolar, id_asignatura) VALUES
(1, 1, 1),
(2, 2, 2);



INSERT INTO profesor (nif, nombre, apellido1, apellido2, direccion, fecha_nac, sexo, codigo_ciudad, codigo_facultad)
VALUES
('1111111K', 'Juan', 'Pérez', 'García', 'Calle Principal 123', '1980-05-15', 'Masculino', 1, 1),
('2222222K', 'María', 'López', 'Martínez', 'Avenida Central 456', '1975-08-20', 'Femenino', 2, 2),
('3333333K', 'Pedro', 'González', 'Sánchez', 'Plaza Mayor 789', '1982-03-10', 'Masculino', 3, 3),
('4444444K', 'Ana', 'Martín', 'Fernández', 'Calle Secundaria 321', '1978-11-30', 'Femenino', 1, 2);
~~~



#### Consultas sobre una tabla

1. **Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.**

     ```sql
     SELECT apellido1, apellido2, nombre
     FROM alumno
     ORDER BY apellido1, apellido2, nombre;
     
     +------------+------------+-----------+
     | apellido1  | apellido2  | nombre	|
     +------------+------------+-----------+
     | Fernández  | Gómez  	| María 	|
     | García 	| López  	| Ana   	|
     | Gómez  	| Hernández  | Carlos	|
     | Hernández  | Gutiérrez  | Isabel	|
     | López  	| Martín 	| Laura 	|
     | López  	| Soto   	| Francisco |
     | Martínez   | Sánchez	| José  	|
     | Pérez  	| Rodríguez  | Juan  	|
     | Rodríguez  | Fernández  | Andrés	|
     | Sánchez	| Díaz   	| Elena 	|
     +------------+------------+-----------+
     
     ```

     

2. **Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.**

     ```sql
     c
     ```

     

3. **Devuelve el listado de los alumnos que nacieron en 1999.**

     ```sql
     SELECT *
     FROM alumno
     WHERE YEAR(fecha_nac) = 1999;
     
     +----------------+-----------+-----------+------------+------------+--------------------+------------+-----------+---------------+
     | identificacion | nif   	| nombre	| apellido1  | apellido2  | direccion      	| fecha_nac  | sexo  	| codigo_ciudad |
     +----------------+-----------+-----------+------------+------------+--------------------+------------+-----------+---------------+
     |  	101010101 | 10101010J | Francisco | López  	| Soto   	| Carrera 10     	| 1999-03-25 | Masculino |        	10 |
     |  	222222222 | 22222222B | José  	| Martínez   | Sánchez	| Avenida Libertad 2 | 1999-05-20 | Masculino |         	2 |
     |  	888888888 | 88888888H | Andrés	| Rodríguez  | Fernández  | Calle Gran Vía 8   | 1999-09-03 | Masculino |         	8 |
     +----------------+-----------+-----------+------------+------------+--------------------+------------+-----------+---------------+
     ```

     

4. **Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.**

     ```sql
     SELECT *
     FROM profesor
     WHERE id NOT IN (SELECT cedula_profesor FROM telefono WHERE cedula_profesor IS NOT NULL)
     AND RIGHT(nif, 1) = 'K';
     
     +----+----------+--------+-----------+------------+----------------------+------------+-----------+---------------+-----------------+
     | id | nif  	| nombre | apellido1 | apellido2  | direccion        	| fecha_nac  | sexo  	| codigo_ciudad | codigo_facultad |
     +----+----------+--------+-----------+------------+----------------------+------------+-----------+---------------+-----------------+
     | 12 | 1111111K | Juan   | Pérez 	| García 	| Calle Principal 123  | 1980-05-15 | Masculino |         	1 |           	1 |
     | 13 | 2222222K | María  | López 	| Martínez   | Avenida Central 456  | 1975-08-20 | Femenino  |         	2 |           	2 |
     | 14 | 3333333K | Pedro  | González  | Sánchez	| Plaza Mayor 789  	| 1982-03-10 | Masculino |         	3 |           	3 |
     | 15 | 4444444K | Ana	| Martín	| Fernández  | Calle Secundaria 321 | 1978-11-30 | Femenino  |         	1 |           	2 |
     +----+----------+--------+-----------+------------+----------------------+------------+-----------+---------------+-----------------+
     
     ```

     

5. **Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.**

     ```sql
     SELECT a.*
     FROM asignatura a
     INNER JOIN alumno_asignatura aa ON a.id = aa.id_asignatura
     INNER JOIN curso_escolar ce ON aa.id_curso_escolar = ce.id
     WHERE a.cuatrimestre = 'Primero'
     AND a.id_grado = 7
     AND ce.anyo_fin - ce.anyo_inicio = 3; 
     
     ```
     
     

#### Consultas multitabla (Composición interna)

1. **Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).**

   ```sql
   SELECT DISTINCT a.*
   FROM alumno a
   JOIN alumno_asignatura aa ON a.identificacion = aa.identificacion_alumno
   JOIN asignatura asi ON aa.id_asignatura = asi.id
   JOIN grado g ON asi.id_grado = g.id
   WHERE g.nombre = 'Ingeniería Informática' AND a.sexo = 'Femenino';
   +----------------+-----------+--------+-----------+-----------+---------------+------------+----------+---------------+
   | identificacion | nif   	| nombre | apellido1 | apellido2 | direccion 	| fecha_nac  | sexo 	| codigo_ciudad |
   +----------------+-----------+--------+-----------+-----------+---------------+------------+----------+---------------+
   |  	111111111 | 11111111A | Ana	| García	| López 	| Calle Mayor 1 | 2000-01-15 | Femenino |         	1 |
   +----------------+-----------+--------+-----------+-----------+---------------+------------+----------+---------------+
   
   ```

   

2. **Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).**

   ```sql
   SELECT DISTINCT asi.nombre
   FROM asignatura asi
   JOIN grado g ON asi.id_grado = g.id
   WHERE g.nombre = 'Ingeniería Informática' ;
   
   +-------------------------+
   | nombre              	|
   +-------------------------+
   | Programación        	|
   | Matemáticas Avanzadas   |
   | Base de Datos       	|
   | Inteligencia Artificial |
   | Física Cuántica     	|
   +-------------------------+
   
   ```

   

3. **Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.**

   ```sql
   SELECT p.apellido1, p.apellido2, p.nombre, f.nombre AS nombre_departamento
   FROM profesor p
   LEFT JOIN facultad f ON p.codigo_facultad = f.codigo
   ORDER BY f.nombre, p.apellido1, p.apellido2, p.nombre;
   
   +------------+------------+-----------+-------------------------+
   | apellido1  | apellido2  | nombre	| nombre_departamento 	|
   +------------+------------+-----------+-------------------------+
   | Fernández  | Gómez  	| Pedro 	| Facultad de Ciencias	|
   | Gómez  	| Hernández  | Laura 	| Facultad de Ciencias	|
   | López  	| Soto   	| Andrés	| Facultad de Ciencias	|
   | López  	| Martín 	| David 	| Facultad de Derecho 	|
   | Martín 	| Pérez  	| Francisco | Facultad de Derecho 	|
   | Hernández  | Gutiérrez  | Isabel	| Facultad de Ingeniería  |
   | Pérez  	| Rodríguez  | Ana   	| Facultad de Ingeniería  |
   | Martínez   | Sánchez	| María 	| Facultad de Letras  	|
   | Sánchez	| Díaz   	| Carlos	| Facultad de Letras  	|
   | García 	| López  	| Juan  	| Facultad de Medicina	|
   | Rodríguez  | Fernández  | Elena 	| Facultad de Medicina	|
   +------------+------------+-----------+-------------------------+
   
   ```

   

4. **Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.**

   ```sql
   
   ```

   

5. **Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).**

   ~~~sql
   SELECT DISTINCT f.nombre
   FROM facultad f
   JOIN profesor p ON f.codigo = p.codigo_facultad
   JOIN asigna_curso_profesor acp ON p.id = acp.cedula_profesor
   JOIN asignatura asi ON acp.id_asignatura = asi.id
   JOIN grado g ON asi.id_grado = g.id
   WHERE g.nombre = 'Ingeniería Informática';
   ```
   +----------------------+
   | nombre           	|
   +----------------------+
   | Facultad de Medicina |
   | Facultad de Letras   |
   +----------------------+
   
   ~~~

   

6. **Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.**

   ```sql
   SELECT DISTINCT a.*
   FROM alumno a
   JOIN alumno_asignatura aa ON a.identificacion = aa.identificacion_alumno
   JOIN curso_escolar ce ON aa.id_curso_escolar = ce.id
   WHERE YEAR(ce.anyo_inicio) = 2018 AND YEAR(ce.anyo_fin) = 2019;
   
   +----------------+-----------+-----------+------------+------------+-------------------------------+------------+-----------+---------------+
   | identificacion | nif   	| nombre	| apellido1  | apellido2  | direccion                 	| fecha_nac  | sexo  	| codigo_ciudad |
   +----------------+-----------+-----------+------------+------------+-------------------------------+------------+-----------+---------------+
   |  	101010101 | 10101010J | Francisco | López  	| Soto   	| Carrera 10                	| 1999-03-25 | Masculino |        	10 |
   |  	111111111 | 11111111A | Ana   	| García 	| López  	| Calle Mayor 1             	| 2000-01-15 | Femenino  |         	1 |
   |  	222222222 | 22222222B | José  	| Martínez   | Sánchez	| Avenida Libertad 2        	| 1999-05-20 | Masculino |         	2 |
   |  	333333333 | 33333333C | María 	| Fernández  | Gómez  	| Plaza España 3            	| 2001-07-10 | Femenino  |         	3 |
   |  	444444444 | 44444444D | Juan  	| Pérez  	| Rodríguez  | Calle Real 4              	| 2002-09-25 | Masculino |         	4 |
   |  	555555555 | 55555555E | Laura 	| López  	| Martín 	| Paseo de la Castellana 5  	| 2003-12-05 | Femenino  |         	5 |
   |  	666666666 | 66666666F | Carlos	| Gómez  	| Hernández  | Avenida Diagonal 6        	| 2000-07-30 | Masculino |         	6 |
   |  	777777777 | 77777777G | Elena 	| Sánchez	| Díaz   	| Rambla Cataluña 7         	| 1998-11-18 | Femenino  |         	7 |
   |  	888888888 | 88888888H | Andrés	| Rodríguez  | Fernández  | Calle Gran Vía 8          	| 1999-09-03 | Masculino |         	8 |
   |  	999999999 | 99999999I | Isabel	| Hernández  | Gutiérrez  | Avenida de la Constitución 9  | 1998-02-20 | Femenino  |         	9 |
   +----------------+-----------+-----------+------------+------------+-------------------------------+------------+-----------+---------------+
   
   ```

   

#### Consultas multitabla (Composición externa)

Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. **Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado**
   **alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.**

   ```sql
   SELECT f.nombre, p.apellido1, p.apellido2, p.nombre
   FROM profesor p
   LEFT JOIN facultad f ON p.codigo_facultad = f.codigo
   ORDER BY f.nombre, p.apellido1, p.apellido2, p.nombre;
   
   +-------------------------+------------+------------+-----------+
   | nombre              	| apellido1  | apellido2  | nombre	|
   +-------------------------+------------+------------+-----------+
   | Facultad de Ciencias	| Fernández  | Gómez  	| Pedro 	|
   | Facultad de Ciencias	| Gómez  	| Hernández  | Laura 	|
   | Facultad de Ciencias	| López  	| Soto   	| Andrés	|
   | Facultad de Derecho 	| López  	| Martín 	| David 	|
   | Facultad de Derecho 	| Martín 	| Pérez  	| Francisco |
   | Facultad de Ingeniería  | Hernández  | Gutiérrez  | Isabel	|
   | Facultad de Ingeniería  | Pérez  	| Rodríguez  | Ana   	|
   | Facultad de Letras  	| Martínez   | Sánchez	| María 	|
   | Facultad de Letras  	| Sánchez	| Díaz   	| Carlos	|
   | Facultad de Medicina	| García 	| López  	| Juan  	|
   | Facultad de Medicina	| Rodríguez  | Fernández  | Elena 	|
   +-------------------------+------------+------------+-----------+
   
   ```

   

2. **Devuelve un listado con los profesores que no están asociados a un departamento.**

   ```sql
   SELECT *
   FROM profesor
   WHERE codigo_facultad NOT IN (SELECT codigo FROM dpto);
   ```

   

3. **Devuelve un listado con los departamentos que no tienen profesores asociados.**

   ```sql
   SELECT *
   FROM dpto
   WHERE codigo NOT IN (SELECT codigo_pais FROM profesor);
   
   +--------+-------------------+-------------+
   | codigo | nombre        	| codigo_pais |
   +--------+-------------------+-------------+
   |  	2 | Barcelona     	|       	1 |
   |  	3 | París         	|       	2 |
   |  	4 | Marsella      	|       	2 |
   |  	5 | Berlín        	|       	3 |
   |  	6 | Múnich        	|       	3 |
   |  	7 | Roma          	|       	4 |
   |  	8 | Milán         	|       	4 |
   |  	9 | Lisboa        	|       	5 |
   | 	10 | Oporto        	|       	5 |
   | 	11 | Londres       	|       	6 |
   | 	12 | Liverpool     	|       	6 |
   | 	13 | Nueva York    	|       	7 |
   | 	14 | Los Ángeles   	|       	7 |
   | 	15 | Toronto       	|       	8 |
   | 	16 | Montreal      	|       	8 |
   | 	17 | Ciudad de México  |       	9 |
   | 	18 | Guadalajara   	|       	9 |
   | 	19 | São Paulo     	|       	10 |
   | 	20 | Río de Janeiro	|       	10 |
   | 	21 | Buenos Aires  	|      	 11 |
   | 	22 | Córdoba       	|      	 11 |
   | 	23 | Santiago      	|      	 12 |
   | 	24 | Valparaíso    	|      	 12 |
   | 	25 | Sídney        	|      	 13 |
   | 	26 | Melbourne     	|      	 13 |
   | 	27 | Tokio         	|      	 14 |
   | 	28 | Osaka         	|      	 14 |
   | 	29 | Pekín         	|      	 15 |
   | 	30 | Shanghái      	|      	 15 |
   | 	31 | Bogotá        	|      	 16 |
   | 	32 | Departamento 1	|       	1 |
   | 	33 | Departamento 2	|       	2 |
   | 	34 | Departamento 3	|       	3 |
   +--------+-------------------+-------------+
   ```

   

4. **Devuelve un listado con los profesores que no imparten ninguna asignatura.**

   ```sql
   SELECT p.*
   FROM profesor p
   LEFT JOIN asigna_curso_profesor acp ON p.id = acp.cedula_profesor
   WHERE acp.id_asignatura IS NULL;
   
   +----+-----------+---------+-----------+-----------+-------------------+------------+-----------+---------------+-----------------+
   | id | nif   	| nombre  | apellido1 | apellido2 | direccion     	| fecha_nac  | sexo  	| codigo_ciudad | codigo_facultad |
   +----+-----------+---------+-----------+-----------+-------------------+------------+-----------+---------------+-----------------+
   | 11 | 230123012 | Andrés  | López 	| Soto  	| Carrera 7 # 50-21 | 1972-03-25 | Masculino |        	16 |           	1 |
   +----+-----------+---------+-----------+-----------+-------------------+------------+-----------+---------------+-----------------+
   
   ```

   

5. **Devuelve un listado con las asignaturas que no tienen un profesor asignado.**

   ```sql
   SELECT a.*
   FROM asignatura a
   LEFT JOIN asigna_curso_profesor acp ON a.id = acp.id_asignatura
   WHERE acp.id_asignatura IS NULL;
   +----+-----------------------+----------+--------------+----------+
   | id | nombre            	| creditos | cuatrimestre | id_grado |
   +----+-----------------------+----------+--------------+----------+
   | 21 | Física Cuántica   	|    	6 | Primero  	|    	1 |
   | 22 | Geografía Mundial 	|    	6 | Segundo  	|    	2 |
   | 23 | Microbiología     	|    	6 | Tercero  	|    	3 |
   | 24 | Arte Moderno      	|    	6 | Cuarto   	|    	4 |
   | 25 | Anatomía Patológica   |    	6 | Primero  	|    	5 |
   +----+-----------------------+----------+--------------+----------+
   
   ```

   

6. **Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.**

   ```sql
   SELECT f.*
   FROM facultad f
   LEFT JOIN profesor p ON f.codigo = p.codigo_facultad
   LEFT JOIN asigna_curso_profesor acp ON p.id = acp.cedula_profesor
   WHERE acp.id_asignatura IS NULL;
   
   +--------+----------------------+
   | codigo | nombre           	|
   +--------+----------------------+
   |  	1 | Facultad de Ciencias |
   +--------+----------------------+
   
   ```

   

#### Consultas resumen

1. **Devuelve el número total de alumnas que hay.**

   ```sql
   SELECT COUNT(*)
   FROM alumno
   WHERE sexo = 'Femenino';
   
   +----------+
   | COUNT(*) |
   +----------+
   |    	5 |
   +----------+
   
   ```

   

2. **Calcula cuántos alumnos nacieron en 1999.**

   ```sql
   SELECT COUNT(*)
   FROM alumno
   WHERE YEAR(fecha_nac) = 1999;
   
   +----------+
   | COUNT(*) |
   +----------+
   |    	3 |
   +----------+
   
   ```

   

3. **Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.**

   ```sql
   SELECT f.nombre, COUNT(p.id)
   FROM facultad f
   LEFT JOIN profesor p ON f.codigo = p.codigo_facultad
   GROUP BY f.nombre
   ORDER BY COUNT(p.id) DESC;
   
   +-------------------------+-------------+
   | nombre              	| COUNT(p.id) |
   +-------------------------+-------------+
   | Facultad de Ciencias	|       	3 |
   | Facultad de Letras  	|       	2 |
   | Facultad de Medicina	|       	2 |
   | Facultad de Ingeniería  |       	2 |
   | Facultad de Derecho 	|       	2 |
   +-------------------------+-------------+
   
   ```

   

4. **Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.**

   ```sql
   SELECT f.nombre, COUNT(p.id)
   FROM facultad f
   LEFT JOIN profesor p ON f.codigo = p.codigo_facultad
   GROUP BY f.nombre;
   
   +-------------------------+-------------+
   | nombre                  | COUNT(p.id) |
   +-------------------------+-------------+
   | Facultad de Ciencias    |           3 |
   | Facultad de Letras      |           2 |
   | Facultad de Medicina    |           2 |
   | Facultad de Ingeniería  |           2 |
   | Facultad de Derecho     |           2 |
   +-------------------------+-------------+
   
   ```

   

5. **Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.**

   ```sql
   SELECT g.nombre, COUNT(a.id)
   FROM grado g
   LEFT JOIN asignatura a ON g.id = a.id_grado
   GROUP BY g.nombre
   ORDER BY COUNT(a.id) DESC;
   
   
   +--------------------------+-------------+
   | nombre               	| COUNT(a.id) |
   +--------------------------+-------------+
   | Ingeniería Informática   |       	5 |
   | Matemáticas          	|       	5 |
   | Biología             	|       	5 |
   | Historia             	|       	5 |
   | Medicina             	|       	5 |
   +--------------------------+-------------+
   
   ```

   

6. **Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.**

   ```sql
   SELECT g.nombre, COUNT(a.id) AS asignaturas_asociadas
   FROM grado g
   INNER JOIN asignatura a ON g.id = a.id_grado
   GROUP BY g.id
   HAVING COUNT(a.id) > 40;
   
   ```

   

7. **Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.**

   ```sql
   SELECT g.nombre, ta.descripcion, SUM(a.creditos)
   FROM grado g
   LEFT JOIN asignatura a ON g.id = a.id_grado
   LEFT JOIN tipo_asignatura ta ON a.id = ta.id
   GROUP BY g.nombre, ta.descripcion
   ORDER BY SUM(a.creditos) DESC;
   
   +--------------------------+-------------+-----------------+
   | nombre               	| descripcion | SUM(a.creditos) |
   +--------------------------+-------------+-----------------+
   | Matemáticas          	| NULL    	|          	30 |
   | Biología             	| NULL    	|          	30 |
   | Historia             	| NULL    	|          	30 |
   | Medicina             	| NULL    	|          	30 |
   | Ingeniería Informática   | Troncal 	|           	6 |
   | Ingeniería Informática   | Obligatoria |           	6 |
   | Ingeniería Informática   | Optativa	|           	6 |
   | Ingeniería Informática   | Prácticas   |           	6 |
   | Ingeniería Informática   | NULL    	|           	6 |
   +--------------------------+-------------+-----------------+
   
   ```

   

8. **Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.**

   ```sql
   SELECT YEAR(ce.anyo_inicio) AS anyo, COUNT(DISTINCT aa.identificacion_alumno) AS num_alumnos
   FROM curso_escolar ce
   JOIN alumno_asignatura aa ON ce.id = aa.id_curso_escolar
   GROUP BY YEAR(ce.anyo_inicio);
   
   +------+-------------+
   | anyo | num_alumnos |
   +------+-------------+
   | 2018 |      	10 |
   | 2019 |      	10 |
   +------+-------------+
   
   ```

   

9. **Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.**

   ```sql
   SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(acp.id_asignatura)
   FROM profesor p
   LEFT JOIN asigna_curso_profesor acp ON p.id = acp.cedula_profesor
   GROUP BY p.id, p.nombre, p.apellido1, p.apellido2
   ORDER BY COUNT(acp.id_asignatura) DESC;
   
   +----+-----------+------------+------------+--------------------------+
   | id | nombre	| apellido1  | apellido2  | COUNT(acp.id_asignatura) |
   +----+-----------+------------+------------+--------------------------+
   |  1 | Juan  	| García 	| López  	|                    	2 |
   |  2 | María 	| Martínez   | Sánchez	|                    	2 |
   |  3 | Pedro 	| Fernández  | Gómez  	|                    	2 |
   |  4 | Ana   	| Pérez  	| Rodríguez  |                    	2 |
   |  5 | David 	| López  	| Martín 	|                    	2 |
   |  6 | Laura 	| Gómez  	| Hernández  |                    	2 |
   |  7 | Carlos	| Sánchez	| Díaz   	|                    	2 |
   |  8 | Elena 	| Rodríguez  | Fernández  |                    	2 |
   |  9 | Francisco | Martín 	| Pérez  	|                    	2 |
   | 10 | Isabel	| Hernández  | Gutiérrez  |                    	2 |
   | 11 | Andrés	| López  	| Soto   	|                    	0 |
   +----+-----------+------------+------------+--------------------------+
   
   ```

   

#### **Subconsultas**

6. **Devuelve todos los datos del alumno más joven.**

   ```sql
   SELECT *
   FROM alumno
   WHERE fecha_nac = (SELECT MIN(fecha_nac) FROM alumno);
   
   +----------------+-----------+--------+------------+------------+-------------------------------+------------+----------+---------------+
   | identificacion | nif   	| nombre | apellido1  | apellido2  | direccion                 	| fecha_nac  | sexo 	| codigo_ciudad |
   +----------------+-----------+--------+------------+------------+-------------------------------+------------+----------+---------------+
   |  	999999999 | 99999999I | Isabel | Hernández  | Gutiérrez  | Avenida de la Constitución 9  | 1998-02-20 | Femenino |         	9 |
   +----------------+-----------+--------+------------+------------+-------------------------------+------------+----------+---------------+
   
   ```

   

7. **Devuelve un listado con los profesores que no están asociados a un departamento.**

   ```sql
   SELECT *
   FROM profesor
   WHERE codigo_facultad NOT IN (SELECT codigo FROM dpto);
   ```

   

8. **Devuelve un listado con los departamentos que no tienen profesores asociados.**

   ```sql
   SELECT *
   FROM dpto
   WHERE codigo NOT IN (SELECT codigo_pais FROM profesor);
   +--------+-------------------+-------------+
   | codigo | nombre        	| codigo_pais |
   +--------+-------------------+-------------+
   |  	2 | Barcelona     	|       	1 |
   |  	3 | París         	|       	2 |
   |  	4 | Marsella      	|       	2 |
   |  	5 | Berlín        	|       	3 |
   |  	6 | Múnich        	|       	3 |
   |  	7 | Roma          	|       	4 |
   |  	8 | Milán         	|       	4 |
   |  	9 | Lisboa        	|       	5 |
   | 	10 | Oporto        	|       	5 |
   | 	11 | Londres       	|       	6 |
   | 	12 | Liverpool     	|       	6 |
   | 	13 | Nueva York    	|       	7 |
   | 	14 | Los Ángeles   	|       	7 |
   | 	15 | Toronto       	|       	8 |
   | 	16 | Montreal      	|       	8 |
   | 	17 | Ciudad de México  |       	9 |
   | 	18 | Guadalajara   	|       	9 |
   | 	19 | São Paulo     	|      	10 |
   | 	20 | Río de Janeiro	|      	10 |
   | 	21 | Buenos Aires  	|      	11 |
   | 	22 | Córdoba       	|      	11 |
   | 	23 | Santiago      	|      	12 |
   | 	24 | Valparaíso    	|      	12 |
   | 	25 | Sídney        	|      	13 |
   | 	26 | Melbourne     	|      	13 |
   | 	27 | Tokio         	|      	14 |
   | 	28 | Osaka         	|      	14 |
   | 	29 | Pekín         	|      	15 |
   | 	30 | Shanghái      	|      	15 |
   | 	31 | Bogotá        	|      	16 |
   | 	32 | Departamento 1	|       	1 |
   | 	33 | Departamento 2	|       	2 |
   | 	34 | Departamento 3	|       	3 |
   +--------+-------------------+-------------+
   
   ```

   

9. **Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.**

   ```sql
   SELECT *
   FROM profesor
   WHERE codigo_facultad IS NOT NULL
   AND id NOT IN (SELECT cedula_profesor FROM asigna_curso_profesor);
   
   +----+-----------+---------+-----------+-----------+-------------------+------------+-----------+---------------+-----------------+
   | id | nif   	| nombre  | apellido1 | apellido2 | direccion     	| fecha_nac  | sexo  	| codigo_ciudad | codigo_facultad |
   +----+-----------+---------+-----------+-----------+-------------------+------------+-----------+---------------+-----------------+
   | 11 | 230123012 | Andrés  | López 	| Soto  	| Carrera 7 # 50-21 | 1972-03-25 | Masculino |        	16 |           	1 |
   +----+-----------+---------+-----------+-----------+-------------------+------------+-----------+---------------+-----------------+
   
   ```

   

10. **Devuelve un listado con las asignaturas que no tienen un profesor asignado.**

    ```sql
    SELECT *
    FROM asignatura
    WHERE id NOT IN (SELECT id_asignatura FROM asigna_curso_profesor);
    
    +----+-----------------------+----------+--------------+----------+
    | id | nombre            	| creditos | cuatrimestre | id_grado |
    +----+-----------------------+----------+--------------+----------+
    | 21 | Física Cuántica   	|    	6 | Primero  	|    	1 |
    | 22 | Geografía Mundial 	|    	6 | Segundo  	|    	2 |
    | 23 | Microbiología     	|    	6 | Tercero  	|    	3 |
    | 24 | Arte Moderno      	|    	6 | Cuarto   	|    	4 |
    | 25 | Anatomía Patológica   |    	6 | Primero  	|    	5 |
    +----+-----------------------+----------+--------------+----------+
    ```

    

11. **Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.**

```sql
SELECT d.*
FROM dpto d
LEFT JOIN profesor p ON d.codigo = p.codigo_facultad
LEFT JOIN asigna_curso_profesor acp ON p.id = acp.cedula_profesor
LEFT JOIN asignatura a ON acp.id_asignatura = a.id
LEFT JOIN alumno_asignatura aa ON a.id = aa.id_asignatura AND p.id = aa.identificacion_alumno
WHERE aa.identificacion_alumno IS NULL;

+--------+-------------------+-------------+
| codigo | nombre        	| codigo_pais |
+--------+-------------------+-------------+
|  	1 | Madrid        	|       	1 |
|  	1 | Madrid        	|       	1 |
|  	1 | Madrid        	|       	1 |
|  	1 | Madrid        	|       	1 |
|  	1 | Madrid        	|       	1 |
|  	2 | Barcelona     	|       	1 |
|  	2 | Barcelona     	|       	1 |
|  	2 | Barcelona     	|       	1 |
|  	2 | Barcelona     	|       	1 |
|  	3 | París         	|       	2 |
|  	3 | París         	|       	2 |
|  	3 | París         	|       	2 |
|  	4 | Marsella      	|       	2 |
|  	4 | Marsella      	|       	2 |
|  	4 | Marsella      	|       	2 |
|  	4 | Marsella      	|       	2 |
|  	5 | Berlín        	|       	3 |
|  	5 | Berlín        	|       	3 |
|  	5 | Berlín        	|       	3 |
|  	5 | Berlín        	|       	3 |
|  	6 | Múnich        	|       	3 |
|  	7 | Roma          	|       	4 |
|  	8 | Milán         	|       	4 |
|  	9 | Lisboa        	|       	5 |
| 	10 | Oporto        	|       	5 |
| 	11 | Londres       	|       	6 |
| 	12 | Liverpool     	|       	6 |
| 	13 | Nueva York    	|       	7 |
| 	14 | Los Ángeles   	|       	7 |
| 	15 | Toronto       	|       	8 |
| 	16 | Montreal      	|       	8 |
| 	17 | Ciudad de México  |       	9 |
| 	18 | Guadalajara   	|       	9 |
| 	19 | São Paulo     	|       	10 |
| 	20 | Río de Janeiro	|       	10 |
| 	21 | Buenos Aires  	|       	11 |
| 	22 | Córdoba       	|       	11 |
| 	23 | Santiago      	|       	12 |
| 	24 | Valparaíso    	|       	12 |
| 	25 | Sídney        	|       	13 |
| 	26 | Melbourne     	|       	13 |
| 	27 | Tokio         	|       	14 |
| 	28 | Osaka         	|       	14 |
| 	29 | Pekín         	|       	15 |
| 	30 | Shanghái      	|       	15 |
| 	31 | Bogotá        	|       	16 |
| 	32 | Departamento 1	|       	1 |
| 	33 | Departamento 2	|       	2 |
| 	34 | Departamento 3	|       	3 |
+--------+-------------------+-------------+
```





#### VISTAS

1. **Vista de información de profesores y su ciudad:**
```sql
CREATE VIEW vista_profesor_ciudad AS
SELECT p.id, p.nombre, p.apellido1, p.apellido2, c.nombre AS ciudad
FROM profesor p
INNER JOIN ciudad c ON p.codigo_ciudad = c.codigo;
```

2. **Vista de asignaturas por grado:**
```sql
CREATE VIEW vista_asignaturas_por_grado AS
SELECT g.nombre AS grado, a.nombre AS asignatura, a.cuatrimestre
FROM asignatura a
INNER JOIN grado g ON a.id_grado = g.id;
```

3. **Vista de alumnos y sus asignaturas matriculadas:**
```sql
CREATE VIEW vista_alumnos_asignaturas AS
SELECT al.nombre AS nombre_alumno, al.apellido1, al.apellido2, a.nombre AS asignatura, a.cuatrimestre
FROM alumno al
INNER JOIN alumno_asignatura aa ON al.identificacion = aa.identificacion_alumno
INNER JOIN asignatura a ON aa.id_asignatura = a.id;
```

4. **Vista de profesores y sus asignaturas impartidas:**
```sql
CREATE VIEW vista_profesores_asignaturas AS
SELECT p.nombre, p.apellido1, p.apellido2, a.nombre AS asignatura, a.cuatrimestre
FROM profesor p
INNER JOIN asigna_curso_profesor acp ON p.id = acp.cedula_profesor
INNER JOIN asignatura a ON acp.id_asignatura = a.id;
```

5. **Vista de información de teléfonos de profesores y alumnos:**
```sql
CREATE VIEW vista_telefonos AS
SELECT p.nombre AS nombre_profesor, p.apellido1 AS apellido_profesor, p.apellido2 AS apellido2_profesor, t.numero AS numero_telefono
FROM profesor p
INNER JOIN telefono t ON p.id = t.cedula_profesor
UNION
SELECT a.nombre AS nombre_alumno, a.apellido1 AS apellido_alumno, a.apellido2 AS apellido2_alumno, t.numero AS numero_telefono
FROM alumno a
INNER JOIN telefono t ON a.identificacion = t.identificacion_alumno;
```

6. **Vista de asignaturas por curso escolar:**
```sql
CREATE VIEW vista_asignaturas_curso_escolar AS
SELECT ce.id AS id_curso_escolar, a.nombre AS asignatura, a.cuatrimestre
FROM curso_escolar ce
INNER JOIN alumno_asignatura aa ON ce.id = aa.id_curso_escolar
INNER JOIN asignatura a ON aa.id_asignatura = a.id;
```

7. **Vista de asignaturas impartidas por profesor en un curso escolar:**
```sql
CREATE VIEW vista_asignaturas_por_profesor_curso AS
SELECT p.nombre AS nombre_profesor, p.apellido1, p.apellido2, a.nombre AS asignatura, a.cuatrimestre, ce.id AS id_curso_escolar
FROM profesor p
INNER JOIN asigna_curso_profesor acp ON p.id = acp.cedula_profesor
INNER JOIN asignatura a ON acp.id_asignatura = a.id
INNER JOIN curso_escolar ce ON acp.id_curso = ce.id;
```

8. **Vista de profesores por departamento:**
```sql
CREATE VIEW vista_profesores_departamento AS
SELECT d.nombre AS departamento, p.nombre AS nombre_profesor, p.apellido1, p.apellido2
FROM dpto d
INNER JOIN profesor p ON d.codigo = p.codigo_facultad;
```

9. **Vista de alumnos por ciudad:**
```sql
CREATE VIEW vista_alumnos_ciudad AS
SELECT c.nombre AS ciudad, a.nombre AS nombre_alumno, a.apellido1, a.apellido2
FROM ciudad c
INNER JOIN alumno a ON c.codigo = a.codigo_ciudad;
```

10. **Vista de asignaturas por cuatrimestre y grado:**
```sql
CREATE VIEW vista_asignaturas_cuatrimestre_grado AS
SELECT a.cuatrimestre, g.nombre AS grado, a.nombre AS asignatura
FROM asignatura a
INNER JOIN grado g ON a.id_grado = g.id;
```





#### Procedimientos

1. **Crear nuevo profesor:**
```sql
CREATE PROCEDURE crear_profesor (
    IN p_nombre VARCHAR(50),
    IN p_apellido1 VARCHAR(30),
    IN p_apellido2 VARCHAR(30),
    IN p_direccion VARCHAR(100),
    IN p_fecha_nac DATE,
    IN p_sexo VARCHAR(10),
    IN p_codigo_ciudad INT,
    IN p_codigo_facultad INT
)
BEGIN
    INSERT INTO profesor (nombre, apellido1, apellido2, direccion, fecha_nac, sexo, codigo_ciudad, codigo_facultad)
    VALUES (p_nombre, p_apellido1, p_apellido2, p_direccion, p_fecha_nac, p_sexo, p_codigo_ciudad, p_codigo_facultad);
END;
```

2. **Actualizar información de profesor:**
```sql
CREATE PROCEDURE actualizar_info_profesor (
    IN p_id_profesor INT,
    IN p_nombre VARCHAR(50),
    IN p_apellido1 VARCHAR(30),
    IN p_apellido2 VARCHAR(30),
    IN p_direccion VARCHAR(100),
    IN p_fecha_nac DATE,
    IN p_sexo VARCHAR(10),
    IN p_codigo_ciudad INT,
    IN p_codigo_facultad INT
)
BEGIN
    UPDATE profesor
    SET nombre = p_nombre, apellido1 = p_apellido1, apellido2 = p_apellido2,
        direccion = p_direccion, fecha_nac = p_fecha_nac, sexo = p_sexo,
        codigo_ciudad = p_codigo_ciudad, codigo_facultad = p_codigo_facultad
    WHERE id = p_id_profesor;
END;
```

3. **Eliminar profesor por ID:**
```sql
CREATE PROCEDURE eliminar_profesor (
    IN p_id_profesor INT
)
BEGIN
    DELETE FROM profesor
    WHERE id = p_id_profesor;
END;
```

4. **Buscar profesor por nombre y apellido:**
```sql
CREATE PROCEDURE buscar_profesor (
    IN p_nombre VARCHAR(50),
    IN p_apellido1 VARCHAR(30)
)
BEGIN
    SELECT *
    FROM profesor
    WHERE nombre = p_nombre AND apellido1 = p_apellido1;
END;
```

5. **Crear nueva asignatura:**
```sql
CREATE PROCEDURE crear_asignatura (
    IN p_nombre VARCHAR(50),
    IN p_creditos INT,
    IN p_cuatrimestre VARCHAR(20),
    IN p_id_grado INT
)
BEGIN
    INSERT INTO asignatura (nombre, creditos, cuatrimestre, id_grado)
    VALUES (p_nombre, p_creditos, p_cuatrimestre, p_id_grado);
END;
```

6. **Actualizar información de asignatura:**
```sql
CREATE PROCEDURE actualizar_info_asignatura (
    IN p_id_asignatura INT,
    IN p_nombre VARCHAR(50),
    IN p_creditos INT,
    IN p_cuatrimestre VARCHAR(20),
    IN p_id_grado INT
)
BEGIN
    UPDATE asignatura
    SET nombre = p_nombre, creditos = p_creditos, cuatrimestre = p_cuatrimestre,
        id_grado = p_id_grado
    WHERE id = p_id_asignatura;
END;
```

7. **Eliminar asignatura por ID:**
```sql
CREATE PROCEDURE eliminar_asignatura (
    IN p_id_asignatura INT
)
BEGIN
    DELETE FROM asignatura
    WHERE id = p_id_asignatura;
END;
```

8. **Buscar asignatura por nombre y grado:**
```sql
CREATE PROCEDURE buscar_asignatura (
    IN p_nombre VARCHAR(50),
    IN p_id_grado INT
)
BEGIN
    SELECT *
    FROM asignatura
    WHERE nombre = p_nombre AND id_grado = p_id_grado;
END;
```

9. **Crear nuevo curso escolar:**
```sql
CREATE PROCEDURE crear_curso_escolar (
    IN p_anyo_inicio DATE,
    IN p_anyo_fin DATE
)
BEGIN
    INSERT INTO curso_escolar (anyo_inicio, anyo_fin)
    VALUES (p_anyo_inicio, p_anyo_fin);
END;
```

10. **Eliminar curso escolar por ID:**
```sql
CREATE PROCEDURE eliminar_curso_escolar (
    IN p_id_curso_escolar INT
)
BEGIN
    DELETE FROM curso_escolar
    WHERE id = p_id_curso_escolar;
END;
```



#### PROCEDIMIENTOS

1. **Crear nuevo profesor:**
```sql
DELIMITER //
CREATE PROCEDURE crear_profesor (
    IN p_nombre VARCHAR(50),
    IN p_apellido1 VARCHAR(30),
    IN p_apellido2 VARCHAR(30),
    IN p_direccion VARCHAR(100),
    IN p_fecha_nac DATE,
    IN p_sexo VARCHAR(10),
    IN p_codigo_ciudad INT,
    IN p_codigo_facultad INT
)
BEGIN
    INSERT INTO profesor (nombre, apellido1, apellido2, direccion, fecha_nac, sexo, codigo_ciudad, codigo_facultad)
    VALUES (p_nombre, p_apellido1, p_apellido2, p_direccion, p_fecha_nac, p_sexo, p_codigo_ciudad, p_codigo_facultad);
END //
DELIMITER;
```

2. **Actualizar información de profesor:**
```sql
DELIMITER //
CREATE PROCEDURE actualizar_info_profesor (
    IN p_id_profesor INT,
    IN p_nombre VARCHAR(50),
    IN p_apellido1 VARCHAR(30),
    IN p_apellido2 VARCHAR(30),
    IN p_direccion VARCHAR(100),
    IN p_fecha_nac DATE,
    IN p_sexo VARCHAR(10),
    IN p_codigo_ciudad INT,
    IN p_codigo_facultad INT
)
BEGIN
    UPDATE profesor
    SET nombre = p_nombre, apellido1 = p_apellido1, apellido2 = p_apellido2,
        direccion = p_direccion, fecha_nac = p_fecha_nac, sexo = p_sexo,
        codigo_ciudad = p_codigo_ciudad, codigo_facultad = p_codigo_facultad
    WHERE id = p_id_profesor;
END //
DELIMITER;
```

3. **Eliminar profesor por ID:**
```sql
DELIMITER //
CREATE PROCEDURE eliminar_profesor (
    IN p_id_profesor INT
)
BEGIN
    DELETE FROM profesor
    WHERE id = p_id_profesor;
END //
DELIMITER;
```

4. **Buscar profesor por nombre y apellido:**
```sql
DELIMITER //
CREATE PROCEDURE buscar_profesor (
    IN p_nombre VARCHAR(50),
    IN p_apellido1 VARCHAR(30)
)
BEGIN
    SELECT *
    FROM profesor
    WHERE nombre = p_nombre AND apellido1 = p_apellido1;
END //
DELIMITER;
```

5. **Crear nueva asignatura:**
```sql
DELIMITER //
CREATE PROCEDURE crear_asignatura (
    IN p_nombre VARCHAR(50),
    IN p_creditos INT,
    IN p_cuatrimestre VARCHAR(20),
    IN p_id_grado INT
)
BEGIN
    INSERT INTO asignatura (nombre, creditos, cuatrimestre, id_grado)
    VALUES (p_nombre, p_creditos, p_cuatrimestre, p_id_grado);
END //
DELIMITER;
```

6. **Actualizar información de asignatura:**
```sql
DELIMITER //
CREATE PROCEDURE actualizar_info_asignatura (
    IN p_id_asignatura INT,
    IN p_nombre VARCHAR(50),
    IN p_creditos INT,
    IN p_cuatrimestre VARCHAR(20),
    IN p_id_grado INT
)
BEGIN
    UPDATE asignatura
    SET nombre = p_nombre, creditos = p_creditos, cuatrimestre = p_cuatrimestre,
        id_grado = p_id_grado
    WHERE id = p_id_asignatura;
END //
DELIMITER;
```

7. **Eliminar asignatura por ID:**
```sql
DELIMITER //
CREATE PROCEDURE eliminar_asignatura (
    IN p_id_asignatura INT
)
BEGIN
    DELETE FROM asignatura
    WHERE id = p_id_asignatura;
END //
DELIMITER;
```

8. **Buscar asignatura por nombre y grado:**
```sql
DELIMITER //
CREATE PROCEDURE buscar_asignatura (
    IN p_nombre VARCHAR(50),
    IN p_id_grado INT
)
BEGIN
    SELECT *
    FROM asignatura
    WHERE nombre = p_nombre AND id_grado = p_id_grado;
END //
DELIMITER;
```

9. **Crear nuevo curso escolar:**
```sql
DELIMITER //
CREATE PROCEDURE crear_curso_escolar (
    IN p_anyo_inicio DATE,
    IN p_anyo_fin DATE
)
BEGIN
    INSERT INTO curso_escolar (anyo_inicio, anyo_fin)
    VALUES (p_anyo_inicio, p_anyo_fin);
END //
DELIMITER;
```

10. **Eliminar curso escolar por ID:**
```sql
DELIMITER //
CREATE PROCEDURE eliminar_curso_escolar (
    IN p_id_curso_escolar INT
)
BEGIN
    DELETE FROM curso_escolar
    WHERE id = p_id_curso_escolar;
END //
DELIMITER;
```

