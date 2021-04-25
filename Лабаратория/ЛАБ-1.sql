//*	�������� ��� ������ �� ������� Person.Person.*//
SELECT*FROM Person.Person

//*�������� ��� ������ �� ������� Person.Person. �������� ������ ���� FirstName, LastName � MiddleName.*//
SELECT FirstName, LastName, MiddleName
FROM Person.Person;

//*�������� �������, ��������� �����������������. �������� ��� ������,
���� (ListPrice) ������� ������ $100 �� ������� Production.Product, �������� ������ ����
ProductNumber, Name, ListPrice, Color, Size � Weight.*//
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE  ListPrice < 100

//*�������� �������, ������������� ��������� AND� LIKE. 
�������� � ��������� ����������� ������� ����������� �� ������� ProductNumber. 
�������� ������ �� ������, ������� ���������� �� SO.*//
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE ListPrice < 100 AND ProductNumber LIKE 'SO%';

//*�������� ������� � ���������� OR. �������� ���������� ������,
������� � ���������� ������, ������� TG��� SO� ���� ProductNumber.*//
roductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE  ListPrice < 100 AND (ProductNumber LIKE 'SO%' OR ProductNumber LIKE 'TG%' );

//*�������� ������� � ���������� BETWEEN. 
�������� ������, ������� SO ����� ProductNumber��� ������ ������ tights(TG) � ����� �� $50�� $180.*//
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE  ProductNumber LIKE 'TG%' AND ListPrice BETWEEN '50' AND '180' OR ProductNumber LIKE 'SO%';

//*�������� ������� � �������������� ��������� IN. 
� ����� ������� �������� ������� �� ����� ������ �������� (tights (TG))� ��������� �������� M� L.*//
SELECT ProductNumber, Name, ListPrice, Color, Size, Weight
FROM Production.Product
WHERE  (ProductNumber LIKE 'TG%' AND ListPrice BETWEEN '50' AND '180' AND Size IN ('M', 'L')) OR (ProductNumber LIKE 'SO%');

//*�������� ������� � ������� Production.Product, 
������������ ������� ������ �� ����� ProductNumber, Name� Weight, � ������� ProductLine�������� (NOT NULL).*//

SELECT ProductNumber, Name, Weight, ProductLine
FROM Production.Product
WHERE ProductLine IS NOT NULL;

//*�������� ���������� ������, ������� ������ � ������������ ���������� (NULL).*//

SELECT ProductNumber, Name, Weight, ProductLine
FROM Production.Product
WHERE ProductLine IS NULL;

//*������� ������, ��������� ��������� SELECT� �������� ISNULL��� �������������� ��������. 
����������� ������� ISNULL, ����� ��� ����������� �������� � ������� ProductLine���������� �������� �NA�.*//
SELECT ProductNumber
, Name
, Weight
, ISNULL (ProductLine, 'NA') AS ProductLine
FROM Production.Product

//*�������� ���������� ������ ���, ����� ���� ������ ���������� �ProductLine�(��� ����� � ��������).*//

SELECT ProductNumber
,Name
,Weight
, ISNULL (ProductLine, 'NA') AS 'Product Line'
FROM Production.Product

//*�������� ������ � �������������� ������� COALESCE()� ����������� ������ ���� Measurement���, �����:
����� �������� �������� � ���� Weight, �� �������� ��� ��������;
����� �������� � ���� Weight ����������, �� �������� �������� � ���� Size, �� ���������� ��� ��������;
�� ��������� �������� �������� �������� �NA�*//

SELECT ProductNumber
, Name
, COALESCE(
CAST ([Weight] AS VARCHAR(10))
, Size
, 'AN') AS 'Measurement'
FROM Production.Product

//*������� ������ � ������� Production.Product� ������ ProductNumber, Name� Class.
�������� ���������� �� ��������� � ���� Class.*//

SELECT ProductNumber, Name, Class
FROM Production.Product
ORDER BY Class;

//*�������� ���������� ������, ����������� ���� ListPrice. 
�������� ���������� �� ������ ���� � ������� �������� ����.*//
SELECT  ProductNumber, Name, Class, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

//*������� ������ � ������� Production.Product, ������������ ��� ��������� ����� �������. 
�������� ������ ���� ������ ��� ������� �����.*//
SELECT DISTINCT Color
FROM Production.Product

//*������� ������ � ������� Person.Person. 
������� ����, ������������ �� �������� LastName� FirstName, ����������� ������� � ��������.*//

SELECT concat (LastName, ',', FirstName)
FROM Person.Person

//*�������� ���������� ������, ���, ����� ��������� ���� ���������� Contact.*//

SELECT concat (LastName, ',', FirstName) AS 'Contact'
FROM Person.Person

//*���������� ������ ����� �������, ����� ����� �������� �� ���� ������� LastName,
������������ �� �Mac�� �������������� ������� SUBSTRING().*//

SELECT concat (LastName, ',', FirstName) AS 'Contact'
FROM Person.Person
WHERE SUBSTRING(LastName,1,3) = 'Mac'

