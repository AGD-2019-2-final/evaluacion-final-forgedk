-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne la columna `tbl0.c1` y el valor 
-- correspondiente de la columna `tbl1.c4` para la columna `tbl0.c2`.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--


DROP TABLE IF EXISTS TablaExplode;


Create TABLE TablaExplode AS 
SELECT  c1,key,valueInArray as value
FROM tbl1 lateral view explode(c4) explosion as  key,valueInArray;

INSERT OVERWRITE LOCAL DIRECTORY 'output/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
SELECT tabla1.c1,tabla1.c2, tabla2.value
FROM tbl0 tabla1 
 LEFT OUTER JOIN TablaExplode tabla2
ON (tabla2.c1 = tabla1.c1) AND (tabla2.key = tabla1.c2);