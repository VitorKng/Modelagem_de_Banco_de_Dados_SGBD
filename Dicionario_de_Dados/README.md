# 📖 Dicionário de Dados — Biblioteca do Bairro Encantado

Este repositório contém a documentação e o **Dicionário de Dados** do banco de dados relacional da **Biblioteca do Bairro Encantado**.

---

## 🎭 Contexto do Projeto

Na Biblioteca do Bairro Encantado, Dona Lina (a bibliotecária) precisava de clareza sobre a estrutura do sistema: o que significava cada campo, se era um número ou texto, e para que servia cada data registrada.

Para resolver essa dúvida, **Scriptório, o mago dos dados**, explicou a importância do **Dicionário de Dados**: uma documentação oficial que detalha cada entidade, seus atributos, tipos de dados, chaves de relacionamento e finalidades dentro do sistema.

### 💡 Benefícios do Dicionário de Dados:
* ❌ **Evita confusões** e interpretações erradas sobre o significado das colunas.
* 🛠️ **Facilita a manutenção** e futuras atualizações do banco de dados.
* 🎓 **Auxilia no treinamento** de novas equipes e desenvolvedores.
* 📋 **Padroniza e documenta** formalmente a arquitetura de dados do projeto.

---

## 📊 Dicionário de Dados

Abaixo está o mapeamento detalhado dos campos pertencentes às tabelas `Moradores`, `Livros` e `Emprestimos`:

| Tabela | Nome do Campo | Tipo de Dado | Tamanho | Chave (PK / FK) | Descrição Simplificada |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Moradores** | `id_morador` | `INT` | - | **PK** | Identificador único de cada morador |
| **Moradores** | `nome` | `VARCHAR` | 100 | - | Nome completo do morador cadastrado |
| **Moradores** | `email` | `VARCHAR` | 120 | - | Endereço de e-mail de contato do morador |
| **Moradores** | `telefone` | `VARCHAR` | 20 | - | Número de telefone/WhatsApp do morador |
| **Moradores** | `endereco` | `VARCHAR` | 200 | - | Endereço residencial do morador |
| **Livros** | `id_livro` | `INT` | - | **PK** | Identificador único de cada livro no acervo |
| **Livros** | `titulo` | `VARCHAR` | 150 | - | Título completo da obra literária |
| **Livros** | `autor` | `VARCHAR` | 100 | - | Nome do autor da obra |
| **Livros** | `categoria` | `VARCHAR` | 50 | - | Gênero ou categoria do livro (ex: Fantasia, Romance) |
| **Livros** | `status` | `VARCHAR` | 20 | - | Situação atual do livro (*Disponível* / *Emprestado*) |
| **Emprestimos** | `id_emprestimo` | `INT` | - | **PK** | Identificador único de cada registro de empréstimo |
| **Emprestimos** | `id_morador` | `INT` | - | **FK** | Referência ao morador que retirou o livro |
| **Emprestimos** | `id_livro` | `INT` | - | **FK** | Referência ao livro que foi emprestado |
| **Emprestimos** | `data_emprestimo` | `DATE` | - | - | Data em que o livro foi retirado do acervo |
| **Emprestimos** | `data_devolucao_prevista` | `DATE` | - | - | Data limite estipulada para a devolução do livro |

---

## 💻 Script DDL Relacionado (SQL)

Para referência técnica, o script DDL que gera essa estrutura em MySQL:

```sql
CREATE TABLE Moradores (
    id_morador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE Livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Disponível'
);

CREATE TABLE Emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_morador INT NOT NULL,
    id_livro INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    FOREIGN KEY (id_morador) REFERENCES Moradores(id_morador),
    FOREIGN KEY (id_livro) REFERENCES Livros(id_livro)
);
