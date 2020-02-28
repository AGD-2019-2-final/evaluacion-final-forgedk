-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD 'data.tsv'  using PigStorage('\t') AS (id:chararray,bolsaLetras:bag{},mapasLista:map[]);
linesMapa = foreach lines GENERATE mapasLista; 
linesMapFlat = foreach linesMapa GENERATE KEYSET($0);
linesMapFlat2 =  foreach linesMapa GENERATE FLATTEN($0);

linesFull = GROUP linesMapFlat2 by $0;

linesCuenta = foreach linesFull GENERATE group,COUNT(linesMapFlat2);

linesConcant = Foreach linesCuenta GENERATE CONCAT((chararray)$0, ',',(chararray)$1); 

STORE linesConcant INTO 'output';