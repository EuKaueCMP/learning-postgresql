# learning-postgresql

Repository dedicated to practical exercises, scripts, and concepts learned while studying PostgreSQL.

## Description

`learning-postgresql` documents hands-on learning progress with PostgreSQL, covering relational database modeling, schema organization, table constraints, relationships, and queries.

The repository serves as a personal knowledge base and practice log for relational database management with PostgreSQL.

## Technologies

- **Database:** PostgreSQL
- **Language:** SQL (DDL, DML)

## Project Structure

```text
learning-postgresql/
└── first-script/
    └── Biblioteca.sql
```

## Topics & Scripts

### 1. Library Schema (`first-script/Biblioteca.sql`)
Demonstrates database modeling for a library management scenario:
- **Custom Schema:** Creation of dedicated schema `livros`.
- **Relational Tables:**
  - `livros.autor`: Author records with auto-incrementing primary key (`SERIAL`).
  - `livros.livro`: Book records linked to authors via foreign key with `ON DELETE CASCADE`.
- **Data Insertion:** Populating relational records.
- **Queries:** Relational joins (`JOIN`) combining authors and books.

## Setup & Execution

### Prerequisites
- [PostgreSQL](https://www.postgresql.org/) (version 14+)
- A database client such as `psql`, pgAdmin, or DBeaver

### Running the Scripts
1. Connect to your PostgreSQL instance:
```bash
psql -U postgres
```

2. Create and select a database for practice:
```sql
CREATE DATABASE learning_db;
\c learning_db;
```

3. Execute the script:
```bash
psql -U postgres -d learning_db -f first-script/Biblioteca.sql
```

## Developer

**Kauê Sérgio Campos**  
GitHub: [@EuKaueCMP](https://github.com/EuKaueCMP)
