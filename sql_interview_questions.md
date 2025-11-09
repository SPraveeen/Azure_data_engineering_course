- difference between where and having clause in sql
    - The WHERE clause is used to filter rows before any groupings are made, while the HAVING clause is used to filter groups after the GROUP BY operation has been applied. In other words, WHERE filters individual records, and HAVING filters aggregated records.

- difference between delete, truncate and drop commands in sql
    - DELETE: This command is used to remove specific rows from a table based on a condition. It can be rolled back if within a transaction.
    - TRUNCATE: This command removes all rows from a table, but it does not log individual row deletions. It is faster than DELETE for large tables and cannot be rolled back in most databases.
    - DROP: This command removes the entire table structure along with all its data from the database. It cannot be rolled back.


- what is coalesce function in sql
    - The COALESCE function in SQL returns the first non-null value from a list of expressions. It is commonly used to handle null values in queries. For example, COALESCE(column1, column2, 'default') will return the value of column1 if it is not null; otherwise, it will return the value of column2, and if both are null, it will return 'default'.

- primary key vs foreign key vs unique key
    - Primary Key: A primary key is a column or a set of columns in a table that uniquely identifies each row in that table. It must contain unique values and cannot contain NULLs.
    - Foreign Key: A foreign key is a column or a set of columns in one table that refers to the primary key in another table. It is used to establish and enforce a link between the data in the two tables, ensuring referential integrity.
    - Unique Key: A unique key is a column or a set of columns that ensures all values in that column(s) are unique across the table. Unlike primary keys, unique keys can accept NULL values (but only one NULL per column in most databases).

