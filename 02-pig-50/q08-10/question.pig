-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv'  using PigStorage('\t') AS (id:chararray,bolsaLetras:bag{},mapasLista:map[]);
linesMapa = foreach lines GENERATE FLATTEN(bolsaLetras),FLATTEN(mapasLista); 
grouped = GROUP linesMapa BY ($0,$1);
linesCount = FOREACH grouped GENERATE group, COUNT(linesMapa);
STORE linesCount INTO 'output';
