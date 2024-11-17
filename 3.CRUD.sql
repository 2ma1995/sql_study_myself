-- SELECT => 데이터 열 선택

-- 모든 열 가져오기:
SELECT * FROM cats;
-- age 열만 가져오기:
SELECT age FROM cats;
-- 특정 열 여러 개 가져오기:
SELECT name, breed FROM cats;
-- WHERE => 조건
-- WHERE을 사용해 조건 지정하기:
SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE name ='Egg';
-- Alias
-- 'AS' 를 사용해 결과의 열의 이름변경 (테이블의 열  실제이름은 변경하지는 않음)
SELECT cat_id AS id, name FROM cats;

-- UPDATE => 데이터의 내용변경 UPDATE 
--         테이블이름            바꾸고자 하는 내용                       현재 있는 데이터                                
-- UPDATE <table_name> SET <column_name> = <column_content> WHERE <column_name> = <column_content> 
-- 예시
-- 얼룩(tabby) 고양이를 단모(shorthair)로 변경하세요:
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby'; 
-- !중요법칙 => 데이터 업데이트 또는 삭제시 테이블확인하기!
SELECT * FROM cats WHERE breed="Tabby"

-- DELETE 데이터 삭제
-- DELETE FROM <table_name> WHERE <column_name> = <column_content>;
-- 예시
-- 이름이 'Egg'인 모든 고양이 삭제하기:
DELETE FROM cats WHERE name='Egg';
-- cats 테이블의 모든 행 삭제하기:
DELETE FROM cats;