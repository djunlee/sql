-- 1. 데이터베이스 생성하기
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BootCamp_ch7')
  BEGIN
    CREATE DATABASE [BootCamp_ch7]
    END;

-- 2. 데이터베이스 사용하기
USE [BootCamp_ch7];

-- 3. 상품 테이블 만들기
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Product' and xtype='U')
CREATE TABLE Product
   (
      ID int NOT NULL 
	  , Name nvarchar(50)
	  , Category nvarchar(50)
	  , Brand nvarchar(50)
	  , Price INT
	  )
;

-- 4. 데이터 집어넣기
INSERT INTO dbo.Product
VALUES 
(1, 'Laptop', 'Computer', 'Apple', 1400000),
(2, 'Earbud', 'Accessory', 'Samsung', 300000),
(3, 'Desktop', 'Computer', 'Apple', 2000000),
(4, 'Keyboard', 'Accessory', 'Samsung', 35000),
(5, 'Speaker', 'Accessory', 'LG', 110000)
;

-- 5. 데이터 쿼리 작성하기 (클래스 내용을 여기에 작성해보세요)

--1) AS
SELECT COUNT(*) AS total_number
FROM Product;

--2) AND, OR
SELECT COUNT(*) as count
FROM Product
WHERE Category = 'Accessory'
	AND Brand = 'Samsung';

SELECT COUNT(*) as count
FROM Product
WHERE Category = 'Accessory'
	OR Brand = 'Samsung';

--3) DISTINCT, 고유값
SELECT DISTINCT *
FROM Product

SELECT DISTINCT Brand, Category
FROM Product

SELECT DISTINCT Category, Brand
FROM Product

--4) LIKE, 단어의 패턴 인식
SELECT DISTINCT Name
FROM Product
WHERE Name = 'Speaker'

SELECT DISTINCT Name
FROM Product
WHERE Name  LIKE 'Speaker'

SELECT DISTINCT Brand
FROM Product
WHERE Brand  LIKE 'A____'

SELECT DISTINCT Brand
FROM Product
WHERE Brand  LIKE 'A%' 

SELECT DISTINCT Name, Brand
FROM Product
WHERE Brand LIKE 'Apple' or Brand LIKE 'Samsung'

SELECT DISTINCT Name
FROM Product
WHERE Name LIKE '%p'

SELECT DISTINCT Name
FROM Product
WHERE Name LIKE 'D%p'

SELECT DISTINCT Name
FROM Product
WHERE Name NOT LIKE 'D%p'

--5) (NOT) IN
SELECT DISTINCT Name, Brand
FROM Product
WHERE Name = 'Laptop'
	OR Name = 'Desktop'

SELECT DISTINCT Name, Brand
FROM Product
WHERE Name IN('Laptop', 'Desktop')

--6) CASE WHEN
SELECT DISTINCT * FROM Product;

-- 고가, 중간가, 저가 판단
SELECT 
DISTINCT Name, price,
CASE 
WHEN Price > 1000000 THEN 'expensive'
WHEN Price > 100000 THEN 'moderate'
ELSE 'cheap' END as price_category
FROM Product;
