-- 데이터베이스 만들기
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BootCamp_FB')
  BEGIN
    CREATE DATABASE BootCamp_FB
    END
GO

-- 데이터베이스 사용하기
USE BootCamp_FB
GO

-- 활동 테이블 만들기
CREATE TABLE Activity
   (
      Activity_ID int NOT NULL ,
	  User1_ID int NULL,
	  User2_ID int NULL,
	  Activity_type nvarchar(10),
	  Activity_date date
   )
;

-- 활동 데이터 입력하기
INSERT INTO dbo.Activity
VALUES 
(1, 1001, 1101, 'Accept','2021-1-07'),
(2, 1002, 1102, 'Accept','2021-1-15'),
(3, 1003, 1103, 'Accept','2021-1-15'),
(4, 1004, 1104, 'Declined','2021-2-21'),
(5, 1005, 1105, 'Declined','2021-2-15'),
(6, 1006, 1106, 'Postpone','2021-2-05'),
(7, 1007, 1107, 'Postpone','2021-2-07'),
(8, 1008, 1108, 'Postpone','2021-3-19'),
(9, 1009, 1109, 'Postpone','2021-2-15'),
(10, 1010, 1110, 'Postpone','2021-2-07'),
(11, 1011, 1111, 'Accept','2021-1-06'),
(12, 1012, 1112, 'Accept','2021-3-07'),
(13, 1013, 1113, 'Accept','2021-2-07'),
(14, 1014, 1114, 'Declined','2021-2-01'),
(15, 1015, 1115, 'Declined','2021-3-07'),
(16, 1016, 1116, 'Postpone','2021-2-07'),
(17, 1017, 1117, 'Postpone','2021-2-07'),
(18, 1018, 1118, 'Accept','2021-2-07'),
(19, 1019, 1119, 'Accept','2021-1-07'),
(20, 1020, 1120, 'Accept','2021-3-07')
;


-- ** 데이터 확인 **
SELECT * FROM Activity;

-- Q) 페이스북은 각 월별로 얼마나 사람들이 친구 수락을 하였는지 알고 싶어한다.
-- 각 월별로 친구 수락한 횟수 기록
