USE Academy;
GO

-- Запит 1: Номери корпусів з сумарним фондом фінансування кафедр понад 100 000
SELECT Building
FROM Departments
GROUP BY Building
HAVING SUM(Financing) > 100000;
GO

-- Запит 2: Назви груп 5-го курсу кафедри “Software Development”, які мають понад 10 пар на перший тиждень
SELECT g.Name
FROM Groups g
JOIN Departments d ON g.DepartmentId = d.Id
JOIN GroupsLectures gl ON g.Id = gl.GroupId
JOIN Lectures l ON gl.LectureId = l.Id
WHERE g.Year = 5 AND d.Name = 'Software Development'
GROUP BY g.Name
HAVING COUNT(l.Id) > 10;
GO

-- Запит 3: Назви груп з рейтингом більшим, ніж у групи “D221”
DECLARE @ratingD221 FLOAT;

SELECT @ratingD221 = AVG(s.Rating)
FROM Groups g
JOIN GroupsStudents gs ON g.Id = gs.GroupId
JOIN Students s ON gs.StudentId = s.Id
WHERE g.Name = 'D221';

SELECT g.Name
FROM Groups g
JOIN GroupsStudents gs ON g.Id = gs.GroupId
JOIN Students s ON gs.StudentId = s.Id
GROUP BY g.Name
HAVING AVG(s.Rating) > @ratingD221;
GO

-- Запит 4: Прізвища та імена викладачів зі ставкою вищою за середню ставку професорів
SELECT Surname, Name
FROM Teachers
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Teachers
    WHERE IsProfessor = 1
);
GO

-- Запит 5: Назви груп, які мають більше одного куратора
SELECT g.Name
FROM Groups g
JOIN GroupsCurators gc ON g.Id = gc.GroupId
GROUP BY g.Name
HAVING COUNT(gc.CuratorId) > 1;
GO

-- Запит 6: Назви груп з рейтингом меншим, ніж мінімальний рейтинг груп 5-го курсу
SELECT g.Name
FROM Groups g
JOIN GroupsStudents gs ON g.Id = gs.GroupId
JOIN Students s ON gs.StudentId = s.Id
GROUP BY g.Name
HAVING AVG(s.Rating) < (
    SELECT MIN(AVG(s.Rating))
    FROM Groups g
    JOIN GroupsStudents gs ON g.Id = gs.GroupId
    JOIN Students s ON gs.StudentId = s.Id
    WHERE g.Year = 5
    GROUP BY g.Name
);
GO

-- Запит 7: Назви факультетів з сумарним фондом фінансування кафедр більшим, ніж у факультету “Computer Science”
DECLARE @computerScienceFinancing MONEY;

SELECT @computerScienceFinancing = SUM(d.Financing)
FROM Faculties f
JOIN Departments d ON f.Id = d.FacultyId
WHERE f.Name = 'Computer Science';

SELECT f.Name
FROM Faculties f
JOIN Departments d ON f.Id = d.FacultyId
GROUP BY f.Name
HAVING SUM(d.Financing) > @computerScienceFinancing;
GO

-- Запит 8: Назви дисциплін та повні імена викладачів, які читають найбільшу кількість лекцій
SELECT s.Name AS SubjectName, t.Name + ' ' + t.Surname AS TeacherName
FROM Lectures l
JOIN Subjects s ON l.SubjectId = s.Id
JOIN Teachers t ON l.TeacherId = t.Id
GROUP BY s.Name, t.Name, t.Surname
HAVING COUNT(l.Id) = (
    SELECT MAX(lectureCount)
    FROM (
        SELECT COUNT(l.Id) AS lectureCount
        FROM Lectures l
        GROUP BY l.SubjectId, l.TeacherId
    ) AS subquery
);
GO

-- Запит 9: Назва дисципліни, за якою читається найменше лекцій
SELECT TOP 1 s.Name
FROM Lectures l
JOIN Subjects s ON l.SubjectId = s.Id
GROUP BY s.Name
ORDER BY COUNT(l.Id) ASC;
GO
 
-- Запит 10: Кількість студентів та дисциплін на кафедрі “Software Development”
SELECT
    (SELECT COUNT(gs.StudentId)
     FROM Groups g
     JOIN GroupsStudents gs ON g.Id = gs.GroupId
     JOIN Departments d ON g.DepartmentId = d.Id
     WHERE d.Name = 'Software Development') AS StudentCount,
    (SELECT COUNT(DISTINCT l.SubjectId)
     FROM Groups g
     JOIN GroupsLectures gl ON g.Id = gl.GroupId
     JOIN Lectures l ON gl.LectureId = l.Id
     JOIN Departments d ON g.DepartmentId = d.Id
     WHERE d.Name = 'Software Development') AS SubjectCount;