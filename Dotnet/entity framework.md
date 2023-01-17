# Entity Framework (Core)

ORM (Object/Relational Mapper), supports multiple DBs, SQL Sever, MySQL/MariaDB, PostreSQL, Oracle, as well as SQLite, in-memory db.

### Model

Data access is porvided with use of the model. Model is made up from:
- entity classes (POCO objects),
- context object (represent the session).

### Code first vs DB first

- model can be generated based on DB or can manually crafted to match DB,
- model can be implemented first, DB can be created/extended with EF Migrations.

### Querying data

- using [LINQ](linq/md) and DB context.

### Writing data

Data is stored using instances of the Entity Model and DB context.

