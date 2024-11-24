-- unique
-- 하나의 데이터 컬럼에 주어지는 고유의 값(중복이 될수없음)
-- 예시
CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455'); 
-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
-- check
-- 데이터테이블을 만들때 조건을 줄때 쓰는 함수
-- 예시
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);
-- 위의 코드는 age의 데이터값이 0보다 큰값만 넣을수있다 
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
)
-- 위의 코드는 word의데이터값이 반대로쓰여도 같은 값이여야한다 예시)racecar,mom

-- constraint
-- 제약조건을 사용해서 입력하는 자료에 대해 제약을 줌(제약조건 : not null,unique,primary key, foreign key, check)
-- 예시
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);
-- 다중 열 제약조건
-- 예시1)
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
-- name과 address 의 값이 들어간후 같은 데이터 가 들어갈수 없는 코드
-- 예시2)
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);
-- purchase_price가 sale_price보다 큰값을 넣을수 없는 제약
-- alter
-- 데이터테이블이 생성되고, 추가/삭제하고싶은 데이터를 추가/삭제할수있는 문
-- 예시
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1; 

-- alter table:열삭제 (drop)
-- 예시
alter table companies drop table_name drop COLUMN column_name
ALTER TABLE companies DROP COLUMN phone;

-- RENAME //테이블 명바꿈
RENAME TABLE <기존table_name> to <원하는table_name>
-- 예시 
ALTER TABLE companies
    RENAME COLUMN name TO company_name; -- name이 기존

-- alter table 열 수정
ALTER TABLE <TABLE_NAME>
MODIFY <column_name> 수정하고싶은 값 입력 
-- 예시
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

-- 간략하게도 수정가능
ALTER TABLE <TABLE_NAME> CHANGE <기존 column_name> <원하는 column_name> 타입
-- 예시
ALTER TABLE companies CHANGE address address_info varchar(100)

-- alter table 제약조건
-- 제약조건 추가
ALTER TABLE <table_name>
ADD CONSTRAINT <column_name> CHECK (조건문);
-- 예시
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);
-- 제약조건 삭제
ALTER TABLE <table_name> DROP CONSTRAINT <column_name>
-- 예시
ALTER TABLE houses DROP CONSTRAINT positive_pprice;
