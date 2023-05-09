--SELECT farmacia.bairro, esp.id as esp_id FROM esp INNER JOIN farmacia on esp.farmacia_id = farmacia.id;

--SELECT * FROM temperaturas;

SELECT farmacia.bairro, temperaturas.temperatura, extract(day from data) AS dia, 
extract(month from data) AS mes, 
extract(hour from hora) AS hora,
extract(minute from hora) AS minuto 
FROM temperaturas 
INNER JOIN esp on temperaturas.esp_id = esp.id 
INNER JOIN farmacia on esp.farmacia_id = farmacia.id;