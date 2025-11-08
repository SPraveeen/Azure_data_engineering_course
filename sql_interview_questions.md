- difference between where and having clause in sql
    - The WHERE clause is used to filter rows before any groupings are made, while the HAVING clause is used to filter groups after the GROUP BY operation has been applied. In other words, WHERE filters individual records, and HAVING filters aggregated records.

- difference between delete, truncate and drop commands in sql
    - DELETE: This command is used to remove specific rows from a table based on a condition. It can be rolled back if within a transaction.
    - TRUNCATE: This command removes all rows from a table, but it does not log individual row deletions. It is faster than DELETE for large tables and cannot be rolled back in most databases.
    - DROP: This command removes the entire table structure along with all its data from the database. It cannot be rolled back.



