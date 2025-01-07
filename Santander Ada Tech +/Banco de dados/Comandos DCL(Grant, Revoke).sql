-- DCL

-- GRANT 

GRANT privilege_list all -- Concede todas as permissões 
on nome_tabela -- Sobre a tabela especificada
to role_name; -- Ao usuário ou papel especificado

create role joe -- Cria um novo papel chamado "joe"
login -- Permite que o papel "joe" faça login no banco de dados
password '123'; -- Define a senha para o papel "joe"

create table filmes ( -- Cria uma tabela chamada "filmes"
	id int primary key, -- Coluna ID como chave primária
	nome varchar(100), -- Coluna nome do filme
	categoria varchar(100), -- Coluna categoria do filme
	lingua varchar(100) -- Coluna idioma do filme
)

grant select -- Concede permissão de leitura 
on filmes -- Sobre a tabela "filmes"
to joe; -- Ao papel "joe"

Insert into filmes (id, nome, categoria, lingua) -- Insere um registro na tabela "filmes"
values (1,'4 de Novembro','esporte','portguês');

grant insert, update, delete -- Concede permissões de inserção, atualização e exclusão
on filmes -- Sobre a tabela "filmes"
to joe; -- Ao papel "joe"

-- REVOKE

revoke privilege_list all -- Revoga todas as permissões
on nome_tabela -- Sobre a tabela especificada
from role_name; -- Do usuário ou papel especificado

revoke select  -- Revoga a permissão de leitura
on filmes  -- Sobre a tabela "filmes"
from joe; -- Do papel "joe"