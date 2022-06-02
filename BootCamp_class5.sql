-- 1. 데이터베이스 생성하기
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BootCamp_ch5')
  BEGIN
    CREATE DATABASE [BootCamp_ch5]
    END;

-- 2. 데이터베이스 사용하기
USE [BootCamp_ch5];

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

-- 4. 데이터 집어넣기 
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
-- 1) 데이터 전체보기
SELECT * FROM Customer;

-- 2) 특정 변수만 선택
SELECT name, age, gender
FROM Customer;

-- 3) 변수 위치 변환
SELECT name, gender, age
FROM Customer;

-- 4) 행의 갯수 파악
-- NULL 이 없다면 모두 동일
SELECT count(*) as count FROM customer;
SELECT count(age) as count FROM customer;
SELECT count(gender) as count FROM customer;

-- 5) 여성 고객들의 ID,name, gender, adult
SELECT ID, name, gender, adult
FROM Customer
WHERE gender = 'F';

-- 6) 20살 이하 고객들의 ID,name, gender, adult
SELECT ID, name, gender, adult
FROM Customer
WHERE age <= 20;

-- 7) 여성인 고객들의 ID, name, gender, adult를 나이가 적은 순서대로
SELECT ID, name, gender, adult, age
FROM Customer
WHERE gender ='F'
ORDER BY age;

-- 나이가 많은 순서대로
SELECT ID, name, gender, adult, age
FROM Customer
WHERE gender ='F'
ORDER BY age DESC;

-- 8) 여성인 고객들의 ID, name, gender, adult를 나이가 적은 순서대로 정리한후, 2개의 행만
SELECT TOP 2
ID, name, gender, adult
FROM Customer
WHERE gender ='F'
ORDER BY age;