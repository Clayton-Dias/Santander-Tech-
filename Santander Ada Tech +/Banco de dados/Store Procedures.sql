-- procedures

-- procedures

-- Cria uma tabela para armazenar informações sobre contas bancárias
CREATE TABLE contas (
    id SERIAL PRIMARY KEY, -- Identificador único da conta
    nome VARCHAR(100),     -- Nome do titular da conta
    saldo DEC(15,2) NOT NULL -- Saldo da conta (15 dígitos, 2 casas decimais)
);

-- Insere dados iniciais na tabela de contas
INSERT INTO contas (nome, saldo)
VALUES ('Albert', 1000), ('Bruno', 1600);

-- Seleciona todos os dados da tabela de contas para verificação
SELECT * FROM contas;

-- Cria ou substitui um procedimento armazenado para realizar transferências entre contas
CREATE OR REPLACE PROCEDURE transferencia (
    enviado INT, -- ID da conta que envia o valor
    recebe INT,  -- ID da conta que recebe o valor
    quantidade DEC -- Valor a ser transferido
)
LANGUAGE plpgsql
AS $$
BEGIN

-- subtrair a quantidade da conta de quem enviar
update contas 
set saldo = saldo - quantidade
where id = enviado

-- adicionando a quantidade na conta de quem recebe
update contas 
set saldo = saldo + quantidade
where id = recebe;

commit;
end;$$

CALL transferencia(1, 2, 800);

select * from contas;