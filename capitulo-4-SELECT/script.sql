--Seleciona tudo da tabela CUSTOMER
SELECT * FROM CUSTOMER;

-- Seleciona apenas as colunas CUSTOMER_ID e NAME da tabela CUSTOMER 
SELECT CUSTOMER_ID , NAME FROM CUSTOMER;

--Seleciona tudo da tabela PRODUCT
SELECT * FROM PRODUCT;

--Seleciona as tabelas abaixo e cria uma temporaria com uma taxa de 7% em cima do preço
SELECT PRODUCT_ID, DESCRIPTION, PRICE, PRICE * 1.07 
AS TAXED_PRICE 
FROM PRODUCT;

-- Usando a Função "ROUND" para usar apenas duas casas decimais
SELECT PRODUCT_ID, DESCRIPTION, PRICE,
ROUND(PRICE * 1.07, 2) AS TAXED_PRICE
FROM PRODUCT;

--Concatenando a localização em uma nova tabela temporária 
SELECT NAME, CITY || ',' || STATE AS LOCATION
FROM CUSTOMER;

--Concatenand varios campos em uma unica tabela
SELECT NAME, STREET_ADDRESS || ' ' || CITY || ', ' || STATE || ' ' || ZIP AS SHIP_ADDRESS
FROM CUSTOMER;




