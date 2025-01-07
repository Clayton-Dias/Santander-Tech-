-- DQL (Data Query Language) - Linguagem de Consulta de Dados

-- Cria uma tabela chamada "pedidos" no esquema "study"
create table study.pedidos(
	id serial primary key, -- Chave primária auto-incrementada
	nome_prato VARCHAR(255) NOT NULL, -- Nome do prato
	preco_prato int NOT NULL, -- Preço do prato
	data_pedido date -- Data do pedido
)

-- Insere alguns pedidos de exemplo na tabela
insert into study.pedidos(nome_prato, preco_prato, data_pedido)
values ('Filé de frango','20','01-03-2023'), 
('Carne Assada','30','04-04-2023'),
('Filé com batata fritas','45','30-05-2023');

-- Seleciona todos os dados da tabela "pedidos"
select * from study.pedidos;

-- Calcula o total de vendas por mês e ano
select extract(month from data_pedido) as mes, -- Extrai o mês da data do pedido
       extract(year from data_pedido) as ano,  -- Extrai o ano da data do pedido
       sum(preco_prato) as total_vendas       -- Soma o preço dos pratos por mês e ano
from study.pedidos
group by extract(month from data_pedido), -- Agrupa os resultados por mês e ano
       extract(year from data_pedido)
order by ano,mes; -- Ordena os resultados por ano e mês

-- CTE (Common Table Expression) - Expressão de Tabela Comum
-- Cria uma CTE chamada "venda_por_mes" para calcular as vendas por mês e ano
with venda_por_mes as (
	select 
		date_part('month',data_pedido) as mes, -- Extrai o mês da data do pedido
		date_part('year',data_pedido) as ano,  -- Extrai o ano da data do pedido
		sum(preco_prato) as total_vendas       -- Soma o preço dos pratos por mês e ano

		from study.pedidos
		group by ano, mes		
)

-- Seleciona os dados da CTE "venda_por_mes" e ordena por ano e mês
select mes, ano, total_vendas from venda_por_mes
order by ano,mes

--- CTEs ANINHADAS
-- Cria várias CTEs relacionadas para calcular as vendas por colaborador

with departamentos(id, nome) as ( -- CTE para departamentos
	select
		departamento.id,
		departamento.nome,
	from departamento
),

colaboradores (id, nome, id_depto) as ( -- CTE para colaboradores
	select
		colaborador.id,
		colaborador.nome,
		colaborador.id_depto
	from colaborador
	join departamentos on colaborador.id_depto = departamentos.id
),

vendas as (id_colaborador, venda_total) as ( -- CTE para vendas por colaborador
	select 
		pedidos1.id_colaborador,
		SUM (preco_total)
	from pedidos1
	join colaboradores on pedidos1.id_colaborador = colaboradores.id
	group by pedidos1.id_colaborador
)


select nome, venda_total -- Seleciona o nome do colaborador e o total de vendas
from vendas
join colaboradores on vendas.id_colaborador = colaboradores.id;