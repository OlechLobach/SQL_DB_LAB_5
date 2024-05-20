USE Academy;
GO

INSERT INTO Faculties (Name) VALUES
('Computer Science'),
('Software Development'),
('Business Management'),
('Engineering');

INSERT INTO Departments (Building, Financing, Name, FacultyId) VALUES
(1, 150000, 'Software Development', 2),
(2, 50000, 'Computer Science', 1),
(3, 30000, 'Business Management', 3),
(4, 200000, 'Engineering', 4);

INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('D221', 2, 1),
('SD101', 5, 2),
('SD102', 5, 2),
('BM201', 3, 3),
('ENG301', 4, 4);

INSERT INTO Curators (Name, Surname) VALUES
('John', 'Doe'),
('Jane', 'Smith');

INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);

INSERT INTO Students (Name, Rating, Surname) VALUES
('Alice', 3, 'Johnson'),
('Bob', 4, 'Williams'),
('Charlie', 2, 'Brown'),
('David', 5, 'Jones'),
('Eve', 1, 'Davis');

INSERT INTO GroupsStudents (GroupId, StudentId) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);

INSERT INTO Subjects (Name) VALUES
('Mathematics'),
('Programming'),
('Economics'),
('Physics');

INSERT INTO Teachers (IsProfessor, Name, Salary, Surname) VALUES
(1, 'Anthony', 3000, 'Davis'),
(0, 'Thomas', 1500, 'Gerada'),
(1, 'Joshua', 3500, 'Bell');

INSERT INTO Lectures (Date, SubjectId, TeacherId) VALUES
('2023-05-10', 1, 1),
('2023-05-11', 2, 2),
('2023-05-12', 3, 3),
('2023-05-13', 1, 1),
('2023-05-14', 2, 2);

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5);