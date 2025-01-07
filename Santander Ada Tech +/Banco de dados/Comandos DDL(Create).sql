-- criar schema:
create schema study; -- Cria um esquema chamado "study" para organizar as tabelas relacionadas ao tema de estudos.

CREATE TABLE study.instrutores_ada (
	id serial PRIMARY KEY, -- Define a coluna "id" como chave primária e com tipo serial (auto-incrementa)
	nome VARCHAR(50) NOT NULL, -- Nome do instrutor, obrigatório (NOT NULL)
	email VARCHAR(50) NOT NULL, -- Email do instrutor, obrigatório
	valor_hora INTEGER NULL, -- Valor cobrado por hora de aula (permite ser nulo)
	certificados VARCHAR(50) -- Lista de certificados (pode ser nulo)
)

select * from study.instrutos_ada; -- Seleciona todos os registros da tabela "instrutores_ada" para verificação.

CREATE TABLE study.cursos (
	id serial PRIMARY KEY, -- Define a coluna "id" como chave primária e com tipo serial
	nome VARCHAR(50) NOT NULL, -- Nome do curso, obrigatório
	requisito VARCHAR(50) NULL, -- Requisitos prévios para o curso (permite ser nulo)
	carga_horaria SMALLINT NULL, -- Carga horária do curso (permite ser nulo)
	preco DOUBLE PRECISION NULL -- Preço do curso (permite ser nulo)
)

select * from study.cursos; -- Seleciona todos os registros da tabela "cursos" para verificação.

CREATE TABLE study.alunos (
	id serial PRIMARY KEY, -- Define a coluna "id" como chave primária e com tipo serial
	nome VARCHAR(50) NOT NULL, -- Nome do aluno, obrigatório
	email VARCHAR(50) NOT NULL, -- Email do aluno, obrigatório
	cpf CHAR(11) NOT NULL, -- CPF do aluno, obrigatório, com tamanho fixo de 11 caracteres
	telefone CHAR(14) NOT NULL, -- Telefone do aluno, obrigatório, com tamanho fixo de 14 caracteres
	data_nascimento date null -- Data de nascimento do aluno (permite ser nula)
)

select * from study.alunos; -- Seleciona todos os registros da tabela "alunos" para verificação.

CREATE TABLE study.turmas (
	id serial PRIMARY KEY, -- Define a coluna "id" como chave primária e com tipo serial
	id_instrutores INT NOT NULL, -- ID do instrutor responsável pela turma, obrigatório
	id_cursos INTEGER NOT NULL, -- ID do curso da turma, obrigatório
	data_inicio date, -- Data de início da turma
	data_fim date, -- Data de término da turma
	carga_horaria SMALLINT, -- Carga horária total da turma
	FOREIGN KEY (id_cursos) REFERENCES study.cursos(ID), -- Define uma chave estrangeira para a tabela "cursos"
	FOREIGN KEY (id_instrutores) REFERENCES study.instrutores_ada(ID) -- Define uma chave estrangeira para a tabela "instrutores_ada"
)

select * from study.turmas; -- Seleciona todos os registros da tabela "turmas" para verificação.

CREATE TABLE study.matriculas (
	id serial primary key, -- Define a coluna "id" como chave primária e com tipo serial
	id_turmas INTEGER NOT NULL, -- ID da turma em que o aluno está matriculado, obrigatório
	id_alunos INTEGER NOT NULL, -- ID do aluno matriculado, obrigatório
	data_matricula date NULL, -- Data de matrícula do aluno (permite ser nula)
	CONSTRAINT fk_id_turmas FOREIGN KEY (id_turmas) REFERENCES study.turmas(ID), -- Define uma chave estrangeira para a tabela "turmas"
	CONSTRAINT fk_id_alunos FOREIGN KEY (id_alunos) REFERENCES study.alunos(ID) -- Define uma chave estrangeira para a tabela "alunos"
)

select * from study.matriculas; -- Seleciona todos os registros da tabela "matriculas" para verificação.