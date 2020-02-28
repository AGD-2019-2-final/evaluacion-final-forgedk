
-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD 'data.tsv'  using PigStorage('\t') AS (id:chararray,bolsaLetras:bag{},tuplasLista:tuple());
linesSoloBag = foreach lines GENERATE bolsaLetras; 
linesFlat =  foreach linesSoloBag GENERATE FLATTEN(bolsaLetras);

linesFull = GROUP linesFlat by $0;

linesCuenta = foreach linesFull GENERATE group,COUNT(linesFlat);

STORE linesCuenta INTO 'output';
