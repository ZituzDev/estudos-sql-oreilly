
-- Conta o total de registros na tabela
SELECT COUNT(*) AS record_count FROM STATION_DATA;

-- Conta quantos registros tiveram a ocorrência de tornado
SELECT COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado = 1;

-- Agrupa a contagem de tornados por ano
SELECT year, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado = 1
GROUP BY year;

-- Agrupamento múltiplo: conta tornados por ano e por mês
SELECT year, month, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, month;

-- Agrupamento com ordenação: Anos mais recentes primeiro e meses em ordem crescente
SELECT year, month, COUNT(*) AS record_count FROM STATION_DATA
WHERE tornado = 1
GROUP BY year, month
ORDER BY year DESC, month;

-- COUNT em coluna específica: ignora valores NULL (diferente de COUNT(*))
SELECT COUNT(snow_depth) AS recordea_snow_depth_count
FROM STATION_DATA;

-- Calcula a média de temperatura por mês a partir do ano 2000
SELECT month, AVG(temperature) AS AVG_temp
FROM STATION_DATA
WHERE year >= 2000
GROUP BY month;

-- Média de temperatura arredondada para 2 casas decimais
SELECT month, round(AVG(temperature),2) AS AVG_temp
FROM STATION_DATA
WHERE year >= 2000
GROUP BY month;

-- Soma total de neve acumulada por ano
SELECT year, SUM(snow_depth) AS total_snow
FROM STATION_DATA
WHERE year >= 2000
GROUP BY year;

-- Múltiplas agregações: Soma de neve, soma de chuva e a maior precipitação do ano
SELECT year,
SUM(snow_depth) AS total_snow,
SUM(precipitation) AS total_precipitation,
MAX(precipitation) AS max_precipitation
FROM STATION_DATA
WHERE year >= 2000
GROUP BY year;

-- Soma da precipitação apenas em anos/dias que tiveram tornado
SELECT year, SUM(precipitation) AS tornado_precipitation
FROM STATION_DATA
WHERE tornado = 1
GROUP BY year;

-- O "WHERE" dos grupos: Filtra apenas anos onde a soma da chuva foi maior que 30
-- Importante: HAVING é usado para filtrar resultados de funções agregadas (SUM, COUNT, etc)
SELECT year, SUM(precipitation) as total_precipitation
FROM STATION_DATA
GROUP BY year
HAVING total_precipitation > 30;