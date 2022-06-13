-- 사용방법: 
-- 번호 순서대로 해당하는 쿼리를 마우스로 드래그 후 Execute (또는 F5키) 로 한개씩 실행하기

-- 1. 데이터베이스 생성하기
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BootCamp_ch9')
  BEGIN
    CREATE DATABASE [BootCamp_ch9]
    END;

-- 2. 데이터베이스 사용하기
USE [BootCamp_ch9];

-- 3. 고객 테이블 만들기
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Customer' and xtype='U')
CREATE TABLE dbo.Customer
   (
      ID int NOT NULL 
	  , name nvarchar(50)
	  , age INT 
	  , sex varchar(1) 
		NOT NULL CHECK (sex IN('F', 'M'))
      , adult varchar(1) 
		NOT NULL CHECK (adult IN('Y', 'N'))
	  , town nvarchar(50)
   )
;

-- 4. 판매 테이블 만들기
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Sales' and xtype='U')
CREATE TABLE dbo.Sales
   (
      ID int NOT NULL 
	  , product nvarchar(50)
	  , c_id int
	  , price decimal(10,2)
	  , quantity int
	  , city nvarchar(50)
   )
;

-- 5. 고객 데이터 집어넣기 (주의! 이 부분은 한번만 실행해주세요!)
INSERT INTO dbo.Customer
VALUES 
(1, 'Richard', 30, 'M', 'Y', 'Los Angeles'),
(2, 'Bella', 15 ,'F', 'N', 'San Diego'),
(3, 'Paul', 44, 'M', 'Y', 'San Jose'),
(4, 'Maria', 32, 'F', 'Y', 'Long Beach'),
(5, 'Susan', 27, 'F', 'Y', 'Los Angeles'),
(6, 'Sam', 18, 'M', 'N', 'Los Angeles'),
(7, 'Mallory', 25 ,'F', 'Y', 'Riverside'),
(8, 'Jacob', 17, 'M', 'N', 'Sacramento'),
(9, 'Nick', 50, 'M', 'Y', 'Long Beach'),
(10, 'Ben', 30, 'M', 'Y', 'Los Angeles'),
(11, 'James', 27, 'M', 'Y', 'Los Angeles'),
(12, 'Robert', 35 ,'M', 'Y', 'Anaheim'),
(13, 'John', 60, 'M', 'Y', 'Santa Ana'),
(14, 'Michael', 10, 'M', 'N', 'Santa Ana'),
(15, 'David', 27, 'M', 'Y', 'Los Angeles'),
(16, 'Jennifer', 18, 'F', 'N', 'Los Angeles'),
(17, 'Linda', 29 ,'F', 'Y', 'Huntington Beach'),
(18, 'Sarah', 31, 'F', 'Y', 'San Francisco'),
(19, 'Jessica', 52, 'F', 'Y', 'San Francisco'),
(20, 'Lisa', 23, 'F', 'Y', 'San Francisco')
;

-- 6. 판매 데이터 집어넣기 (주의! 이 부분은 한번만 실행해주세요!)
INSERT INTO dbo.Sales
VALUES 
(1, 'Apple', 4, 2.5, 10, 'Dublin'),
(2, 'Banana', 2, 1.2, 5, 'San Diego'),
(3, 'Cherry',2, 10, 1, 'San Jose'),
(4, 'Mango', 6, 5.5, 2, 'San Francisco'),
(5, 'Orange', NULL, 3, 5, 'Los Angeles'),
(6, 'Grape', 1, 4.98, 15, 'Los Angeles'),
(7, 'Grapefruit', 20, 1.9, 5, 'San Francisco'),
(8, 'Apple Mango', 16, 6, 2, 'San Francisco'),
(9, 'Watermelon', 8, 5.99, 7, 'Long Beach'),
(10, 'Melon', 9, 7, 9, 'Los Angeles'),
(11, 'Apricot', 20, 1.4, 10, 'Los Angeles'),
(12, 'Jackfruit', 8.2, 11, 5, 'San Diego'),
(13, 'Coconut', 14, 3.2, 1, 'San Jose'),
(14, 'Lemon', 11, 0.3, 20, 'San Francisco'),
(15, 'Lychee', 8, 6.2, 8, 'Los Angeles'),
(16, 'Musk Melon', 19, 13, 1, 'Los Angeles'),
(17, 'Pineapple', 13, 2.5, 5, 'Riverside'),
(18, 'Star Fruit', 17, 4, 2, 'Sacramento'),
(19, 'Peach', NULL, 1.99, 11, 'Ontario'),
(20, 'Guava', NULL, 12.4, 1, 'Fremont')
;


-- 7. 데이터 쿼리 작성하기 (클래스 내용을 여기에 작성해보세요)

SELECT town
FROM Customer

UNION ALL

SELECT city
FROM Sales;

SELECT town
FROM Customer

UNION 

SELECT city
FROM Sales;

SELECT town
FROM Customer

INTERSECT 

SELECT city
FROM Sales;






-- Q1. Customer 테이블과 Sales 테이블에서 중복되는 도시는?

SELECT town
FROM customer
INTERSECT
SELECT city
FROM Sales;

-- Q2. Customer 테이블에 있지만 Sales 테이블에서 없는 도시는?

SELECT town
FROM customer
EXCEPT
SELECT city
FROM Sales;

-- Q3. 40살 미만인 고객이 있는 마을을 제외한 판매 테이블의 도시 리스트

SELECT city
FROM Sales
Except
SELECT town
FROM Customer WHERE age<40;

-- 예시 (;를 마지막에 꼭 넣어주세요!)
SELECT * FROM Customer;
SELECT * FROM Sales;