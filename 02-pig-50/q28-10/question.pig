-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        birthday, 
--        DATE_FORMAT(birthday, "yyyy"),
--        DATE_FORMAT(birthday, "yy"),
--    FROM 
--        persons
--    LIMIT
--        5;
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:DATETIME, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
U_ia_location = FOREACH u GENERATE GetYear(birthday),SUBSTRING((CHARARRAY)GetYear(birthday),2,4) AS birhtday1;
U_concat = FOREACH U_ia_location GENERATE CONCAT((CHARARRAY)$0,',',(CHARARRAY)$1);
STORE  U_concat INTO'output';
