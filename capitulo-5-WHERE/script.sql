-- Seleção total para exploração inicial dos dados
SELECT * FROM STATION_DATA;

-- Filtros de Igualdade e Diferença
SELECT * FROM STATION_DATA WHERE year = 2010; -- Registros apenas de 2010
SELECT * FROM STATION_DATA WHERE year != 2010; -- Todos os anos, exceto 2010

-- Trabalhando com Intervalos
SELECT * FROM STATION_DATA WHERE year BETWEEN 2005 AND 2010; -- Inclui os limites (2005 e 2010)
SELECT * FROM STATION_DATA WHERE year >= 2005 AND year < 2010; -- Exclui o ano de 2010

-- Filtragem de Listas (Operador IN)
-- Seleciona meses específicos (Março, Junho, Setembro, Dezembro)
SELECT * FROM STATION_DATA WHERE month IN(3, 6, 9, 12);
SELECT * FROM STATION_DATA WHERE month NOT IN(3, 6, 9, 12); -- Inverso: meses que NÃO estão na lista

-- Lógica Matemática: Seleciona meses que são múltiplos de 3 (usando o operador módulo %)
SELECT * FROM STATION_DATA WHERE month % 3 = 0;

-- --- FILTRAGEM DE TEXTO (STRINGS) ---

-- Busca exata por código
SELECT * FROM STATION_DATA WHERE report_code = '513A63';

-- Busca de múltiplos códigos específicos
SELECT * FROM STATION_DATA WHERE report_code IN ('513A63', '1F8A7B', 'EF616A');

-- Uso de Wildcards (Curingas) com LIKE
SELECT * FROM STATION_DATA WHERE report_code LIKE 'A%'; -- Começa com 'A'
SELECT * FROM STATION_DATA WHERE report_code LIKE 'B_C%'; -- Começa com 'B', tem qualquer caractere na 2ª posição, e 'C' na 3ª

-- --- LÓGICA BOOLEANA E BOOLEANOS (0 e 1) ---

-- Diferentes formas de expressar "Verdadeiro" no SQLite
SELECT * FROM STATION_DATA WHERE tornado = TRUE AND hail = TRUE;
SELECT * FROM STATION_DATA WHERE tornado = 1 AND hail = 1;
SELECT * FROM STATION_DATA WHERE tornado AND hail; -- Forma abreviada (funciona se os valores forem 1/0)

-- Filtro para quando ambos NÃO ocorreram
SELECT * FROM STATION_DATA WHERE tornado = 0 AND hail = 0;

-- Cuidado com a precedência do NOT
SELECT * FROM STATION_DATA WHERE NOT tornado AND hail; -- Sem tornado, mas com granizo
SELECT * FROM STATION_DATA WHERE NOT (tornado AND hail); -- Exclui apenas quando os dois ocorrem juntos

-- --- TRATAMENTO DE VALORES NULOS (NULL) ---

-- Busca registros onde o dado está ausente
SELECT * FROM STATION_DATA WHERE snow_depth IS NULL;

-- Comparação comum (pode ignorar os NULLs se não tomar cuidado)
SELECT * FROM STATION_DATA WHERE precipitation <= 0.5;

-- Garantindo que registros nulos também apareçam ou sejam tratados como 0
SELECT * FROM STATION_DATA WHERE precipitation IS NULL OR precipitation <= 0.5;
-- COALESCE: Se a precipitação for NULL, transforma em 0 para a comparação
SELECT * FROM STATION_DATA WHERE coalesce(precipitation, 0) <= 0.5;

-- Criando coluna temporária formatada com COALESCE
SELECT report_code, coalesce(precipitation, 0) as rainfall FROM STATION_DATA;

-- --- ORDEM DE PRECEDÊNCIA LÓGICA ---

-- Atenção: O AND é processado antes do OR. 
-- Esta query busca: (Chuva e Frio) OU (Neve acumulada)
SELECT * FROM STATION_DATA WHERE rain = 1 AND temperature <= 32 OR snow_depth > 0;

-- Uso de parênteses para clareza (boa prática em ADS para evitar erros de interpretação)
SELECT * FROM STATION_DATA WHERE (rain = 1 AND temperature <= 32) OR snow_depth > 0;