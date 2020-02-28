-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--


DROP TABLE IF EXISTS registros;

CREATE TABLE registros (Letra String,Fecha Date,Numero int) ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE registros;

SELECT Letra,count(*) FROM registros GROUP BY Letra;


INSERT OVERWRITE LOCAL DIRECTORY 'output/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT Letra,count(*) FROM registros GROUP BY Letra;