CREATE DATABASE test;

CREATE TABLE IF NOT EXISTS students (
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  birthday DATE CHECK (birthday <= CURRENT_DATE),
  phone_number CHAR(13) UNIQUE,
  group_name VARCHAR(10) NOT NULL,
  avg_mark NUMERIC(3, 1) NOT NULL,
  gender VARCHAR(6),
  entered_at DATE CHECK (birthday <= entered_at),
  department VARCHAR(64) NOT NULL
)

INSERT INTO students(
  first_name, 
  last_name, 
  birthday, 
  phone_number, 
  group_name, 
  avg_mark, 
  gender, 
  entered_at, 
  department
)
VALUES  ('Andey', 'Gerbion', '1994-12-09', '+30999999989', 'M631-m', 88, 'male', '2012-09-01', 'Helicopter and aircraft building'),
        ('Andrey', 'Nikipanchyck', '1992-03-08', '+30999999998', 'M633-m', 89, 'male', '2012-09-01', 'Helicopter and aircraft building'),
        ('Galyna', 'Reshetnyak', '1993-02-14', '+30999999997', 'M633-m', 85, 'female', '2012-09-01', 'Helicopter and aircraft building'),
        ('Nika', 'Smirnova', '1997-10-03', '+30999999996', 'M662-b', 65, 'female', '2015-09-01', 'Aircraft maintenance'),
        ('Daryna', 'Badalova', '1994-12-04', '+30999999995', 'M662-m', 99, 'female', '2015-09-01', 'Aircraft maintenance'),
        ('Evgeniy', 'Diachenko', '1993-08-02', '+30999999994', 'M663-m', 62, 'male', '2015-09-01', 'Helicopter and aircraft building'),
        ('Oleg', 'Benza', '1990-04-02', '+30999999993', 'M661-m', 100, 'male', '2014-09-01', 'Aircraft certification'),
        ('Iryna', 'Sova', '1991-05-26', '+30999999992', 'M661-m', 100, 'female', '2014-09-01', 'Aircraft certification'),
        ('Dmytro', 'Yakovlev', '1994-05-19', '+30999999991', 'M661-m', 70, 'male', '2014-09-01', 'Aircraft certification'),
        ('Valya', 'Abrol', '1992-12-30', '+30999999990', 'M661-m', 89, 'female', '2013-09-01', 'Aircraft certification'),
        ('Oleg', 'Yanovsky', '1997-10-30', '+30509999981', 'M261-b', 67, 'male', '2017-09-01', 'Helicopter and aircraft building'),
        ('Valya', 'Buh', '1999-03-28', '+30959999990', 'M161-b', 92, 'female', '2019-09-01', 'Aircraft certification');


SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;

-- Отримати інформацію про студентів (ім'я+прізвище, дата народження) у порядку від найстаршого до наймолодшого.

SELECT first_name || ' ' || last_name AS "Fullname"
FROM students
ORDER BY birthday;

-- Отримати список шифрів груп, що не повторюються.

SELECT DISTINCT group_name
FROM students;

-- Отримати рейтинговий список студентів (ім'я (*або ініціал)+прізвище, середній бал): спочатку студентів із найвищим середнім балом, наприкінці з найменшим.

SELECT first_name || ' ' || last_name AS "Fullname",
        avg_mark AS "Marks"
FROM students
ORDER BY avg_mark DESC;

-- Отримати другу сторінку списку студентів під час перегляду по 6 студентів на сторінці.

SELECT *
FROM students
LIMIT 6 OFFSET 6;


-- Отримати список 3-х найуспішніших студентів (ім'я, прізвище, середній бал, група).

SELECT first_name || ' ' || last_name AS "Fullname",
        avg_mark AS "Marks",
        group_name AS "Group"
FROM students
ORDER BY avg_mark DESC
LIMIT 3;

-- * Отримати максимальний середній бал серед усіх студентів.

SELECT avg (avg_mark) AS "Avg mark of all students" 
FROM students;

-- * Отримати інфо про студентів (ініціал+прізвище, номер телефону), де номер телефону буде частково прихований та представлений у форматі: +38012******* (тобто видно код оператора).

SELECT 
SUBSTRING(first_name, 1, 1) || '.' || last_name AS "Student",
phone_number
FROM students;


