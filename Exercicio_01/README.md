# Exercicio de Fixação 03

## 📚 Sistema de Controle de Empréstimos de Biblioteca

Este repositório contém a **modelagem conceitual** (Modelo Entidade-Relacionamento - MER) para um sistema de controle de empréstimos de biblioteca.

---

## 📌 Escopo do Problema

O objetivo do sistema é controlar o fluxo de empréstimos de livros para membros cadastrados, garantindo o controle de disponibilidade, datas de retirada e devolução prevista.

### Regras de Negócio:
* **Livros:** Possuem código único, título, autor e status (disponível ou emprestado).
* **Membros:** Identificados por número de matrícula único, nome e e-mail.
* **Empréstimos:** Cada empréstimo registra a data de retirada e a data de devolução prevista.
* **Restrições:** Um livro só pode estar emprestado a **no máximo um membro por vez** (1:1 no momento do empréstimo), mas um membro pode pegar **vários livros emprestados** (1:N).

---

## 📐 Modelo Conceitual

### Entidades e Atributos

| Entidade | Atributo | Tipo / Descrição | Chave |
| :--- | :--- | :--- | :--- |
| **LIVRO** | `codigo` | Identificador único do livro | **PK** |
| | `titulo` | Título da obra | |
| | `autor` | Nome do autor | |
| | `status` | Situação (*Disponível* / *Emprestado*) | |
| **MEMBRO** | `matricula` | Número de matrícula único | **PK** |
| | `nome` | Nome completo do usuário | |
| | `email` | Correio eletrônico | |

### Relacionamento e Atributos Próprios

| Relacionamento | Atributo | Descrição |
| :--- | :--- | :--- |
| **EMPRÉSTIMO** | `data_retirada` | Data em que o livro foi retirado |
| | `data_devolucao_prevista` | Data limite para devolução |

---

## 🔄 Cardinalidades

$$\text{MEMBRO} \quad \xleftrightharpoons[\text{(1,1)}]{\text{(0,N)}} \quad \text{EMPRÉSTIMO} \quad \xleftrightharpoons[\text{(0,1)}]{\text{(1,1)}} \quad \text{LIVRO}$$

* **MEMBRO $\rightarrow$ LIVRO:** `(0, N)` — Um membro pode ter 0 empréstimos ativos ou vários.
* **LIVRO $\rightarrow$ MEMBRO:** `(0, 1)` — Um livro pode estar disponível (0) ou emprestado a no máximo 1 membro (1).

---

## 🎨 Diagrama Entidade-Relacionamento (DER)

```text
+-------------------+                      +-------------------+
|      MEMBRO       |                      |       LIVRO       |
+-------------------+                      +-------------------+
| * matricula (PK)  |                      | * codigo (PK)     |
|   nome            |                      |   titulo          |
|   email           |                      |   autor           |
+-------------------+                      |   status          |
          | (0,N)                          +-------------------+
          |                                          | (0,1)
          |                                          |
          +------------------[ EMPRÉSTIMO ]----------+
                             |  data_retirada        |
                             |  data_devolucao_prevista
