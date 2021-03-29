

SELECT * FROM `account` WHERE DepartmentID =3 AND PositionID =4 AND CreateDate < '2019-06-16 00:00:00';

SELECT DISTINCT(DepartmentID) FROM account;
SELECT * FROM `account` LIMIT 10; 

SELECT AccountID AS MaNhanVien, Email, FullName AS TenDayDu, CreateDate AS NgayVaoCongTy FROM `account` LIMIT 10;
 
SELECT * FROM `account` WHERE Username LIKE 'Kh%'; 

SELECT * FROM `account` WHERE FullName IS NULL;

SELECT * FROM `account` WHERE CreateDate > '2017-04-09 00:00:00';  