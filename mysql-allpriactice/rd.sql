DROP DATABASE a_relational_database;

CREATE DATABASE a_relational_database;

USE a_relational_database;



-- Today Lesson 50%
-- 1:1 
-- emp_id INT,
-- FOREIGN KEY (emp_id) REFERENCES employees(id)


-- last update 15/6 7:45
CREATE TABLE employees (
  id INT AUTO_INCREMENT NOT NULL,
  is_deleted TINYINT DEFAULT 0,

  first_name VARCHAR(255),

  PRIMARY KEY (id)
);
-- last update 20/6 7:45
CREATE TABLE salaries (
  id INT AUTO_INCREMENT NOT NULL,
  is_deleted TINYINT DEFAULT 0,
  amount INT,
  emp_id INT,
  
  PRIMARY KEY (id),
  FOREIGN KEY (emp_id) REFERENCES employees(id)
);

INSERT INTO employees (first_name) VALUES ('John');
INSERT INTO employees (first_name) VALUES ('Ibrahim');
INSERT INTO employees (first_name) VALUES ('BayanS');

INSERT INTO salaries (amount) VALUES (500);
INSERT INTO salaries (amount,emp_id) VALUES (500,2);
INSERT INTO salaries (amount,emp_id) VALUES (500,2);
-- INSERT INTO salaries (amount,emp_id) VALUES (500,4);

-- SELECT * FROM salaries WHERE emp_id=2;

-- //////////////////////////////////////////////////////


CREATE TABLE teacher (
  id INT AUTO_INCREMENT NOT NULL,
  is_deleted TINYINT DEFAULT 0,

  first_name VARCHAR(255),

  PRIMARY KEY (id)
);
CREATE TABLE lecture (
  id INT AUTO_INCREMENT NOT NULL,
  is_deleted TINYINT DEFAULT 0,

  subject VARCHAR(255),
  teacher_id INT,

  PRIMARY KEY (id),
  FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);


INSERT INTO teacher (first_name) VALUES ('Jouza');
INSERT INTO teacher (first_name) VALUES ('Ayman');
INSERT INTO teacher (first_name) VALUES ('Momo');

INSERT INTO lecture (subject, teacher_id) VALUES ('MySQL', 1);
INSERT INTO lecture (subject, teacher_id) VALUES ('Node', 2);
INSERT INTO lecture (subject, teacher_id) VALUES ('Reach',1);

INSERT INTO lecture (subject) VALUES ('What is sban5h?');

-- /////////////////////////

CREATE TABLE role (
    role_id INT AUTO_INCREMENT NOT NULL,
    role VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE permission (
    permission_id INT AUTO_INCREMENT NOT NULL,
    permission VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (permission_id)
);

-- join table
CREATE TABLE role_permission (
    id INT AUTO_INCREMENT NOT NULL,

    role INT,
    permission INT,
    -- both of the primary keys are set as foreign keys
    PRIMARY KEY (id),

    FOREIGN KEY (role) REFERENCES role(role_id),
    FOREIGN KEY (permission) REFERENCES permission(permission_id)
);  



INSERT INTO permission (permission) VALUES ('CREATE');
INSERT INTO permission (permission) VALUES ('READ');
INSERT INTO permission (permission) VALUES ('UPDATE');
INSERT INTO permission (permission) VALUES ('DELETE');

INSERT INTO role (role) VALUES ('Admin');
INSERT INTO role (role) VALUES ('Normal_User');

INSERT INTO role_permission (role,permission) VALUES (1,1);
INSERT INTO role_permission (role,permission) VALUES (1,4);
INSERT INTO role_permission (role,permission) VALUES (2,2);







-- JOIN Tables
-- SELECT columns FROM table1
-- INNER JOIN table2 ON table1.column_name = table2.column_name;

SELECT first_name, subject FROM teacher 
INNER JOIN lecture 
ON teacher.id=lecture.teacher_id;

SELECT first_name, subject FROM teacher 
LEFT JOIN lecture 
ON teacher.id=lecture.teacher_id;

SELECT first_name, subject FROM teacher 
RIGHT JOIN lecture 
ON teacher.id=lecture.teacher_id;


SELECT * FROM lecture
LEFT JOIN  teacher
ON teacher.id=lecture.teacher_id;


SELECT * FROM teacher;
SELECT * FROM lecture;
USE a_relational_database




