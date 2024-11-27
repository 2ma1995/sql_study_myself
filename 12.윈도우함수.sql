-- 윈도우 함수는 데이터베이스 쿼리에서 집계 함수(Aggregate Function)의 역할과
-- 결과를 그룹별로 나누지 않고도 원본 데이터와 함께 계산된 값을 반환하는 함수
-- OVER() / GROUP BY는 그룹화된 데이터만 반환하지만, 
-- 윈도우 함수는 원본 데이터 행과 함께 계산된 값을 반환합니다.
-- <윈도우 함수> OVER ()
-- 예시
SELECT emp_no,department,
department,
salary,
 avg(salary) over() as num, 
 from employees ;

-- over(PARTITION BY)
-- 각 그룹별 윈도우함수를 나눠줌
-- 예시
SELECT 
    emp_no, 
    department, 
    salary, 
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    COUNT(*) OVER(PARTITION BY department) as dept_count
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;

-- over(PARTITION BY ORDER BY ASC/DESC) 파티션으로 나눈걸 집계해주는 함수
-- 예시
SELECT
    emp_no,
    department,
    salary,
    SUM(salary) OVER(partition by department order by salary desc) AS rolling_dept_salary,
    SUM(salary) OVER(partition by department) AS total_dept_salary
FROM employees;
-- RANK() / 랭크를 주는 함수 
-- 예시
SELECT
    emp_no,
    department,
    salary,
    RANK() OVER(partition by department order by salary desc) AS dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees order by department;
-- DENSE_RANK 와 ROW_NUMBER()
-- ROW_NUMBER() 파티션 내에서 각 행에 고유한 순서를 부여. 
-- 중복된 값이 있어도 순서를 고유하게 지정.
-- DENSE_RANK() 값이 같으면 동일 순위를 부여하지만, 다음 순위를 건너뛰지 않음.
-- 예시
SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

-- NTILE() 데이터를 n개의 동일한 크기의 그룹으로 나눔.
-- 예시
SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- FIRST_VALUE() / LAST_VALUE() 파티션 내 첫 번째 또는 마지막 값을 반환.
-- 예시
SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;

-- LAG() / 현재 행의 이전 행 값을 가져옴.
-- LEAD() / 현재 행의 다음 행 값을 가져옴.
-- 예시
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees; 