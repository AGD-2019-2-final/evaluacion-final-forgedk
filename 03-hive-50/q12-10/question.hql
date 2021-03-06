-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que compute la cantidad de registros por letra de la 
-- columna 2 y clave de la columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `a` en la columna 2 y la clave `aaa` en la 
-- columna 3 es:
--
--     a    aaa    5
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS t0;
CREATE TABLE t0 (
    c1 STRING,
    c2 ARRAY<CHAR(1)>, 
    c3 MAP<STRING, INT>
    )
    ROW FORMAT DELIMITED 
        FIELDS TERMINATED BY '\t'
        COLLECTION ITEMS TERMINATED BY ','
        MAP KEYS TERMINATED BY '#'
        LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE t0;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE TablaExplode;

Create TABLE TablaExplode AS 
SELECT  key,valorArreglo
FROM t0 
lateral view explode(c3) explosion as  key,valueInArray  
lateral view explode(c2) explosion as  valorArreglo;

INSERT OVERWRITE LOCAL DIRECTORY 'output/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
SELECT  valorArreglo,key,COUNT(*) 
FROM TablaExplode  GROUP BY valorArreglo,key ORDER BY valorArreglo,key;