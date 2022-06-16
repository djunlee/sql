-- 데이터베이스 만들기
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BootCamp_Apple')
  BEGIN
    CREATE DATABASE BootCamp_Apple
    END
GO

-- 데이터베이스 사용하기
USE BootCamp_Apple
GO

-- 웹 기록 테이블 만들기
CREATE TABLE Web_log
   (
      web_log_id int NOT NULL ,
	  User_ID int NULL,
	  [date] date
   )
;

-- 앱 기록 테이블 만들기
CREATE TABLE App_log
   (
      app_log_id int NOT NULL ,
	  User_ID int NULL,
	  [date] date
   )
;

-- 웹 기록 데이터 입력하기
INSERT INTO dbo.Web_Log
VALUES 
(1, 2001, '2021-01-01'),
(2, 2002, '2021-01-02'),
(3, 2003, '2021-01-03'),
(4, 2004, '2021-01-01'),
(5, 2005, '2021-01-01'),
(6, 2006, '2021-01-01'),
(7, 2007, '2021-01-01'),
(8, 2008, '2021-01-02'),
(9, 2009, '2021-01-02'),
(10, 2010, '2021-01-02'),
(11, 2011, '2021-03-01'),
(12, 2012, '2021-01-01'),
(13, 2013, '2021-01-03'),
(14, 2014, '2021-01-03'),
(15, 2015, '2021-01-03')
;

-- 앱 기록 데이터 입력하기
INSERT INTO dbo.App_Log
VALUES 
(1, 2001, '2021-01-01'),
(2, 2002, '2021-01-02'),
(3, 2003, '2021-01-03'),
(4, 2004, '2021-01-01'),
(5, 2005, '2021-01-03'),
(6, 2006, '2021-01-01'),
(7, 2007, '2021-01-01'),
(8, 2008, '2021-01-02'),
(9, 2009, '2021-01-02'),
(10, 2010, '2021-01-02'),
(11, 2011, '2021-01-02'),
(12, 2012, '2021-01-01'),
(13, 2013, '2021-01-03'),
(14, 2014, '2021-01-01'),
(15, 2015, '2021-01-03')
;


-- ** 데이터 확인 **
SELECT * FROM Web_Log;
SELECT * FROM App_Log;

-- Q) 컴퓨터와 앱으로 애플 페이지에 접속한 기록 TABLE 제공,
-- 1. 애플은 일별로 같은날 앱과 웹에 둘다 접속한 유저의 수를 파악하려고한다.
-- 2. "각 날짜마다" 동일에 접속한 유저의 수를 기록

--1) 날짜와 ID를 기준으로 병합
SELECT W.User_ID, W.date, A.User_ID, A.date
FROM Web_log as W
FULL JOIN App_log as A
ON W.date = A.date and W.User_ID = A.User_ID

--2) 중복값 고려
SELECT DISTINCT W.User_ID, W.date, A.User_ID, A.date
FROM Web_log as W
FULL JOIN App_log as A
ON W.date = A.date and W.User_ID = A.User_ID

--3) INNER JOIN
SELECT DISTINCT W.User_ID, W.date, A.User_ID, A.date
FROM Web_log as W
INNER JOIN App_log as A
ON W.date = A.date and W.User_ID = A.User_ID
ORDER BY W.date

SELECT 
DISTINCT W.date as Usage_Date, count(*) as User_Number
FROM Web_log as W
INNER JOIN App_log as A
ON W.date = A.date and W.User_ID = A.User_ID
GROUP BY W.date



-- **풀이**
SELECT 
W.date AS Usage_Date,
COUNT(DISTINCT W.User_ID) AS User_Number
FROM Web_log AS W
JOIN App_log AS A
	ON W.User_ID = A.User_ID
	AND W.date = A.date
GROUP BY W.date