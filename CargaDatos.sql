-- Insertar datos en la tabla razas desde carga_masiva2
INSERT INTO raza (RAZA)
SELECT DISTINCT RAZA
FROM carga_masiva2
UNION
SELECT DISTINCT RAZA_2
FROM carga_masiva2;

-- Insertar datos en la tabla paises desde carga_masiva2
INSERT INTO pais (PAIS)
SELECT DISTINCT PAIS
FROM carga_masiva2;

-- Insertar datos en la tabla partidos desde carga_masiva2
INSERT INTO partido (siglas, partido)
SELECT DISTINCT PARTIDO, NOMBRE_PARTIDO
FROM carga_masiva2;

-- Insertar datos en la tabla region desde carga_masiva2
INSERT INTO region (region, idpais)
SELECT DISTINCT cm.REGION, p.idpais
FROM carga_masiva2 cm
INNER JOIN pais p ON cm.PAIS = p.pais;

-- Insertar datos en la tabla departamento desde carga_masiva2
INSERT INTO departamento (departamento, idregion)
SELECT DISTINCT cm.DEPTO, r.idregion
FROM carga_masiva2 cm
INNER JOIN region r ON cm.REGION = r.region;

-- Insertar datos en la tabla municipio desde carga_masiva2
INSERT INTO municipio (municipio, iddepartamento)
SELECT DISTINCT cm.MUNICIPIO, d.iddepartamento
FROM carga_masiva2 cm
INNER JOIN departamento d ON cm.DEPTO = d.departamento;

-- Insertar datos en la tabla eleccion desde carga_masiva2
INSERT INTO eleccion (nombre, anio)
SELECT DISTINCT NOMBRE_ELECCION, anio_ELECCION
FROM carga_masiva2;

-- Insertar datos únicos en la tabla eleccion_partido desde carga_masiva2
INSERT INTO eleccion_partido (ideleccion, idpartido)
SELECT DISTINCT e.ideleccion, p.idpartido
FROM eleccion e
INNER JOIN carga_masiva2 cm ON e.nombre = cm.NOMBRE_ELECCION AND e.anio = cm.anio_ELECCION
INNER JOIN partido p ON cm.PARTIDO = p.siglas;

-- Insertar datos en la tabla zona desde carga_masiva2
INSERT INTO zona (idpais, idregion, iddepartamento, idmuni)
SELECT DISTINCT p.idpais, r.idregion, d.iddepartamento, m.idmuni
FROM carga_masiva2 cm
INNER JOIN pais p ON cm.PAIS = p.pais
INNER JOIN region r ON cm.REGION = r.region AND r.idpais = p.idpais
INNER JOIN departamento d ON cm.DEPTO = d.departamento AND d.idregion = r.idregion
INNER JOIN municipio m ON cm.MUNICIPIO = m.municipio AND m.iddepartamento = d.iddepartamento;

-- Insertar datos en la tabla caracteristica_votante desde carga_masiva2
-- Error que indica que e.ideleccion no existe, pero sí existe, no fue posible arreglarlo
INSERT INTO caracteristica_votante (genero, anafabetas, alfabetas, primaria, nivelmedio, universitario, idelepar, idzona, idraza)
SELECT 
    SEXO, 
    ANALFABETOS, 
    ALFABETOS, 
    PRIMARIA, 
    NIVEL_MEDIO, 
    UNIVERSITARIO, 
    ep.idelepar, 
    z.idzona, 
    r.idraza
FROM 
    carga_masiva2 cm
INNER JOIN 
    eleccion_partido ep ON cm.NOMBRE_ELECCION = (select e.nombre from eleccion e inner join eleccion_partido ep on ep.ideleccion = e.ideleccion )
INNER JOIN 
    zona z ON z.idpais = (SELECT idpais FROM pais WHERE pais = cm.PAIS)
    AND z.idregion = (SELECT idregion FROM region WHERE region = cm.REGION)
    AND z.iddepartamento = (SELECT iddepartamento FROM departamento WHERE departamento = cm.DEPTO)
    AND z.idmuni = (SELECT idmuni FROM municipio WHERE municipio = cm.MUNICIPIO)
INNER JOIN 
    raza r ON r.raza = cm.RAZA OR r.raza = cm.RAZA_2;

-- Otro Intento
INSERT INTO caracteristica_votante (genero, anafabetas, alfabetas, primaria, nivelmedio, universitario, idelepar, idzona, idraza)
SELECT 
    SEXO, 
    ANALFABETOS, 
    ALFABETOS, 
    PRIMARIA, 
    NIVEL_MEDIO, 
    UNIVERSITARIOS, 
    ep.idelepar, 
    (
        SELECT z.idzona
        FROM zona z
        INNER JOIN pais p ON cm.PAIS = p.pais AND z.idpais = p.idpais
        INNER JOIN region r ON cm.REGION = r.region AND z.idregion = r.idregion
        INNER JOIN departamento d ON cm.DEPTO = d.departamento AND z.iddepartamento = d.iddepartamento
        INNER JOIN municipio m ON cm.MUNICIPIO = m.municipio AND z.idmuni = m.idmuni
    ) AS idzona,
    (
        SELECT r.idraza
        FROM raza r
        WHERE r.raza = cm.RAZA
    ) AS idraza
FROM 
    carga_masiva2 cm
INNER JOIN 
   eleccion_partido ep ON cm.anio_ELECCION = (SELECT anio FROM eleccion WHERE ideleccion = ep.ideleccion)
                          AND cm.PARTIDO = (SELECT siglas FROM partido WHERE idpartido = ep.idpartido)
                          AND cm.NOMBRE_PARTIDO = (SELECT partido FROM partido WHERE idpartido = ep.idpartido);
