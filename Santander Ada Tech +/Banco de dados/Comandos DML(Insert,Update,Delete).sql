-- DML, INSERT, UPDATE, DELETE

-- INSERT
-- Insere novos registros na tabela study.aluno_ada
insert into study.aluno_ada (
	nome_aluno,
	email, 
	cpf, 
	telefone, 
	data_nascimento)
VALUES ('Mirelle','mirelle@email.com','12345678900','9876-5432','2000-01-02'); -- Insere dados da aluna Mirelle

select * from study.aluno_ada; -- Seleciona todos os registros para verificação.

insert into study.aluno_ada (
	nome_aluno,
	email, 
	cpf, 
	telefone, 
	data_nascimento)
VALUES ('XYZ','xyz@email.com','96325874199','1598-7532','2002-02-03'); -- Insere dados do aluno XYZ

select * from study.aluno_ada; -- Seleciona todos os registros para verificação.

insert into study.aluno_ada (
	nome_aluno,
	email, 
	cpf, 
	telefone, 
	data_nascimento)
VALUES ('ABC','abc@email.com','14785236988','3215-9874','2003-03-04')
returning *; -- Insere dados do aluno ABC e retorna todos os dados inseridos

-- Cria uma nova tabela study.links para armazenar links interessantes
create table study.links(
	id serial primary key, -- Chave primária auto-incrementada
	url VARCHAR(255) NOT NULL, -- URL do link, obrigatório
	name VARCHAR(255) NOT NULL, -- Nome do link, obrigatório
	descricao VARCHAR(255), -- Descrição opcional do link
	last_update DATE	-- Data da última atualização do link
);

insert into study.links (url, name) -- Insere o link do Google
values ('www.google.com.br', 'Google');

select * from study.links; -- Seleciona todos os registros da tabela links

insert into study.links (url, name) -- Insere o link "Link's" (com apóstrofo)
values ('www.links.com.br', 'Link''s');

select * from study.links; -- Seleciona todos os registros da tabela links para verificação

-- UPDATE
-- Atualiza dados de registros existentes

update study.aluno_ada  -- Atualiza o nome e email da aluna Mirelle
set nome_aluno = 'Gabriela', email = 'gabrile@mail.com'
where nome_aluno = 'Mirelle';

select * from study.aluno_ada; -- Seleciona todos os registros para verificação

update study.aluno_ada  -- Atualiza a data de nascimento dos alunos com id 2 e 3
set data_nascimento = '2002-02-02'
where id in (2,3);

select * from study.aluno_ada; -- Seleciona todos os registros para verificação

-- DELETE
-- Remove registros da tabela

delete from study.aluno_ada  -- Remove o aluno com id 3
where id = 3;

select * from study.aluno_ada; -- Seleciona todos os registros para verificação