CREATE DATABASE proyectoG11;
USE proyectog11;

CREATE TABLE pais (
	idpais INTEGER NOT NULL AUTO_INCREMENT,
	pais VARCHAR(50) NOT NULL,
	PRIMARY KEY ( idpais)
);

CREATE TABLE region (
	idregion INTEGER NOT NULL AUTO_INCREMENT,
	region VARCHAR(50) NOT NULL,
	idpais INTEGER NOT NULL,
	PRIMARY KEY ( idregion ),
	FOREIGN KEY (idpais) REFERENCES pais(idpais)
);

CREATE TABLE departamento (
	iddepartamento INTEGER NOT NULL AUTO_INCREMENT,
	departamento VARCHAR(50) NOT NULL,
	idregion INTEGER NOT NULL,
	PRIMARY KEY ( iddepartamento ),
	FOREIGN KEY (idregion) REFERENCES region(idregion)
);

CREATE TABLE municipio (
	idmuni INTEGER NOT NULL AUTO_INCREMENT,
	municipio VARCHAR(50) NOT NULL,
	iddepartamento INTEGER NOT NULL,
	PRIMARY KEY ( idmuni ),
	FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento)
);

CREATE TABLE eleccion (
	ideleccion INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(60) NOT NULL,
	anio INTEGER NOT NULL,
	PRIMARY KEY ( ideleccion )
);


CREATE TABLE zona (
	idzona INTEGER NOT NULL AUTO_INCREMENT,
	idpais INTEGER,
	idregion INTEGER,
	iddepartamento INTEGER,
	idmuni INTEGER,
	PRIMARY KEY ( idzona ),
	FOREIGN KEY (idpais) REFERENCES pais(idpais),
	FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento),
	FOREIGN KEY (idregion) REFERENCES region(idregion),
	FOREIGN KEY (idmuni) REFERENCES municipio(idmuni)
);



CREATE TABLE partido (
	idpartido INTEGER NOT NULL AUTO_INCREMENT,
	siglas VARCHAR(15),
	partido VARCHAR(50),
	PRIMARY KEY ( idpartido)
);

CREATE TABLE eleccion_partido (
	idelepar INTEGER NOT NULL AUTO_INCREMENT,
	ideleccion INTEGER NOT NULL,
	idpartido INTEGER NOT NULL,
	PRIMARY KEY ( idelepar ),
	FOREIGN KEY (ideleccion) REFERENCES eleccion(ideleccion),
	FOREIGN KEY (idpartido) REFERENCES partido(idpartido)
);

CREATE TABLE caracteristica_votante (
	idcarac INTEGER NOT NULL AUTO_INCREMENT,
	genero VARCHAR(15),
	anafabetas INTEGER,
	alfabetas INTEGER,
	primaria INTEGER,
	nivelmedio INTEGER,
	universitario INTEGER,
	idelepar INTEGER NOT NULL,
	idzona INTEGER NOT NULL,
	PRIMARY KEY ( idcarac ),
	FOREIGN KEY (idelepar) REFERENCES eleccion_partido(idelepar),
	FOREIGN KEY (idzona) REFERENCES zona(idzona)
);

CREATE TABLE raza (
    idraza INTEGER NOT NULL AUTO_INCREMENT,
    raza VARCHAR(25) NOT NULL,
    PRIMARY KEY (idraza)
);

ALTER TABLE caracteristica_votante
ADD COLUMN idraza INTEGER,
ADD CONSTRAINT fk_raza FOREIGN KEY (idraza) REFERENCES raza(idraza);


CREATE TABLE carga_masiva2 (
    NOMBRE_ELECCION VARCHAR(255),
    anio_ELECCION INT,
    PAIS VARCHAR(255),
    REGION VARCHAR(255),
    DEPTO VARCHAR(255),
    MUNICIPIO VARCHAR(255),
    PARTIDO VARCHAR(255),
    NOMBRE_PARTIDO VARCHAR(255),
    SEXO VARCHAR(255),
    RAZA VARCHAR(255),
    ANALFABETOS INT,
    ALFABETOS INT,
    SEXO_2 VARCHAR(255),
    RAZA_2 VARCHAR(255),
    PRIMARIA INT,
    NIVEL_MEDIO INT,
    UNIVERSITARIOS INT
);