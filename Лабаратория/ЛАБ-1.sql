//*	Показать все записи из таблицы Person.Person.*//
SELECT*FROM Person.Person

//*Показать все записи из таблицы Person.Person. Включить только поля FirstName, LastName и MiddleName.*//
SELECT FirstName, LastName, MiddleName
FROM Person.Person;

//*Создание запроса, используя предикатсравнения. Показать все записи,
цена (ListPrice) которых меньше $100 из таблицы Production.Product, включить только поля
ProductNumber, Name, ListPrice, Color, Size и Weight.*//
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE  ListPrice < 100

//*Создание запроса, использующего предикаты ANDи LIKE. 
Добавить в выражение предыдущего запроса ограничение на столбец ProductNumber. 
Показать только те записи, которые начинаются на SO.*//
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE ListPrice < 100 AND ProductNumber LIKE 'SO%';

//*Создание запроса с предикатом OR. Изменить предыдущий запрос,
включив в результаты строки, имеющие TGили SOв поле ProductNumber.*//
roductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE  ListPrice < 100 AND (ProductNumber LIKE 'SO%' OR ProductNumber LIKE 'TG%' );

//*Создание запроса с предикатом BETWEEN. 
Показать строки, имеющие SO вполе ProductNumberили строки товара tights(TG) с ценой от $50до $180.*//
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE  ProductNumber LIKE 'TG%' AND ListPrice BETWEEN '50' AND '180' OR ProductNumber LIKE 'SO%';

//*Создание запроса с использованием предиката IN. 
В текст скрипта добавить условие на поиск товара колготки (tights (TG))в диапазоне размеров Mи L.*//
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE  (ProductNumber LIKE 'TG%' AND ListPrice BETWEEN '50' AND '180' AND Size IN ('M', 'L')) OR (ProductNumber LIKE 'SO%');

//*Создание запроса к таблице Production.Product, 
позволяющего извлечь данные из полей ProductNumber, Nameи Weight, в которых ProductLineизвестно (NOT NULL).*//

SELECT ProductNumber, Name, Weight, ProductLine
FROM Production.Product
WHERE ProductLine IS NOT NULL;

//*Изменить предыдущий запрос, показав строки с неизвестными значениями (NULL).*//

SELECT ProductNumber, Name, Weight, ProductLine
FROM Production.Product
WHERE ProductLine IS NULL;

//*Создать запрос, используя выражение SELECTс функцией ISNULLдля переименования значений. 
Используйте функцию ISNULL, чтобы при неизвестном значении в столбце ProductLineвыводилось значение ‘NA’.*//
SELECT ProductNumber
, Name
, Weight
, ISNULL (ProductLine, 'NA') AS ProductLine
FROM Production.Product

//*Изменить предыдущий запрос так, чтобы поле вывода называлось “ProductLine”(два слова с пробелом).*//

SELECT ProductNumber
,Name
,Weight
, ISNULL (ProductLine, 'NA') AS 'Product Line'
FROM Production.Product

//*Изменить запрос с использованием функции COALESCE()и заполнением нового поля Measurementтак, чтобы:
•если известно значение в поле Weight, то показать это значение;
•если значение в поле Weight неизвестно, но известно значение в поле Size, то показывать его значение;
•в противном варианте значение написать “NA”*//

SELECT ProductNumber
, Name
, COALESCE(
CAST ([Weight] AS VARCHAR(10))
, Size
, 'AN') AS 'Measurement'
FROM Production.Product

//*Создать запрос к таблице Production.Productс полями ProductNumber, Nameи Class.
Провести сортировку по значениям в поле Class.*//

SELECT ProductNumber, Name, Class
FROM Production.Product
ORDER BY Class;

//*Изменить предыдущий запрос, добавлением поля ListPrice. 
Провести сортировку по новому полю в порядке убывания цены.*//
SELECT  ProductNumber, Name, Class, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

//*Создать запрос к таблице Production.Product, показывающий все имеющиеся цвета товаров. 
Показать только одну строку для каждого цвета.*//
SELECT DISTINCT Color
FROM Production.Product

//*Создать запрос к таблице Person.Person. 
Создать поле, составленное из столбцов LastNameи FirstName, разделенных запятой и пробелом.*//

SELECT concat (LastName, ',', FirstName)
FROM Person.Person

//*Изменить предыдущий запрос, так, чтобы составное поле называлось Contact.*//

SELECT concat (LastName, ',', FirstName) AS 'Contact'
FROM Person.Person

//*Переписать запрос таким образом, чтобы поиск проходил по всем строкам LastName,
начинающимся на ‘Mac’с использованием функции SUBSTRING().*//

SELECT concat (LastName, ',', FirstName) AS 'Contact'
FROM Person.Person
WHERE SUBSTRING(LastName,1,3) = 'Mac'

