-- 외래키 FOREIGN KEY
FOREIGN KEY(현재테이블에있는 컬럼명) REFERENCES <연결하고자하는 테이블>(연결하고자하는 컬럼명)
-- 예시 // 
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
); -- 현재 orders테이블에있는customer_id 를 customer테이블에 있는 id에 연결

-- 크로스조인
select * from <table_name>,<table_name>; -- 두개의 테이블의 하나의 테이블로 합쳐져서 출력(이상하게 값이 출력됌)
-- 예시
select * from customers,orders;

-- inner join
INNER JOIN 연결하고자하는 테이블명 ON 연결하고자하는 테이블명.컬럼명 = 현재 테이블명.컬럼명  
-- 예시
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;
 
SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON orders.customer_id = customers.id;
 
-- 순서가 반대로되도 상관없음 (어떤데이터가 먼저 출력될지 선택사항)
SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;

-- inner join / group by
-- 예시
SELECT 
    first_name, last_name, SUM(amount) AS total
FROM customers
JOIN orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
ORDER BY total;

-- left join = select everything from A along with any matching records in B
-- 예시
SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders 
ON orders.customer_id = customers.id;
 
SELECT 
    order_date, amount, first_name, last_name
FROM
    orders
        LEFT JOIN
    customers ON orders.customer_id = customers.id;

    -- IFNULL();
    --IFNULL(확인하고자하는 컬럼명,null일 경우원하는값 
    -- 예시
SELECT first_name, last_name, 
    IFNULL(SUM(amount), 0) AS money_spent
FROM customers
LEFT JOIN
    orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name;

-- right join // 오른쪽기준으로 전체값이 나오고 없는값은 null이 들어감
-- 예시
SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id;

-- cascade // foreign key 로 연결되어있는 연결된데이터 삭제시 사용
-- 예시
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
);