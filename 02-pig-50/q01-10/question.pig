-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD 'data.tsv'  using PigStorage('\t') AS (id:chararray,date:chararray,numero:int);
leters = FOREACH lines GENERATE FLATTEN(TOKENIZE(id)) AS word;
grouped = GROUP leters BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(leters);
STORE wordcount INTO 'output';
