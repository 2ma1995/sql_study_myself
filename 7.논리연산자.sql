-- 논리연사자같은 경우 where 조건절에 자주쓰임
-- != 같지않은것
-- 예시
SELECT * FROM books
WHERE released_year != 2017;
-- NOT LIKE 같지않은것
SELECT <column_name> FROM <table_name> WHERE <column_name> NOT LIKE '조건' 
-- 예시
SELECT * FROM books
WHERE title NOT LIKE '%e%';
-- > / < / >= / <= //아는내용이니까 생략
-- 예시
SELECT * FROM books
WHERE pages < 200;
SELECT * FROM books
WHERE released_year < 2000;
SELECT * FROM books
WHERE released_year <= 1985;

-- AND 연산자
-- 예시
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';
 
SELECT title, pages FROM books
where CHAR_LENGTH(title)>30
AND pages > 500;

-- or연산자 둘중 하나만 맞아도 두개의 전체값을 가져옴
SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;

-- BETWEEN연산자
 SELECT <column_name> FROM <table_name>
 WHERE <column_name> BETWEEN <column_content> AND <column_content>
--  예시 
SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;

SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;
-- 날짜비교
SELECT * FROM people WHERE birthdate < '2005-01-01'; --정확하지안음 사용은 가능
SELECT * FROM people WHERE  YEAR(birthdate) < 2005; -- 더 정확
SELECT * FROM people WHERE  HOUR(birthdate) > 12; -- 시간은 이러한방식으로 작성
-- 날짜비교에서 BETWEEN문
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2014; -- 연도 비교

SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:32:00' AS TIME) 
AND CAST('16:42:00' AS TIME); -- 시간 비교 cCAST()를 쓰는 이유는 정확도때문에 사용 //공식문서에 나와있음
-- 만약 시간만 비교할경우
SELECT * FROM people WHERE HOUR(birthtime) 
BETWEEN 12 AND 16;

-- IN
SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';
 --위구문을 IN을사용하면 아래처럼변형가능 
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
-- % 연산자 // 많이 쓰이지는않음
-- 예시
SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 = 1; -- released_year % 2 != 0 이렇게도사용가능
--  released_year 짝수가 출력이 안된다.

-- case문
select <column_name>
case
    when <column_name> between num and num then '사용할문구 나 숫자'
    else 원하는값
end 
from <table_name>
-- 예시
select title,books.stock_quantity,
    case                                                  --이렇게 바꿔사용할수있다
        when stock_quantity between 0 and 40 then '*' -- when stock_quantity <= 40 then '*'
        when stock_quantity between 41 and 70  then '**' -- when stock_quantity <= 70 then '**'
        when stock_quantity between 71 and 100  then '***' -- when stock_quantity <= 100 then '***'
        when stock_quantity between 101 and 150  then '****' -- when stock_quantity <= 150 then '****'
        else '*****'
    end as stock
    from books

-- is null
-- where 조건문 뒤에 오는 null 값 출력 // is not null은 null값이 아닌것 출력
select * from <table_name> where <column_name> is null -- 또는 not null
-- delete  from books  where  books.author_lname is null 이런식으로도 사용가능

