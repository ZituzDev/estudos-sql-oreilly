-- Categorização simples de dados: Transforma valores numéricos de velocidade em etiquetas de texto
SELECT report_code, year, month, day, wind_speed,
CASE
    WHEN wind_speed > 40 THEN 'HIGH'
    WHEN wind_speed >= 30 THEN 'MODERATE'
    ELSE 'LOW'
END AS wind_severity
FROM STATION_DATA;

-- Agrupamento por categorias criadas: Conta quantos registros existem para cada nível de severidade por ano
-- O "GROUP BY 1, 2" refere-se à 1ª e 2ª colunas do SELECT (year e wind_severity)
SELECT year,
CASE
    WHEN wind_speed >= 40 THEN 'HIGH' 
    WHEN wind_speed >= 30 THEN 'MODERATE'
    ELSE 'LOW'
END AS wind_severity,
COUNT(*) AS record_count
FROM STATION_DATA
GROUP BY 1, 2;

-- Soma a precipitação separando em colunas diferentes se houve ou não tornado no mês
-- Isso permite comparar duas métricas lado a lado em uma única linha
SELECT year, month,
SUM(CASE WHEN tornado = 1 THEN precipitation ELSE 0 END) 
AS tornado_precipitation,
SUM(CASE WHEN tornado = 0 THEN precipitation ELSE 0 END)
AS non_tornado_precipitation
FROM STATION_DATA
GROUP BY year, month
ORDER BY year DESC, month;

-- Encontra a maior precipitação do ano, separada por ocorrência de tornado
-- Usar ELSE NULL garante que a função MAX ignore os registros da categoria oposta
SELECT year,
MAX(CASE WHEN tornado = 0 THEN precipitation ELSE NULL END)
AS max_non_tornado_precipitation,
MAX(CASE WHEN tornado = 1 THEN precipitation ELSE NULL END)
AS max_tornado_precipitation
FROM STATION_DATA
GROUP BY year;

-- Comparação de médias térmicas baseada em condições meteorológicas
-- Calcula a média de temperatura para dias com chuva/granizo vs dias sem precipitação
SELECT month,
AVG(CASE WHEN rain OR hail THEN temperature ELSE NULL END)
AS avg_precipitation_temp,
AVG(CASE WHEN NOT (rain or hail) THEN temperature ELSE null END)
AS avg_non_precipitation_temp
FROM STATION_DATA
WHERE year > 2000
GROUP BY month;