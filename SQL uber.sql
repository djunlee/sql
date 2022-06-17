-- 데이터베이스 만들기
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BootCamp_Uber')
  BEGIN
    CREATE DATABASE BootCamp_Uber
    END
GO

-- 데이터베이스 사용하기
USE BootCamp_Uber
GO

-- 서비스 기록 테이블 만들기
CREATE TABLE Orders
   (
      Order_ID int NOT NULL ,
	  [User_Name] nvarchar(10) NULL,
	  Service_type nvarchar(10) NULL,
	  Service_date date NULL
   )
;

-- 서비스 기록 데이터 입력하기
INSERT INTO Orders
VALUES 
(1, 'Mike', 'Basic','2021-1-07'),
(2, 'John', 'Basic','2021-1-15'),
(3, 'Dave', 'Basic','2021-1-15'),
(4, 'Sally', 'Basic','2021-2-21'),
(5, 'Richard', 'Basic','2021-2-15'),
(6, 'Bella', 'Basic','2021-2-05'),
(7, 'Dustin', 'Premium','2021-2-07'),
(8, 'Bella', 'Premium','2021-3-19'),
(9, 'Nate', 'Premium','2021-2-15'),
(10, 'Kim', 'Premium','2021-2-07'),
(11, 'Sujan', 'Basic','2021-1-06'),
(12, 'Richard', 'Basic','2021-3-07'),
(13, 'Mallory', 'Premium','2021-2-07'),
(14, 'Mike', 'Premium','2021-2-01'),
(15, 'Sally', 'Premium','2021-3-07'),
(16, 'Tim', 'Premium','2021-2-07'),
(17, 'Kevin', 'Basic','2021-2-07'),
(18, 'Richard', 'Basic','2021-2-07'),
(19, 'Dave', 'Premium','2021-1-07'),
(20, 'Lilly', 'Premium','2021-3-07')
;



-- Q) 프리미엄 service만 사용하는 고유한 고객의 LIST 생성 (이름만)
SELECT * FROM Orders;

--1) 프리미엄 서비스를 사용하는 고객
-- 프리미엄 서비스 '도' 사용하는 고객임에 유의.
SELECT * 
FROM Orders
WHERE Service_type = 'Premium'

--2) 이름순 정렬해서 대략적 파악
SELECT User_name, Service_type
FROM Orders
ORDER BY User_Name;


--3) 
-- 1. 프리미엄 사용하는 회원 TABLE
-- 2. 중복회원 추출
-- 3. EXCEPT(MINUS)

--1.
SELECT DISTINCT User_Name
FROM Orders
WHERE Service_type = 'Premium'
GROUP BY User_Name;

--2.
-- 날짜 고려 필수
SELECT * FROM Orders;

SELECT User_name, COUNT(DISTINCT Service_type) as Num_of_service
FROM Orders
GROUP BY User_Name
HAVING COUNT(DISTINCT Service_type) = 2;

--3.
SELECT DISTINCT User_Name
FROM Orders
WHERE Service_type = 'Premium'

EXCEPT

SELECT User_name
FROM Orders
GROUP BY User_Name
HAVING COUNT(DISTINCT Service_type) = 2;




-- **모범 답안** 
--1) 전체 테이블을 프리미엄, 베이직을 구분해 두 테이블로 분리
--2) 프리미엄 테이블 유저 이름에서 베이직 서비스 유저 이름 제외
--3) EXCEPT문을 사용해서 자동으로 고유값 도출

SELECT * FROM Orders
WHERE Service_type = 'Premium'
EXCEPT
SELECT * FROM Orders
WHERE Service_type = 'basic'

SELECT User_Name FROM Orders
WHERE Service_type = 'Premium'
EXCEPT
SELECT User_Name FROM Orders
WHERE Service_type = 'basic'

-- 답안 비교
SELECT DISTINCT User_Name
FROM Orders
WHERE Service_type = 'Premium'
GROUP BY User_Name

EXCEPT

SELECT User_name
FROM Orders
GROUP BY User_Name
HAVING COUNT(DISTINCT Service_type) = 2;