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

# 6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.
SELECT c.LastName, c.FirstName, d.DepartmentCity
FROM client c
         JOIN department d on c.Department_idDepartment = d.idDepartment
WHERE d.DepartmentCity = 'Kyiv';

# 7. +Вивести імена клієнтів та їхні номера телефону, погрупувавши їх за іменами.
SELECT c.FirstName, c.Passport
FROM client c
ORDER BY FirstName;

# 8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
SELECT c.LastName, c.FirstName, a.CreditState, a.Sum, a.Currency
FROM client c
         JOIN application a ON c.idClient = a.Client_idClient
WHERE Sum > 5000
  AND CreditState = 'Not returned'
  AND Currency = 'Gryvnia';

# 9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.  ?????
SELECT COUNT(idClient) as allClients
FROM client
UNION
SELECT COUNT(FirstName) as LvivClients
FROM client c
         JOIN department d ON c.Department_idDepartment = d.idDepartment
WHERE d.DepartmentCity = 'Lviv';

# 10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
SELECT FirstName, LastName, MAX(Sum) maxSum
FROM application
         JOIN client on idClient = application.Client_idClient
GROUP BY idClient;
