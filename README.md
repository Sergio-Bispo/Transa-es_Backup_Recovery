1. COMANDOS MYSQL PARA BACKUP : Transaction_ecommerce, Desafio_ecommerce e Desafio_oficina.
-C:\Windows\System32>cd C:\Program Files\MySQL\MySQL Server 9.2\bin\

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump --user root --password --databases transaction_ecommerce > transction_ecommerce_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>dir

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump --user root --password --databases Desafio_ecommerce > Desafio_ecommerce_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>dir

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump --user root --password --databases Desafio_oficina > Desafio_oficina_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>dir

2. RECOVERY EM MYSQL: ecommerce e oficina.

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysql --user root --password < Desafio_ecommerce_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysql --user root --password < Desafio_oficina_backup.sql

3. ROTINAS: Company e Oficina

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump --routines --triggers -u root -p company_constraints > company_constraints_backup.sql

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump --routines --triggers -u root -p oficina_constraints > oficina_constraints_backup.sql

4. SEPARANDO OS DUMP FILES EM STATEMENTS SQL

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump --no-data -u root -p transaction_exemple > transaction_exemple_no_data_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>dir

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump --no-create-info -u root -p transaction_exemple > transaction_exemple_no_info_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>dir

5. VERIFICANDO OUTRAS OPÇÕES DE BACKUP MYSQL

-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump -u root -p --all-databases > all_databases_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>dir
-C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump -u root -p --databases company_constraints customer_managment > all_databases_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>dir
C:\Program Files\MySQL\MySQL Server 9.2\bin>mysqldump -u root -p transaction_exemple ordersdetails > transaction_exemple_tbl_ordersdetails_backup.sql
-C:\Program Files\MySQL\MySQL Server 9.2\bin>dir
