-- count() 갯수를 셀때 사용
 SELECT COUNT(*) FROM books; --책 총갯수 출력
 
SELECT COUNT(author_lname) FROM books; -- 작가의 인원수
 
SELECT COUNT(DISTINCT author_lname) FROM books; -- 중복제거된 작가

-- group by 
-- 예시
SELECT author_lname, COUNT(*) 
FROM books
GROUP BY author_lname;
 
SELECT 
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;

-- min(), max() 기본
-- 최댓값
SELECT MAX(pages) FROM books;
-- 최솟값
SELECT MIN(author_lname) FROM books; 

SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
--  응용
SELECT MIN(released_year) FROM books;
 
SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);

-- 코드 다중열 GROUP BY
-- 예시
SELECT author_fname, author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname;
 
SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;
-- group by min,max사용예시
SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname; 
SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;
SELECT 
	author_lname, 
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release,
      MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;
 
SELECT 
	author_lname, 
        author_fname,
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;
-- sum() 전체 더한수
SELECT SUM(pages) FROM books;
--  예시
SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;

-- AVG() 평균값
SELECT AVG(pages) FROM books;
 
SELECT AVG(released_year) FROM books;
 
SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) FROM books
GROUP BY released_year;

