-- 사용방법: 
-- 번호 순서대로 해당하는 쿼리를 마우스로 드래그 후 Execute (또는 F5키) 로 한개씩 실행하기


-- 1. 데이터베이스 생성하기
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BootCamp_ch6')
  BEGIN
    CREATE DATABASE [BootCamp_ch6]
    END;

-- 2. 데이터베이스 사용하기
USE [BootCamp_ch6];

-- 3. 고객 테이블 만들기
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Customer' and xtype='U')
CREATE TABLE Customer
   (
      ID int NOT NULL 
	  , name nvarchar(10)
	  , age int
	  , gender varchar(10)
      , adult varchar(10)
   )
;

-- 4. 데이터 집어넣기 (주의! 이 부분은 한번만 실행해주세요!)
INSERT INTO dbo.Customer
VALUES 
(1, 'Richard', 30, 'M', 'Y'),
(2, 'Bella', 15 ,'F', 'N'),
(3, 'Paul', 44, 'M', 'Y'),
(4, 'Maria', 32, 'F', 'Y'),
(5, 'Susan', 27, 'F', 'Y'),
(6, 'Sam', 18, 'M', 'N')
;

-- 5. 데이터 쿼리 작성하기 (클래스 내용을 여기에 작성해보세요)
SELECT gender, AVG(cast(age as float)) as avg_age
FROM Customer
WHERE adult='Y'
GROUP BY gender;
-- 예시 (;를 마지막에 꼭 넣어주세요!)
SELECT * FROM Customer;