CREATE TABLE test_employees (
emplooyee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(11, 2)
)

INSERT INTO test_employees (emplooyee_id, first_name, last_name, department, salary) VALUES
(1, 'John', 'Doe', 'Engineering', 75000.00),
(2, 'Jane', 'Smith', 'Marketing', 65000.00),
(3, 'Emily', 'Johnson', 'Sales', 55000.00),
(4, 'Michael', 'Brown', 'HR', 60000.00),
(5, 'Sarah', 'Davis', 'Finance', 70000.00)
;