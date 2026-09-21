# 📚 Modelo Lógico — Sistema de Empréstimos de Biblioteca

Este repositório contém o **Modelo Lógico de Banco de Dados Relacional** projetado para informatizar e gerenciar o controle de empréstimos de uma biblioteca.

---

## 📌 Escopo e Regras de Negócio

O objetivo do sistema é registrar membros, gerenciar o acervo de livros e controlar o histórico e status de empréstimos ativos.

### Regras de Integridade e Cardinalidade:
* **Membros:** Identificados unicamente por um número de matrícula. Podem realizar múltiplos empréstimos ativos (`1:N`).
* **Livros:** Identificados unicamente por um código. Cada livro só pode estar em posse de **no máximo um membro por vez** (`1:1` no momento do empréstimo).
* **Empréstimos:** Registram a data de retirada e a data limite para devolução.

---

## 📐 Esquema do Modelo Lógico

### 🔹 1. Tabela: `Membros`
Armazena as informações dos usuários cadastrados.

| Coluna | Tipo de Dado | Restrições | Descrição / Função |
| :--- | :--- | :--- | :--- |
| `matricula` | `INT` | `PRIMARY KEY` | Identificador único do membro |
| `nome` | `VARCHAR(100)` | `NOT NULL` | Nome completo do membro |
| `email` | `VARCHAR(120)` | `NOT NULL, UNIQUE` | Correio eletrônico do membro |

---

### 🔹 2. Tabela: `Livros`
Armazena o acervo de obras da biblioteca.

| Coluna | Tipo de Dado | Restrições | Descrição / Função |
| :--- | :--- | :--- | :--- |
| `codigo` | `INT` | `PRIMARY KEY` | Identificador único do livro |
| `titulo` | `VARCHAR(150)` | `NOT NULL` | Título do livro |
| `autor` | `VARCHAR(100)` | `NOT NULL` | Autor da obra |
| `status` | `VARCHAR(20)` | `DEFAULT 'Disponível'` | Situação (*Disponível* / *Emprestado*) |

---

### 🔹 3. Tabela: `Emprestimos`
Tabela relacional/associativa que vincula o membro ao livro retirado.

| Coluna | Tipo de Dado | Restrições | Descrição / Função |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY, AUTO_INCREMENT` | Identificador único do registro de empréstimo |
| `livro_codigo` | `INT` | `NOT NULL, UNIQUE, FK` | Referência a `Livros(codigo)` (Garante 1 livro por empréstimo) |
| `membro_matricula` | `INT` | `NOT NULL, FK` | Referência a `Membros(matricula)` |
| `data_retirada` | `DATE` | `NOT NULL` | Data em que o livro foi retirado |
| `data_devolucao_prevista` | `DATE` | `NOT NULL` | Data limite para a devolução |

---

## 🔗 Representação por Notação Relacional

```text
Membros (matricula [PK], nome, email)
Livros (codigo [PK], titulo, autor, status)
Emprestimos (id [PK], livro_codigo [FK, UNIQUE], membro_matricula [FK], data_retirada, data_devolucao_prevista)
