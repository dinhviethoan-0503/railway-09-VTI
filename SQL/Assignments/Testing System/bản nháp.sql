DROP DATABASE IF EXISTS Testing_system_3; 
CREATE DATABASE Testing_system_3;
USE Testing_system_3; 

DROP TABLE IF EXISTS `Department`;
CREATE TABLE Department(
DepartmentID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(30) NOT NULL UNIQUE KEY
); 

-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
PositionID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Email VARCHAR(50) NOT NULL UNIQUE KEY,
Username VARCHAR(50) NOT NULL UNIQUE KEY,
FullName NVARCHAR(50) NOT NULL,
DepartmentID MEDIUMINT UNSIGNED NOT NULL,
PositionID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
GroupID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
CreatorID MEDIUMINT UNSIGNED,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
GroupID MEDIUMINT UNSIGNED NOT NULL,
AccountID MEDIUMINT UNSIGNED NOT NULL,
JoinDate DATETIME DEFAULT NOW(),
PRIMARY KEY (GroupID,AccountID),
FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
CategoryID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Question;

CREATE TABLE `Question`(
QuestionID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100) NOT NULL,
CategoryID MEDIUMINT UNSIGNED NOT NULL,
TypeID MEDIUMINT UNSIGNED NOT NULL,
CreatorID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
); 

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100) NOT NULL,
QuestionID MEDIUMINT UNSIGNED NOT NULL,
isCorrect BIT DEFAULT 1,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
ExamID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
`Code` CHAR(10) NOT NULL,
Title NVARCHAR(50) NOT NULL,
CategoryID MEDIUMINT UNSIGNED NOT NULL,
Duration MEDIUMINT UNSIGNED NOT NULL,
CreatorID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID MEDIUMINT UNSIGNED NOT NULL,
QuestionID MEDIUMINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
PRIMARY KEY (ExamID,QuestionID)
);


INSERT INTO Position (PositionName)
VALUES				('Dev'),
					('Test'),
					('Scrum Master'),
					('PM'); 
                    
INSERT INTO Department (DepartmentName) 
VALUES					('Engineering'),
						('Product Management'),
						('Business Development'),
						('Legal'),
						('Support'),
						('Accounting'),
						('Services'),
						('Sale'),
						('Training'),
						('Human Resources'),
						('Research and Development'),
						('Marketing'); 
                        
INSERT INTO `Account` (Email,						 		Username ,				FullName,				DepartmentID,			PositionID,		CreateDate)
VALUES				  ('lgoodge0@msn.com', 			 		'lgoodge0', 			'Lyman Goodge', 		  	'11', 					'3', 		'2017-04-09'),
					  ('dgeertz1@bluehost.com', 	 		'dgeertz1',  			'Dal Geertz', 			  	'3', 					'2', 		'2020-09-13'),
                      ('qharwick2@kickstarter.com',  		'qharwick2', 			'Quentin Harwick', 		  	'9', 					'2', 		'2018-01-23'),
					  ('noriordan3@jugem.jp', 		 		'noriordan3', 			'Nomi O Riordan', 		  	'7', 					'2', 		'2018-11-30'),					
					  ('jmountain6y@macromedia.com', 		'jmountain6y', 	    	'Jacki Mountain', 		  	'12', 			    	'4', 		'2018-02-28'),
					  ('reden6z@toplist.cz', 				'reden6z', 				'Riobard Eden', 			'5', 					'2', 		'2017-01-08'),
					  ('cdaintith70@cafepress.com', 		'cdaintith70', 			'Catarina Daintith', 		'2', 					'4', 		'2019-07-15'),
					  ('pmattys71@exblog.jp', 				'pmattys71', 			'Paton Mattys', 			'10',    				'4', 		'2020-12-03'),
                      ('ewoollacott6u@lycos.com', 			'ewoollacott6u', 		'Ev Woollacott', 			 '11', 				    '1', 		'2018-12-02'),
					  ('lrosindill6t@npr.org', 				'lrosindill6t', 		'Lindy Rosindill', 			 '4' , 				    '3', 		'2019-11-23'),
					  ('ccant6h@flickr.com', 				'ccant6h', 				'Celia Cant', 				'10', 					'3', 		'2019-08-18'),
					  ('wcunde6i@uol.com.br', 				'wcunde6i', 			'Wiatt Cunde', 				'11', 					'1', 		'2019-03-09'),
					  ('paucourte6j@tmall.com', 			'paucourte6j', 			'Perrine Aucourte', 		'9', 					'4', 		'2017-10-10'),
					  ('gsabate6k@microsoft.com', 			'gsabate6k', 			'Gene Sabate', 				'10', 					'3', 		'2018-12-14'),
					  ('dmuzzini6l@ox.ac.uk', 				'dmuzzini6l', 			'Darcie Muzzini', 			'11', 					'1', 		'2021-01-06'),
					  ('gcasini6m@stumbleupon.com',          'gcasini6m', 			'Gussie Casini', 			'12', 					'3', 		'2020-07-27'),
					  ('dgryglewski6n@trellian.com', 		'dgryglewski6n', 		'Daryl Gryglewski',  		 '6', 					'3', 		'2017-05-25'),
                      ('sbaake6o@dot.gov', 					'sbaake6o', 			'Sim Baake', 				'2', 					'4', 		'2020-02-29'),
					  ('cpodmore6p@quantcast.com', 			'cpodmore6p', 			'Colas Podmore', 			'10', 					 '2', 		'2019-03-19'),
					  ('fbtham6q@webs.com', 				'fbtham6q', 			'Fania Btham', 				'9', 					'4', 		'2017-02-21'),
					  ('scothey6r@walmart.com', 			'scothey6r', 			'Siegfried Cothey', 		'3', 					'4', 		'2018-01-01'),
					  ('ajouaneton5t@army.mil', 			'ajouaneton5t',  		'Amby Jouaneton', 			'5', 					'1', 		'2020-02-24'),
					  ('tmesias5u@networkadvertising.org',   'tmesias5u', 			'Thayne Mesias', 			'10', 					'4', 		'2020-03-16'),
					  ('mclowsley5v@google.es', 			'mclowsley5v', 			'Maynard Clowsley', 		'11', 					'2', 		'2019-05-02'),
					  ('gdanielis5w@nymag.com', 			'gdanielis5w', 			'Gerhard Danielis', 		'1', 					'4', 		'2017-04-14'),
					  ('rlosbie5x@clickbank.net', 			'rlosbie5x', 			'Rikki Losbie', 			'7', 					'3', 		'2020-09-14'),
					  ('zgibb5y@cisco.com', 				'zgibb5y', 				'Zelda Gibb', 				'11', 					'1', 		'2019-07-06'),
					  ('abattram5z@nytimes.com', 			'abattram5z', 			'Ag Battram', 				'1', 					'1', 		'2017-11-21'),
					  ('ikrikorian60@earthlink.net', 		'ikrikorian60', 		'Israel Krikorian', 		'1', 					'4', 		'2019-04-10'),
					  ('wkeets61@simplemachines.org', 		'wkeets61', 			'Wendell Keets',  			'3', 					'1', 		'2019-09-29'),
					  ('awixey62@bloomberg.com', 			'awixey62', 			'Ainslie Wixey', 			'3', 					'1', 		'2019-02-16');

INSERT INTO `Group` (GroupName , 		CreatorID , 		CreateDate) 
VALUES 				(N'VTI Sale 01' , 		'2' ,			'2020-03-09'),
					(N'VTI Sale 02' , 		'3' ,			'2020-03-10'),
					(N'VTI Sale 03' , 		'4' ,			'2020-03-28'),
					(N'VTI Creator' , 		'6' ,			'2020-04-06'),
					(N'VTI Marketing 01' , 	'7' ,			'2020-04-07'),
					(N'Management' , 		'8' ,			'2020-04-08'),
					(N'Chat with love' ,    '9' ,			'2020-04-09'),
					(N'Vi Ti Ai' , 			'10' ,			'2020-04-10'),
                    (N'Development' , 		'1',			'2020-03-07'),
                    (N'Testing System' , 	'5',			'2019-03-05');
                    
INSERT INTO GroupAccount  (GroupID, 	AccountID, 		JoinDate)
VALUES					  ('7', 		 '119' , 		'2020-10-08'),
						  ('8', 		'119' , 		'2019-01-27'),
						 ('6', 			'190' , 		'2019-05-07'),
						 ('7', 			'240' , 		 '2020-06-29'),
						 ('5',			 '36' , 		 '2019-12-26'),
						('2', 			'135' , 		 '2019-10-10'),
						('10',			 '160' ,		  '2019-12-09'),
						('5', 			 '131' ,		  '2019-09-26'),
						('10',			 '85' , 		 '2020-07-26'),
						('10',			 '55' , 		 '2019-06-02'),
						('4', 			'123' , 		 '2018-06-07'),
						('6', 			'235' , 		 '2018-10-15'),
						('6', 			'140' , 		 '2020-12-11'),
						(6,   			'205' , 		 '2019-03-28'),
						('8', 			'40' ,  		'2019-10-06'),
						('9', 			'241' , 		 '2018-12-14'),
						('3', 			'218' , 		 '2019-12-12'),
						('8', 			'110' , 		 '2021-01-20'),
						('6', 			'218' , 		 '2019-07-17'),
						('4', 			'133' , 		 '2020-01-27'),
						('10',			 '133' ,		  '2019-11-20'),
						('7', 			'42' ,  		 '2019-04-06'),
						('10',			 '187' ,		 '2020-09-18'),
						('6', 			'4' ,   		 '2019-11-26'),
						('2',			'241' , 		 '2021-02-02'),
						('5', 			'145' , 		 '2020-03-20'),
						('4', 			'112' , 		 '2020-05-10'),
						('2', 			'182' , 		 '2018-06-14'),
						('7', 			'238' , 		'2020-04-23'),
						('10', 			'166' , 		'2020-12-22'),
						('8', 			'249' , 		'2019-07-31');
                        
INSERT INTO TypeQuestion (TypeName)			
VALUES     				 ('Essay'),		  
						 ('Multiple-Choice');
                         
INSERT INTO CategoryQuestion (CategoryName)
VALUES						 ('Java' ),
							 ('ASP.NET' ),
							 ('ADO.NET'),
							 ('SQL' ),
							 ('Postman'),
							 ('Ruby' ),
							 ('Python' ),
							 ('C++' ),
							 ('C Sharp'),
							 ('PHP' ); 


insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
6741 sPN', 7, 1, 19, '2019-06-24');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
5280 kX8', 10, 1, 152, '2019-06-20');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2803 yaS', 7, 2, 145, '2019-08-19');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
1329 kON', 3, 1, 16, '2021-02-11');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
0133 np5', 2, 2, 125, '2019-12-13');
insert into Question (Content, CategoryID, TypeID, CreatorID, CreateDate) values ('Question VTI
2812 uE1', 5, 2, 127, '2020-06-02');
					
					
					