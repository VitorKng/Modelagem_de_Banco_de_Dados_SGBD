-- ============================================================
-- Exercício Prático: Sistema Acadêmico (MySQL)
-- Plataforma de execução: https://onecompiler.com/mysql
-- ============================================================

-- ------------------------------------------------------------
-- 1. CRIAÇÃO DAS TABELAS (DDL)
-- ------------------------------------------------------------

CREATE TABLE Departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(10) NOT NULL UNIQUE,
    responsavel VARCHAR(100) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    departamento_id INT NOT NULL,
    titulacao VARCHAR(50) NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id)
);

CREATE TABLE Cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    professor_id INT NOT NULL,
    nivel VARCHAR(50) NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES Professores(id)
);

CREATE TABLE Alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'ativa',
    UNIQUE (aluno_id, curso_id),
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

-- ------------------------------------------------------------
-- 2. ALTERAÇÃO DAS TABELAS (ALTER TABLE)
-- ------------------------------------------------------------

ALTER TABLE Cursos ADD modalidade VARCHAR(100) NOT NULL;
ALTER TABLE Alunos ADD telefone VARCHAR(20);

-- ------------------------------------------------------------
-- 3. INSERÇÃO DOS DADOS (DML)
-- ------------------------------------------------------------

INSERT INTO Departamentos (nome, sigla, responsavel, ativo) VALUES
('Computação', 'COMP', 'Dr. Luiz Costa', TRUE),
('Matemática', 'MAT', 'Dra. Paula Silva', TRUE),
('Física', 'FIS', 'Dr. Renato Lima', TRUE);

INSERT INTO Professores (nome, email, departamento_id, titulacao) VALUES
('Carlos Mendes', 'carlos.mendes@faculdade.edu', 1, 'Mestre'),
('Fernanda Alves', 'fernanda.alves@faculdade.edu', 2, 'Doutora'),
('João Pires', 'joao.pires@faculdade.edu', 3, 'Doutor');

INSERT INTO Cursos (nome, carga_horaria, professor_id, nivel, modalidade) VALUES
('Banco de Dados', 80, 1, 'Tecnólogo', 'Presencial'),
('Cálculo I', 60, 2, 'Bacharelado', 'Presencial'),
('Física Moderna', 70, 3, 'Licenciatura', 'EAD');

INSERT INTO Alunos (nome, email, data_nascimento, ativo, telefone) VALUES
('Mariana Costa', 'mariana.costa@aluno.edu', '2002-04-15', TRUE, '(61) 99999-9991'),
('Lucas Pereira', 'lucas.pereira@aluno.edu', '2001-09-21', TRUE, '(62) 99999-9992'),
('Aline Rocha', 'aline.rocha@aluno.edu', '2003-01-08', TRUE, '(61) 99999-9993');

INSERT INTO Matriculas (aluno_id, curso_id, data_matricula, status) VALUES
(1, 1, '2026-02-10', 'ativa'),
(2, 2, '2026-02-11', 'ativa'),
(3, 3, '2026-02-12', 'ativa');

-- ------------------------------------------------------------
-- 4. CONSULTA RELACIONAL (INNER JOIN)
-- ------------------------------------------------------------

SELECT
    a.nome AS Aluno,
    c.nome AS Curso,
    p.nome AS Professor,
    d.nome AS Departamento,
    c.modalidade AS Modalidade,
    m.data_matricula AS Data_Matricula,
    m.status AS Status
FROM Matriculas m
INNER JOIN Alunos a ON a.id = m.aluno_id
INNER JOIN Cursos c ON c.id = m.curso_id
INNER JOIN Professores p ON p.id = c.professor_id
INNER JOIN Departamentos d ON d.id = p.departamento_id
ORDER BY a.nome;

-- ------------------------------------------------------------
-- 5. REMOÇÃO DAS TABELAS (DROP TABLE - Ordem inversa à dependência)
-- ------------------------------------------------------------

DROP TABLE Matriculas;
DROP TABLE Cursos;
DROP TABLE Professores;
DROP TABLE Departamentos;
DROP TABLE Alunos;
