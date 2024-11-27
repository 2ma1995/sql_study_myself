-- view테이블
-- 출력한 결과를 가상의 테이블로 만드는 함수
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    reviews
        JOIN
    series ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;
    -- 위와같은 결과를 출력 후 뷰 테이블로 만듬
    CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
 
-- 가상의 테이블 확인
SELECT * FROM full_reviews; 
-- 가상의 테이블 데이터 삽입 및 삭제
create view ordered_series as
select * from series order by released_year;
-- 데이터 삽입
insert into ordered_series(title, released_year, genre) values ('The Great',2020,'Comedy');
-- 데이터 삭제
delete from ordered_series where title = 'The Great'
-- 뷰테이블 수정시 
-- create or replace
-- 예시 
create or replace view ordered_series as select * from series order by released_year desc;
-- alter view 로도 수정가능
-- 예시
alter view ordered_series as select * from series order by released_year;
-- 뷰테이블 삭제시 drop view
-- 예시
drop view ordered_series;

-- HAVING 절(그룹지은후 그룹에서 2개이상의 데이터가있는 데이터를 출력할때 사용)
-- 예시
SELECT 
    title, 
    AVG(rating),
    COUNT(rating) AS review_count
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;

--WITH ROLLUP 각 전체행의 평균값을 마지막 열에 출력
-- 예시
SELECT title, AVG(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;
 
SELECT title, COUNT(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;
--  아래와 같은 코드는 각 그룹의 평균값을 표기해준후, 마지막에 전체평균값을 출력해줌
SELECT first_name, released_year, genre, AVG(rating)
FROM full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP

-- sql모드 설정
-- To View Modes:
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;
 
-- To Set Them:
SET GLOBAL sql_mode = 'modes';
SET SESSION sql_mode = 'modes';
