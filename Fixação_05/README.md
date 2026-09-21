-- ============================================================
-- Tabela de Frutas e Preços (MySQL)
-- ============================================================

-- 1. Criação da tabela Frutas
CREATE TABLE Frutas (
    id_fruta INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco_kg DECIMAL(10,2) NOT NULL
);

-- 2. Inserção dos 30 registros
INSERT INTO Frutas (id_fruta, nome, preco_kg) VALUES
(1, 'Maçã', 7.00),
(2, 'Banana', 4.00),
(3, 'Uva', 9.00),
(4, 'Manga', 5.00),
(5, 'Melancia', 3.00),
(6, 'Morango', 10.00),
(7, 'Laranja', 4.00),
(8, 'Kiwi', 12.00),
(9, 'Abacaxi', 6.00),
(10, 'Pera', 8.00),
(11, 'Caju', 7.00),
(12, 'Melão', 4.00),
(13, 'Goiaba', 5.00),
(14, 'Ameixa', 9.00),
(15, 'Pitaya', 15.00),
(16, 'Carambola', 4.00),
(17, 'Jabuticaba', 13.00),
(18, 'Framboesa', 16.00),
(19, 'Cereja', 25.00),
(20, 'Figo', 11.00),
(21, 'Nectarina', 7.00),
(22, 'Tamarindo', 6.00),
(23, 'Pêssego', 6.00),
(24, 'Romã', 9.00),
(25, 'Coco', 3.00),
(26, 'Acerola', 8.00),
(27, 'Lichia', 18.00),
(28, 'Graviola', 10.00),
(29, 'Mamão', 4.00),
(30, 'Caqui', 6.00);
