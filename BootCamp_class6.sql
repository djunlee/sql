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

-- 1) 성인 고객들의 gender, age
SELECT gender, age 
FROM Customer
WHERE adult='Y';

-- 2) 성인 고객들의 gender와 gender별 평균 age
SELECT gender, AVG(age) as mean_age
FROM Customer
WHERE adult='Y'
GROUP BY gender;

-- 3) 성인 고객들의 gender와 gender별 평균 age, 최소 age
SELECT gender, AVG(age) as average, MIN(age) as minimum
FROM Customer
WHERE adult='Y'
GROUP BY gender
ORDER BY gender DESC;

-- 4) 성인 고객들의 gender와 gender별 평균 age를 가지고 오되 성별 별 최소연령이 19세 이상
SELECT gender, AVG(age) as average
FROM Customer
WHERE adult='Y'
GROUP BY gender HAVING MIN(age) >19
ORDER BY gender DESC;

-- HAVING 조건을 만족하지 못하는 GROUP은 제외시켜 버린다.
SELECT gender, AVG(age) as average
FROM Customer
WHERE adult='Y'
GROUP BY gender HAVING MIN(age) >27
ORDER BY gender DESC;

-- 5) 소수점 표현법
SELECT gender, AVG(age) as average
FROM Customer
WHERE adult='Y'
GROUP BY gender;

SELECT gender, AVG(cast(age as float)) as average 
FROM Customer
WHERE adult='Y'
GROUP BY gender;