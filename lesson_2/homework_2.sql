/*
1) Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf,
задав в нем логин и пароль, который указывался при установке.
*/

    --serstar@serstar-Lenovo-IdeaPad-S510p:~$ cat > .my.cnf
        --[client]
        --user=root
        --password=****************
    --serstar@serstar-Lenovo-IdeaPad-S510p:~$ chmod 0600 .my.cnf

--====================================================================
/*
2) Создайте базу данных example, разместите в ней таблицу users, 
состоящую из двух столбцов, числового id и строкового name.
*/
    --serstar@serstar-Lenovo-IdeaPad-S510p:~$ mysql -u root -p
    --mysql> 
            SHOW DATABASES;
/*
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0,00 sec)
*/
    --mysql> 
            CREATE DATABASE example;
            --Query OK, 1 row affected (0,02 sec)

    --mysql> 
            USE example;
            --Database changed

    --mysql> 
            CREATE TABLE users (id INT, name VARCHAR(255));
            --Query OK, 0 rows affected (0,09 sec)

    --mysql> 
            SHOW TABLES;
/*
+-------------------+
| Tables_in_example |
+-------------------+
| users             |
+-------------------+
1 row in set (0,01 sec)
*/
    --mysql> 
            INSERT users VALUE (1, 'Сергей');
            --Query OK, 1 row affected (0,01 sec)

    --mysql> 
            INSERT users VALUE (2, 'Алексей');
            --Query OK, 1 row affected (0,02 sec)

    --mysql> 
            INSERT users VALUE (3, 'Иван');
            --Query OK, 1 row affected (0,01 sec)

--====================================================================
/*
3) Создайте дамп базы данных example из предыдущего задания, 
разверните содержимое дампа в новую базу данных sample.
*/
    --mysql> exit
    --Bye
    --serstar@serstar-Lenovo-IdeaPad-S510p:~$ --mysqldump -u root -p example > /home/serstar/Learning\ MySQL/MySQL/lesson_2/homework_2_dump.sql
/*
Создаем новую базу данных sample
*/
    --serstar@serstar-Lenovo-IdeaPad-S510p:~$ mysql -u root -p
    --mysql> CREATE DATABASE sample;
            --Query OK, 1 row affected (0,01 sec)
    --mysql> SHOW DATABASES;
/*
+--------------------+
| Database           |
+--------------------+
| example            |
| information_schema |
| mysql              |
| performance_schema |
| sample             |
| sys                |
+--------------------+
6 rows in set (0,00 sec)
*/
    --mysql> USE sample;
            --Database changed
    --mysql> SHOW TABLES;
            --Empty set (0,00 sec)
    --mysql> exit
            --Bye
/*
Восстанавливаем базу данных из дампа в пустую базу sample
*/
    --serstar@serstar-Lenovo-IdeaPad-S510p:~$ --mysql -u root -p sample < /home/serstar/Learning\ MySQL/MySQL/lesson_2/homework_2_dump.sql

/*
Проверяем
*/
    --mysql> USE sample;
            --Reading table information for completion of table and column names
            --You can turn off this feature to get a quicker startup with -A

            --Database changed
    --mysql> SHOW TABLES;
/*
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
1 row in set (0,00 sec)
*/

    --mysql> SELECT * FROM users;
/*
+------+----------------+
| id   | name           |
+------+----------------+
|    1 | Сергей         |
|    2 | Алексей        |
|    3 | Иван           |
+------+----------------+
3 rows in set (0,00 sec)
*/











