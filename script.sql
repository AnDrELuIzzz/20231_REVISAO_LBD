CREATE DATABASE P2;

USE P2;

-- Criação da tabela "Aluno"
CREATE TABLE Aluno
(
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Criação da tabela "Disciplina"
CREATE TABLE Disciplina
(
    id_disciplina INT PRIMARY KEY,
    nome VARCHAR(100),
    professor VARCHAR(100)
);

-- Criação da tabela "Matrícula"
CREATE TABLE Matricula
(
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_disciplina INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

-- INSERIR ALUNOS:
INSERT INTO Aluno
    (id_aluno, nome, idade, email, telefone)
VALUES
    (1, 'João Silva', 20, 'joao.silva@example.com', '1234567890');

INSERT INTO Aluno
    (id_aluno, nome, idade, email, telefone)
VALUES
    (2, 'Maria Santos', 22, 'maria.santos@example.com', '9876543210');

INSERT INTO Aluno
    (id_aluno, nome, idade, email, telefone)
VALUES
    (3, 'Pedro Almeida', 19, 'pedro.almeida@example.com', '5555555555');

INSERT INTO Aluno
    (id_aluno, nome, idade, email, telefone)
VALUES
    (4, 'Carlos Oliveira', 25, 'carlos.oliveira@example.com', '1111111111');

INSERT INTO Aluno
    (id_aluno, nome, idade, email, telefone)
VALUES
    (5, 'Fernanda Santos', 21, 'fernanda.santos@example.com', '2222222222');

INSERT INTO Aluno
    (id_aluno, nome, idade, email, telefone)
VALUES
    (6, 'Rafaela Lima', 23, 'rafaela.lima@example.com', '3333333333');

--INSERIR DISCIPLINAS
INSERT INTO Disciplina
    (id_disciplina, nome, professor)
VALUES
    (1, 'Matemática', 'Prof. Souza');

INSERT INTO Disciplina
    (id_disciplina, nome, professor)
VALUES
    (2, 'História', 'Prof. Lima');

INSERT INTO Disciplina
    (id_disciplina, nome, professor)
VALUES
    (3, 'Inglês', 'Prof. Torres');

INSERT INTO Disciplina
    (id_disciplina, nome, professor)
VALUES
    (4, 'Ciências', 'Prof. Almeida');

INSERT INTO Disciplina
    (id_disciplina, nome, professor)
VALUES
    (5, 'Geografia', 'Prof. Costa');

INSERT INTO Disciplina
    (id_disciplina, nome, professor)
VALUES
    (6, 'Artes', 'Prof. Silva');

--INSERIR MATRICULA
INSERT INTO Matricula
    (id_matricula, id_aluno, id_disciplina, data_matricula)
VALUES
    (1, 1, 1, '2022-01-10');

INSERT INTO Matricula
    (id_matricula, id_aluno, id_disciplina, data_matricula)
VALUES
    (2, 1, 2, '2022-01-12');

INSERT INTO Matricula
    (id_matricula, id_aluno, id_disciplina, data_matricula)
VALUES
    (3, 2, 1, '2022-01-15');

INSERT INTO Matricula
    (id_matricula, id_aluno, id_disciplina, data_matricula)
VALUES
    (4, 3, 3, '2022-01-20');

INSERT INTO Matricula
    (id_matricula, id_aluno, id_disciplina, data_matricula)
VALUES
    (5, 4, 1, '2022-02-15');

INSERT INTO Matricula
    (id_matricula, id_aluno, id_disciplina, data_matricula)
VALUES
    (6, 4, 2, '2022-02-18');

INSERT INTO Matricula
    (id_matricula, id_aluno, id_disciplina, data_matricula)
VALUES
    (7, 5, 5, '2022-02-20');

INSERT INTO Matricula
    (id_matricula, id_aluno, id_disciplina, data_matricula)
VALUES
    (8, 6, 6, '2022-02-22');


--  Obter o nome do aluno e o nome da disciplina de todas as matrículas realizadas.
SELECT t2.nome, t3.nome
FROM Matricula t1
    JOIN Aluno t2 ON t2.id_aluno = t1.id_aluno
    JOIN Disciplina t3 ON t1.id_disciplina = t3.id_disciplina;
-- Obter o nome do aluno, o nome da disciplina e o nome do professor para todas as matrículas realizadas.
SELECT t2.nome, t3.nome, t3.professor
FROM Matricula t1
    JOIN Aluno t2 ON t1.id_aluno = t2.id_aluno
    JOIN Disciplina t3 ON t1.id_disciplina = t3.id_disciplina;
-- Obter o nome do aluno e o nome da disciplina para todas as matrículas realizadas, filtrando apenas as disciplinas ministradas por um professor específico.
SELECT t2.nome, t3.nome
FROM Matricula t1
    JOIN Aluno t2 ON t1.id_aluno = t2.id_aluno
    JOIN Disciplina t3 ON t3.id_disciplina = t1.id_disciplina
WHERE t3.professor = 'Prof. Torres';
-- Obter o nome do aluno e o nome da disciplina para todas as matrículas realizadas, ordenando pelo nome do aluno em ordem alfabética.
SELECT t1.nome, t3.nome
FROM Aluno t1
    JOIN Matricula t2 ON t1.id_aluno = t2.id_aluno
    JOIN Disciplina t3 ON  t3.id_disciplina = t2.id_disciplina
ORDER BY t1.nome;

-- Obter o nome de todos os alunos, juntamente com as disciplinas em que eles estão matriculados. Incluir também os alunos que não estão matriculados em nenhuma disciplina usando LEFT JOIN.
SELECT t1.nome, t3.nome
FROM Aluno t1
    LEFT JOIN Matricula t2 ON t1.id_aluno = t2.id_aluno
    LEFT JOIN Disciplina t3 ON t2.id_disciplina = t3.id_disciplina
;

-- Obter o nome de todas as disciplinas, juntamente com os alunos matriculados em cada disciplina. Incluir também as disciplinas que não possuem alunos matriculados usando RIGHT JOIN.
SELECT t1.nome AS nome_aluno , t3.nome AS nome_disciplina
FROM Aluno t1
    RIGHT JOIN Matricula t2 ON t2.id_aluno = t1.id_aluno
    RIGHT JOIN Disciplina t3 ON t2.id_disciplina = t3.id_disciplina;

-- Obter o nome de todos os alunos e o número de disciplinas em que eles estão matriculados. Incluir também os alunos que não estão matriculados em nenhuma disciplina usando LEFT JOIN e a função COUNT.
SELECT t1.nome AS nome_alunos, COUNT(t2.id_disciplina) AS nr_disciplinas
FROM Aluno t1
    LEFT JOIN Matricula t2 ON t1.id_aluno =  t2.id_aluno
GROUP BY t1.nome;


--JOINS IRRESTRITOS
-- Obter todas as combinações possíveis entre alunos e disciplinas.
SELECT t1.nome, t2.nome
FROM Aluno t1
CROSS JOIN Disciplina t2;

-- Obter todas as combinações possíveis entre alunos e disciplinas, incluindo o nome do professor para cada disciplina.



-- Obter todas as combinações possíveis entre todas as tabelas:Aluno, Disciplina e Matrícula.