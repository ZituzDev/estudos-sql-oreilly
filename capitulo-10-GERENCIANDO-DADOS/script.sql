
-- Insere um participante apenas com os campos obrigatórios
INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME)
VALUES ('thomas', 'nield');

-- Lista todos os participantes para validação
SELECT * FROM ATTENDEE;

-- Insere múltiplos participantes de uma vez só
INSERT INTO ATTENDEE (FIRST_NAME, LAST_NAME, PHONE, EMAIL, VIP)
VALUES
    ('Jon', 'Skeeter', '4802185842', 'john.skeeter@rex.net', 1),
    ('Sam', 'Scala', '2156783401', 'sam.scala@gmail.com', 0),
    ('Brittany', 'Fisher', '5932857296', 'brittany.fisher@outlook.com', 0);

-- Lista todas as empresas cadastrais
SELECT * FROM COMPANY;

-- Insere uma nova empresa com ID específico
INSERT INTO COMPANY (NAME, DESCRIPTION, PRIMARY_KEY_ID)
VALUES ('RexApp Solutions', 'A mobile app delivery service', 5);


-- Deleta os participantes com IDs específicos (17 e 18)
DELETE FROM ATTENDEE
WHERE ATTENDEE_ID IN (17, 18);

-- Deleta participantes que não possuem telefone E nem e-mail
DELETE FROM ATTENDEE
WHERE PHONE IS NULL
  AND EMAIL IS NULL;

-- Verifica se restou algum participante sem contato
SELECT * FROM ATTENDEE
WHERE PHONE IS NULL
  AND EMAIL IS NULL;


-- Altera todos os e-mails para letras maiúsculas
UPDATE ATTENDEE SET EMAIL = UPPER(EMAIL);

-- Altera o primeiro nome e sobrenome de TODOS para o sobrenome em maiúsculo
UPDATE ATTENDEE SET 
    FIRST_NAME = UPPER(LAST_NAME), 
    LAST_NAME = UPPER(LAST_NAME);

-- Altera o status de VIP para 1 apenas para os IDs 3 e 4
UPDATE ATTENDEE SET VIP = 1
WHERE ATTENDEE_ID IN (3, 4);