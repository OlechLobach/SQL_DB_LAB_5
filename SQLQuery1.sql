USE Academy;
GO

-- Вставка даних до таблиці Faculties
INSERT INTO Faculties (Name) VALUES
('Computer Science'),
('Software Development'),
('Business Management'),
('Engineering');

-- Вставка даних до таблиці Departments
INSERT INTO Departments (Building, Financing, Name, FacultyId) VALUES
(1, 150000, 'Software Development', 2),
(2, 50000, 'Computer Science', 1),
(3, 30000, 'Business Management', 3),
(4, 200000, 'Engineering', 4);

-- Вставка даних до таблиці Groups
INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('D221', 2, 1),
('SD101', 5, 2),
('SD102', 5, 2),
('BM201', 3, 3),
('ENG301', 4, 4);

-- Вставка даних до таблиці Curators
INSERT INTO Curators (Name, Surname) VALUES
('John', 'Doe'),
('Jane', 'Smith');

-- Вставка даних до таблиці GroupsCurators
INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);

-- Вставка даних до таблиці Students
INSERT INTO Students (Name, Rating, Surname) VALUES
('Alice', 3, 'Johnson'),
('Bob', 4, 'Williams'),
('Charlie', 2, 'Brown'),
('David', 5, 'Jones'),
('Eve', 1, 'Davis');

-- Вставка даних до таблиці GroupsStudents
INSERT INTO GroupsStudents (GroupId, StudentId) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);

-- Вставка даних до таблиці Subjects
INSERT INTO Subjects (Name) VALUES
('Mathematics'),
('Programming'),
('Economics'),
('Physics');

-- Вставка даних до таблиці Teachers
INSERT INTO Teachers (IsProfessor, Name, Salary, Surname) VALUES
(1, 'Anthony', 3000, 'Davis'),
(0, 'Thomas', 1500, 'Gerada'),
(1, 'Joshua', 3500, 'Bell');

-- Вставка даних до таблиці Lectures
INSERT INTO Lectures (Date, SubjectId, TeacherId) VALUES
('2023-05-10', 1, 1),
('2023-05-11', 2, 2),
('2023-05-12', 3, 3),
('2023-05-13', 1, 1),
('2023-05-14', 2, 2);

-- Вставка даних до таблиці GroupsLectures
INSERT INTO GroupsLectures (GroupId, LectureId) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);
