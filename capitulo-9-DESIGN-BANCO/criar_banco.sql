-- --- CAPÍTULO 9: DESIGN E CRIAÇÃO DE BANCOS ---

-- 1. Apaga a tabela antiga se ela já existir, evitando erros de duplicidade
DROP TABLE IF EXISTS COMPANY;

-- 2. Cria a tabela do zero com as colunas do livro
CREATE TABLE COMPANY (
    COMPANY_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    NAME VARCHAR(30) NOT NULL,
    DESCRIPTION VARCHAR(60),
    PRIMARY_KEY_ID INTEGER NOT NULL -- Só uma correção de sintaxe: no seu print estava NOTNULL tudo junto, o ideal é separado 'NOT NULL'
);

SELECT * FROM COMPANY;

INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME)
VALUES ('thomas','nield');




