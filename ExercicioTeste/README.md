# 🚗 Banco de Dados — Concessionária Auto Fácil

Este repositório contém a modelagem, inserção, manipulação de dados e relatórios em SQL para o sistema da concessionária **Auto Fácil**, especializada na venda de veículos novos e seminovos.

---

## 📌 Escopo do Projeto

O banco de dados gerencia a operação de vendas da concessionária relacionando veículos disponíveis, clientes cadastrados, vendedores e os registros das vendas efetuadas.

---

## 📖 Dicionário de Dados

### 🔹 Tabela: `veiculos`
Armazena o catálogo de automóveis disponíveis na concessionária.

| Nome da Coluna | Tipo de Dado | Função do Campo |
| :--- | :--- | :--- |
| `id_veiculo` | `INT` | **Chave Primária (PK)** — Identificador único do veículo |
| `modelo` | `VARCHAR(50)` | Nome do modelo do veículo |
| `marca` | `VARCHAR(50)` | Fabricante/marca do veículo |
| `ano` | `INT` | Ano de fabricação do veículo |
| `preco` | `DECIMAL(10,2)` | Preço de tabela/venda do veículo |
| `cor` | `VARCHAR(30)` | Cor do veículo (adicionada via `ALTER TABLE`) |

### 🔹 Tabela: `clientes`
Armazena os dados dos compradores.

| Nome da Coluna | Tipo de Dado | Função do Campo |
| :--- | :--- | :--- |
| `id_cliente` | `INT` | **Chave Primária (PK)** — Identificador único do cliente |
| `nome` | `VARCHAR(100)` | Nome completo do cliente |
| `telefone` | `VARCHAR(20)` | Número de telefone/contato do cliente |

### 🔹 Tabela: `vendedores`
Armazena a equipe de vendas da concessionária.

| Nome da Coluna | Tipo de Dado | Função do Campo |
| :--- | :--- | :--- |
| `id_vendedor` | `INT` | **Chave Primária (PK)** — Identificador único do vendedor |
| `nome` | `VARCHAR(100)` | Nome do vendedor |
| `comissao` | `DECIMAL(4,2)` | Percentual de comissão sobre as vendas |

### 🔹 Tabela: `vendas`
Tabela relacional que registra a transação de venda.

| Nome da Coluna | Tipo de Dado | Função do Campo |
| :--- | :--- | :--- |
| `id_venda` | `INT` | **Chave Primária (PK)** — Identificador único da venda |
| `id_veiculo` | `INT` | **Chave Estrangeira (FK)** — Referência ao veículo vendido |
| `id_cliente` | `INT` | **Chave Estrangeira (FK)** — Referência ao cliente comprador |
| `id_vendedor` | `INT` | **Chave Estrangeira (FK)** — Referência ao vendedor responsável |
| `data_venda` | `DATE` | Data da realização da venda |
| `valor_final` | `DECIMAL(10,2)` | Valor final negociado da venda |
