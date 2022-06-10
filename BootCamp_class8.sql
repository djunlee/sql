-- 1. 데이터베이스 생성하기
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BootCamp_ch8')
  BEGIN
    CREATE DATABASE [BootCamp_ch8]
    END;

-- 2. 데이터베이스 사용하기
USE [BootCamp_ch8];


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
   )
;

-- 5. 고객 데이터 집어넣기 (주의! 이 부분은 한번만 실행해주세요!)
INSERT INTO dbo.Customer
VALUES 
(1, 'Richard', 30, 'M', 'Y'),
(2, 'Bella', 15 ,'F', 'N'),
(3, 'Paul', 44, 'M', 'Y'),
(4, 'Maria', 32, 'F', 'Y'),
(5, 'Susan', 27, 'F', 'Y'),
(6, 'Sam', 18, 'M', 'N')
;

-- 6. 판매 데이터 집어넣기 (주의! 이 부분은 한번만 실행해주세요!)
INSERT INTO dbo.Sales
VALUES 
(1, 'Apple', 4, 2.5, 10),
(2, 'Banana', 2, 1.2, 5),
(3, 'Cherry', 2, 10, 1),
(4, 'Mango', 6, 5.5, 2),
(5, 'Orange', null, 3, 5)
;

-- 7. 데이터 쿼리 작성하기 (클래스 내용을 여기에 작성해보세요)

--1) ID(c_id) 기준으로 FULL JOIN
SELECT * FROM Customer;
SELECT * FROM Sales;

-- AS 사용 가능
SELECT * 
FROM Customer as C
FULL JOIN Sales as S
ON C.id = S.c_id

--2) ID(c_id) 기준으로 INNER JOIN
SELECT * 
FROM Customer as C
INNER JOIN Sales as S
on C.id = S.c_id

--3) LEFT JOIN
-- Match가 2번 이루어지는것은 열 추가생성
SELECT * 
FROM Customer as C
LEFT JOIN Sales as S
on C.id = S.c_id

--4) RIGHT JOIN
SELECT * 
FROM Customer as C
RIGHT JOIN Sales as S
on C.id = S.c_id

--5) CROSS JOIN
-- ON 이 불필요
SELECT * FROM Customer; SELECT * FROM Sales;

SELECT C.*, S.product, S.price
FROM Customer as C
CROSS JOIN Sales as S
