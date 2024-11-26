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
-- or replace
-- 예시 
create or replace view ordered_series as select * from series order by released_year desc;
-- alter view 로도 수정가능
-- 예시
alter view ordered_series as select * from series order by released_year;
-- 뷰테이블 삭제시 drop view
-- 예시
drop view ordered_series;
