# 📚 Sistema Acadêmico em MySQL

Este repositório contém um exercício prático de banco de dados relacional em MySQL simulando a modelagem e operação de um **Sistema Acadêmico**.

O projeto cobre todo o ciclo de vida de um banco de dados: modelagem relacional, criação de tabelas (DDL), adição de colunas, inserção de dados (DML), consultas com junções (`INNER JOIN`) e descarte respeitando a integridade referencial.

---

## 🛠️ Tecnologias Utilizadas

- **SGBD:** MySQL
- **Plataforma de Execução recomendada:** [OneCompiler - MySQL](https://onecompiler.com/mysql)

---

## 📐 Estrutura do Banco de Dados

O sistema é composto por 5 entidades relacionadas:

1. **Departamentos:** Armazena os departamentos da instituição (`id`, `nome`, `sigla`, `responsavel`, `ativo`).
2. **Professores:** Armazena os docentes vinculados a um departamento (`id`, `nome`, `email`, `departamento_id`, `titulacao`).
3. **Cursos:** Armazena os cursos oferecidos e o professor responsável (`id`, `nome`, `carga_horaria`, `professor_id`, `nivel`, `modalidade`).
4. **Alunos:** Armazena os discentes matriculados (`id`, `nome`, `email`, `data_nascimento`, `ativo`, `telefone`).
5. **Matrículas:** Tabela associativa entre Alunos e Cursos (`id`, `aluno_id`, `curso_id`, `data_matricula`, `status`).

---

## 🔄 Fluxo de Execução do Script

1. **DDL (Data Definition Language):** Criação das tabelas com chaves primárias (`PRIMARY KEY`), chaves estrangeiras (`FOREIGN KEY`) e restrições (`UNIQUE`, `NOT NULL`, `DEFAULT`).
2. **ALTER TABLE:** Adição das colunas `modalidade` na tabela `Cursos` e `telefone` na tabela `Alunos`.
3. **DML (Data Manipulation Language):** Povoamento de todas as tabelas com registros coerentes.
4. **Consulta (SELECT com INNER JOIN):** Relacionamento de dados cruzados entre Alunos, Cursos, Professores e Departamentos.
5. **DROP TABLE:** Remoção das tabelas na ordem inversa de dependência para respeitar as restrições de chave estrangeira.

---

## 🚀 Como Executar

1. Acesse o [OneCompiler MySQL](https://onecompiler.com/mysql).
2. Copie todo o conteúdo do arquivo [`script.sql`](./script.sql).
3. Cole o script no editor do OneCompiler.
4. Clique em **Run** para visualizar a execução e o resultado da consulta `JOIN`.
