-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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

DROP TABLE IF EXISTS TablaExplode;


Create TABLE TablaExplode AS 
SELECT  c1,key as valor  FROM t0 LATERAL VIEW  explode(c3)  tabla AS key,value;

INSERT OVERWRITE LOCAL DIRECTORY 'output/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
SELECT valor,COUNT(*)
FROM TablaExplode GROUP BY valor;  
 