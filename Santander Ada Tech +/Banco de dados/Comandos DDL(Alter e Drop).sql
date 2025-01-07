-- ddl alter e drop

-- ALTER

-- renomear tabela
alter table study.alunos 
rename to aluno_ada; -- Renomeia a tabela "alunos" para "aluno_ada" dentro do esquema "study".

-- renomear coluna 
alter table study.aluno_ada 
rename nome to nome_aluno; -- Renomeia a coluna "nome" para "nome_aluno" na tabela "aluno_ada".

select * from study.aluno_ada; -- Consulta todos os dados da tabela renomeada para verificação.

-- Inserindo uma nova coluna através do ALTER
alter table study.aluno_ada 
ADD teste int; -- Adiciona uma nova coluna chamada "teste" com tipo inteiro à tabela "aluno_ada".

select * from study.aluno_ada; -- Consulta todos os dados da tabela com a nova coluna para verificação.

-- Alterando o tipo da coluna
alter table study.aluno_ada 
alter column teste type varchar(255); -- Altera o tipo da coluna "teste" para texto (varchar) com tamanho máximo de 255 caracteres.

select * from study.aluno_ada; -- Consulta todos os dados da tabela com a coluna alterada para verificação.

-- DROP 

-- Remover uma coluna
alter table study.aluno_ada 
drop column teste; -- Remove a coluna "teste" da tabela "aluno_ada".

select * from study.aluno_ada; -- Consulta todos os dados da tabela sem a coluna removida para verificação.

-- Mover uma tabela para outro esquema
create schema teste; -- Cria um novo esquema chamado "teste".

alter table study.aluno_ada
set schema teste; -- Move a tabela "aluno_ada" do esquema "study" para o esquema "teste".

DROP TABLE teste.aluno_ada; -- Exclui a tabela "aluno_ada" do esquema "teste".