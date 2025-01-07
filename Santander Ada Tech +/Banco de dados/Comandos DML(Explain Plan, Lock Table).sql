-- EXPLAIN PLAN E LOCK TABLE

-- lock table

begin; 
	lock table study.aluno_ada in access share mode; -- Bloqueia a tabela "aluno_ada" para leitura por outros usuários.
commit;

begin;
	lock table study.aluno_ada in row share mode; -- Bloqueia linhas individuais da tabela "aluno_ada" para leitura por outros usuários.
commit;

begin;
	lock table study.aluno_ada in row exclusive mode; -- Bloqueia linhas individuais da tabela "aluno_ada" para leitura e escrita por outros usuários.
commit;

-- explain plan

explain select * from study.aluno_ada; -- Mostra o plano de execução da consulta sem formatação especial.

explain (format json ) select * from study.aluno_ada; -- Mostra o plano de execução da consulta em formato JSON.

explain (format yaml ) select * from study.aluno_ada -- Mostra o plano de execução da consulta em formato YAML.
where id = 2;

explain (costs false ) select * from study.aluno_ada -- Mostra o plano de execução da consulta sem informações de custo.
where id = 2;

explain select max(id) from study.aluno_ada -- Mostra o plano de execução da consulta para encontrar o maior valor de "id".
where id = 2;