-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.csv'  using PigStorage(',') AS (id:int,nombre:chararray,apellindo:chararray,fecha:chararray,color:chararray,numero:chararray);
linesConcat = Foreach lines GENERATE apellindo, (chararray)SIZE(apellindo); 
linesOutput =  ORDER linesConcat  By  $1 DESC,$0;
linesOutput =  Foreach linesOutput  GENERATE CONCAT($0,',',$1);
linesOutput = LIMIT   linesOutput 5;
STORE linesOutput INTO 'output';