-- ============================================================
-- Sistema de Venda de Ingressos de Cinema (MySQL)
-- ============================================================

-- ------------------------------------------------------------
-- 1. CRIAÇÃO DAS TABELAS (DDL)
-- ------------------------------------------------------------

CREATE TABLE Filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao INT NOT NULL
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Ingressos (
    id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_filme INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_filme) REFERENCES Filmes(id_filme)
);

-- ------------------------------------------------------------
-- 2. INSERÇÃO DOS DADOS (DML)
-- ------------------------------------------------------------

INSERT INTO Filmes (titulo, duracao) VALUES
('Os Vingadores', 143),
('Velozes e Furiosos 6', 130),
('Avatar', 162);

INSERT INTO Clientes (nome) VALUES
('Ana Silva'),
('Matheus Andrade'),
('João Santos');

INSERT INTO Ingressos (id_cliente, id_filme, valor) VALUES
(1, 1, 30.00),
(2, 2, 35.00),
(3, 3, 25.00);

-- ------------------------------------------------------------
-- 3. CONSULTA RELACIONAL (INNER JOIN)
-- ------------------------------------------------------------

SELECT
    c.nome AS Cliente,
    f.titulo AS Filme,
    f.duracao AS Duracao_Minutos,
    i.valor AS Valor_Pago
FROM Ingressos i
INNER JOIN Clientes c ON i.id_cliente = c.id_cliente
INNER JOIN Filmes f ON i.id_filme = f.id_filme;
