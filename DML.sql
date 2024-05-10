
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