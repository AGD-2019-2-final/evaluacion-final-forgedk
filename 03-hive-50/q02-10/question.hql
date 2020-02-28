-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--


DROP TABLE IF EXISTS registros;

CREATE TABLE registros (Letra String,Fecha Date,Numero int) ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE registros;


INSERT OVERWRITE LOCAL DIRECTORY 'output/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM registros ORDER BY Letra,Numero,Fecha;