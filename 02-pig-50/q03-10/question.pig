-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv'  using PigStorage('\t') AS (id:chararray,date:chararray,numero:int);
ordenado = ORDER lines BY numero ASC;
ordenadoLimit = LIMIT ordenado 5;
ordenadotrim = foreach ordenadoLimit generate $2;
STORE ordenadotrim INTO 'output';
