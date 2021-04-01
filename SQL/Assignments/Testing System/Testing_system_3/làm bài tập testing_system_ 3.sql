-- Làm bài tập testing_system_3

-- Câu 1: Đã thêm vào bản code

-- Câu 2: Lấy ra tất cả các phòng ban
SELECT * FROM testing_system_3.department;

-- Câu 3: Lấy ra Id của phòng ban Sale 
SELECT DepartmentID 
FROM department
WHERE DepartmentName = 'Sale'; 

-- Câu 4: Lấy ra thông tin account có fullname dài nhất 
SELECT FullName 
FROM Account 
WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM Account); 

-- Câu 5: Lấy ra thông tin `account` có full name dài nhất và thuộc phòng ban có id = 3

-- Câu 6: Lấy ra tên group đã tạo trước ngày 20/12/2019
SELECT GroupName
FROM `Group`
WHERE CreateDate < '2019-12-20';

-- Câu 7: : Lấy ra ID của question có >= 4 câu trả lời
SELECT * FROM testingsystem.answer;
SELECT a.QuestionID, count(a.QuestionID) AS SL FROM answer a
GROUP BY a.QuestionID
HAVING count(a.QuestionID) >=4;

-- Câu 8:  Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT `Code`
FROM Exam
WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- Câu 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Câu 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT(AccountID) 
FROM `Account` 
WHERE DepartmentID = 2
Group by DepartmentId; 

-- Câu 11:  Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
 SELECT * FROM `Account` WHERE FullName LIKE 'D%' AND FullName LIKE '%O'; 