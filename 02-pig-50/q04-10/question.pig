--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
lines = LOAD 'truck_event_text_partition.csv'  using PigStorage(',') AS (driverId:int,truckId:int,eventTime:chararray,eventType:chararray,longitude:double,latitude:double,eventKey:chararray,correlationId:chararray,driverName:chararray,routeId:long,routeName:chararray,eventDate:chararray);
firts10registers = LIMIT lines 10;
ordenado = ORDER firts10registers BY driverId,truckId,eventTime;
selectRegister = Foreach ordenado GENERATE CONCAT((chararray)$0, ',',(chararray)$1, ',',(chararray)$2); 
STORE selectRegister INTO 'output';
