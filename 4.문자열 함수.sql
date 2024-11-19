-- 파일(.sql)을 열때
SOURCE file_name.sql
-- CONCAT()
-- 각 문자열을 연결할때
SELECT CONCAT('pi', 'ckle');
-- 데이터 연결
SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;
--  CONCAT_WS('원하는 문자열','<data_column>','<data_column>') 여기서 데이터컬럼은 내가 선택할수있음.
SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;

-- SUBSTRING(<data_column>,시작하는문자,끝나는문자)
SELECT SUBSTRING('Hello World', 1, 4); => Hell 
SELECT SUBSTRING('Hello World', 7); => World
SELECT SUBSTRING('Hello World', -3); 
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
--  SUBSTR로도 사용가능
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

--문자열 함수 조합
SELECT CONCAT(SUBSTRING(<data_column>,시작하는문자순서,끝나는문자순서),'원하는문자') AS '<data_column_name>' FROM <data_table>
-- 예시
SELECT CONCAT
    (SUBSTRING(title, 1, 10),'...') AS 'short title'
FROM books; 

-- REPLACE()
-- REPLACE(작업할 컬럼,기존 데이터인자,변경하고자하는 데이터인자) 
-- 내용은 직접적으로 변경이 되지않음, 단일 출력값만 출력해서 보여주는역할
-- 예시
SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('HellO World', 'o', '*');
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE(title, 'e ', '3') FROM books;
SELECT REPLACE(title, ' ', '-') FROM books;

-- REVERSE()
-- 예시
SELECT REVERSE('Hello World');
SELECT REVERSE(author_fname) FROM books;
-- 문자함수연결 예시
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- CHAR_LENGTH();
-- CHAR_LENGTH(<data_column>)
-- 예시
SELECT CHAR_LENGTH('Hello World'); =>11
 SELECT CHAR_LENGTH(title) as length, title FROM books;
 SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

--  UPPER() / LOWER()
--  UCASE() / LCASE()로도 사용가능
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- 기타 문자열 함수
-- INSERT(<data_column>,들어가고싶은(INPUT) 문자열 순서,시작하는 문자열 순서,'원하는 문자')
SELECT INSERT('Hello Bobby', 6, 0, 'There');
--LEFT(<data_column>,원하는 문자갯수) / RIGHT도 같음
 SELECT LEFT('omghahalol!', 3); => omg -- LEFT('omghahalol!', 3)
 SELECT RIGHT('omghahalol!', 4);
--REPEAT() 반복
 SELECT REPEAT('ha', 4);
--TRIM() => 빈공간 제거
 SELECT TRIM('  pickle  ');

-- DISTINCT
-- 중복내용하나로출력
-- DISTINCT <data_column>, <data_column>, <data_column> FROM <data_table>; 
-- 예시
SELECT DISTINCT author_lname FROM books;
SELECT author_fname, author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

-- ORDER BY = 정렬 (DESC)// DESC는 반대로정렬 
-- 같이 사용 가능 
-- 예시
SELECT * FROM books
ORDER BY author_lname, released_year;

-- 순서대로 정렬
SELECT * FROM books
ORDER BY author_lname;
-- 반대로정렬
SELECT * FROM books
ORDER BY author_lname DESC;
--  released_year기준으로 정렬
SELECT * FROM books
ORDER BY released_year; 

-- LIMIT 0~100// 원하는 데이터의 갯수를 선택해서 출력
-- LIMIT 시작하고싶은 데이터순서, 출력하고싶은 데이터 갯수 // 데이터는 0번째부터 시작 주의 
-- 예시
SELECT * FROM books
ORDER BY released_year LIMIT 5; 

-- LIKE //WHERE문의 정확성을 높여주는 함수 
-- %는 전체 문자 캐릭터, _는 문자의 갯수
WHERE <data_column> LIKE '%a%'
WHERE <data_column> LIKE '____' => 4글자

-- 예시
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE '%da%';
 
SELECT title, author_fname, author_lname, pages 
FROM books
WHERE title LIKE '%:%';
 
SELECT * FROM books
WHERE author_fname LIKE '____';
 
SELECT * FROM books
WHERE author_fname LIKE '_a_';

-- To select books with '%' in their title:
SELECT * FROM books
WHERE title LIKE '%\%%'; => \% 이러한 방식으로 활용
 
-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';
