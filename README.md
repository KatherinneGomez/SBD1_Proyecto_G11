# Fase Análisis

## Entidades

1. Raza
    1. idRaza (PK)
    2. Raza
2. Sexo
    1. IdSexo (PK)
    2. Sexo
3. Municipio
    1. IdMunicipio (PK)
    2. Municipio
4. Departamento
    1. IdDepartamento (PK)
    2. Departamento
5. Region
    1. IdRegion (PK)
    2. Region
6. País
    1. IdPais (PK)
    2. País
7. Partido
    1. IdPartido (PK)
    2. Partido
    3. Nombre del Partido
8. Elección
    1. IdEleccion (PK)
    2. Nombre
    3. Año
    4. idZona (FK)
9. Zona
    1. IdZona (PK)
    2. IdPaís (FK)
    3. IdRegion (FK)
    4. IdDepartamente (FK)
    5. IdMunicipalida (FK)
10. Elección – Partido
    1. IdElecPar (PK)
    2. IdEleccion (FK)
    3. IdPartido (FK)
11. Votación
    1. IdVotacion (PK)
    2. IdElePar (FK)
    3. IdSexo (FK)
    4. IdRaza (FK)
    5. Analfabetos
    6. Alfabetos
    7. Primaria
    8. NivelMedio
    9. Universitarios

## Relaciones

- **Zona – país – municipio – departamento – región**: Una zona puede ser un país, un municipio, un departamento o una región
    - Una país se divide en regiones (1:N)
    - Una región esta formada por un conjunto de departamentos (1:N)
    - Un departamento tiene un conjunto de municipios (1:N)

NOTA: Todas las relaciones listadas con anterioridad, se unen mediante la tabla zona

- **Elección – Zona:** Cada elección tiene un conjunto de puestos de elección popular que se definen en cada país y que abarcan una zona preestablecida (1:N)
- **Elección – Partido**: Una elección tiene varios partidos, un partido puede estar en varias elecciones (N:N). Esta relación se rompe a través de la entidad Elección-Partido

## Modelo Conceptual

[https://lh7-us.googleusercontent.com/NGcBI61qM9qovyrsjtRwzjMfp8FfZa-a-MYGKNE-hvBmxxXqpF9Z_DsqQP357oKxShmzv3rHq83lbb_6VozqJ1q-lQrvx_wUwVxvCNoJL7UQ5I3Glb9MMsZgRHXKEMAfq5Yf83FglAR794ww91SFKA](https://lh7-us.googleusercontent.com/NGcBI61qM9qovyrsjtRwzjMfp8FfZa-a-MYGKNE-hvBmxxXqpF9Z_DsqQP357oKxShmzv3rHq83lbb_6VozqJ1q-lQrvx_wUwVxvCNoJL7UQ5I3Glb9MMsZgRHXKEMAfq5Yf83FglAR794ww91SFKA)

[https://lh7-us.googleusercontent.com/8amTesZI7WPsrNwcyAlFzblh09bKMK0jxKhTL1K4hUyssV35eLaZqQoEkR_iYUKpoRGwCV9V51G3kQRJ368rEYzZz6qBfhZswNnifNHwVUgk676K0slDG2JcYxNbFzTn1kxQat1JsO6b](https://lh7-us.googleusercontent.com/8amTesZI7WPsrNwcyAlFzblh09bKMK0jxKhTL1K4hUyssV35eLaZqQoEkR_iYUKpoRGwCV9V51G3kQRJ368rEYzZz6qBfhZswNnifNHwVUgk676K0slDG2JcYxNbFzTn1kxQat1JsO6b)

[https://lh7-us.googleusercontent.com/T3J3GthzC6N30RMHPuxFQVfQQvxj3A5BSFLQp-PCNEzrnSuSKy6VCwM-QAGKY9Yba_zRw7MKQaGP_bQsj8HlG70UvWv6rnHc4ix2lwtE3QrG9bV2VDcGQ8jHinzRCGsJzQGk2lrgPxOp](https://lh7-us.googleusercontent.com/T3J3GthzC6N30RMHPuxFQVfQQvxj3A5BSFLQp-PCNEzrnSuSKy6VCwM-QAGKY9Yba_zRw7MKQaGP_bQsj8HlG70UvWv6rnHc4ix2lwtE3QrG9bV2VDcGQ8jHinzRCGsJzQGk2lrgPxOp)