# 1. +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
SELECT *
FROM client
WHERE LENGTH(FirstName) < 6;

# 2. +Вибрати львівські відділення банку.+
SELECT *
FROM department
WHERE DepartmentCity = 'Lviv';

# 3. +Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
SELECT *
FROM client
WHERE Education = 'high'
ORDER BY LastName;

# 4. +Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
SELECT *
FROM application
ORDER BY idApplication DESC
LIMIT 5 OFFSET 10;

# 5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA.
SELECT *
FROM client
WHERE LastName LIKE '%IV'
   OR LastName LIKE '%A';


