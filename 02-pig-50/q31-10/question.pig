-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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
U_times = FOREACH u GENERATE GetYear(ToDate(birthday)) as year;
U_group = GROUP U_times by year;
u_results = FOREACH  U_group GENERATE $0, COUNT(U_times);
STORE u_results INTO 'output' USING PigStorage(',');