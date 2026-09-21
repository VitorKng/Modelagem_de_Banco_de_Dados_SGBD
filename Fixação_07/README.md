# 🎬 Sistema de Vendas de Ingressos de Cinema

Este repositório contém a modelagem, criação e consultas em SQL para um sistema relacional de exibição de filmes e venda de ingressos.

---

## 📌 Escopo do Projeto

O banco de dados gerencia as relações entre filmes exibidos, clientes cadastrados e vendas de ingressos realizadas.

### Estrutura do Banco de Dados:
* **`Filmes`**: Guarda o título e a duração (em minutos) de cada obra.
* **`Clientes`**: Registra os dados cadastrais dos compradores.
* **`Ingressos`**: Relaciona cliente e filme, armazenando o valor pago na transação.

---

## 📐 Modelo Relacional

```text
[ Clientes ] (1) <------- (N) [ Ingressos ] (N) -------> (1) [ Filmes ]
```

---

## 💻 Como Executar o Código

1. Abra o arquivo [`script.sql`](./script.sql) disponível neste repositório.
2. Copie e cole todo o conteúdo no seu SGBD MySQL de preferência ou em compiladores online como o [OneCompiler MySQL](https://onecompiler.com/mysql).
3. Execute o script para visualizar as tabelas sendo criadas, populadas e a consulta relacional final sendo exibida.
