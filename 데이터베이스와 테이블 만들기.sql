-- 존재하는 데이터베이스를 나열하려면:
SHOW DATABASES;
-- 데이터베이스를 생성하는 일반적인 명령어
CREATE DATABASE <database_name>;
    -- 예시: CREATE DATABASE soap_store;
-- 데이터베이스 삭제하기:
DROP DATABASE <database-name>;
-- 데이터베이스 사용:
USE <database-name>;
-- 기본데이터형
-- INT => 정수, VARCHAR => 문자열
-- 테이블 생성하기:
CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);
-- 확인방법
SHOW tables;
SHOW COLUMNS FROM <table-name>;
DESC <table-name>;
-- 테이블 제거하기:
DROP TABLE <table-name>;
-- 예시 DROP TABLE cats;