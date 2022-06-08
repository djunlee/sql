-- 사용방법: 
-- 번호 순서대로 해당하는 쿼리를 마우스로 드래그 후 Execute (또는 F5키) 로 한개씩 실행하기


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
SELECT Name, Brand, Price as 가격
FROM Product
WHERE Brand = 'Apple' or Brand = 'Samsung';

SELECT Name, Brand, Price as 가격
FROM Product
WHERE Brand in ('Apple','Samsung');

SELECT count(*) as tot_number
FROM Product;

SELECT count(*) as num_of_SamsungAccessory
FROM Product
WHERE Category = 'Accessory' and Brand ='Samsung';

SELECT distinct Category, brand
FROM Product;

SELECT distinct Category, brand
FROM Product;

SELECT Name, Brand, Price
FROM Product
WHERE Brand LIKE 'A%';

SELECT 
	CASE
	WHEN Price > 100000 THEN 'expensive'
	WHEN Price > 10000  THEN 'moderate'
	else 'cheap'
	END as criterion
FROM Product;

-- 예시 (;를 마지막에 꼭 넣어주세요!)
SELECT * FROM Product;