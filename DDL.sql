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