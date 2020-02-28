-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv'  using PigStorage('\t') AS (id:chararray,bolsaLetras:bag{},mapasLista:map[]);
linesMapa = foreach lines GENERATE id, COUNT(bolsaLetras),SIZE(mapasLista); 
linesOrder = ORDER  linesMapa by $0,$1,$2;
linesConcant = Foreach linesOrder GENERATE CONCAT((chararray)$0, ',',(chararray)$1, ',',(chararray)$2); 
STORE linesConcant INTO 'output';