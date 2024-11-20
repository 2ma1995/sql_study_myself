-- CHAR / VARCHAR
CHAR는 고정(고정숫자에 사용하기 좋음) ex) yes/no , zipcode
-- 예시
CHAR(3) -- => 4개의 글씨만쓸수있음
-- CHAR 열의 길이는 테이블을 생성할 때 선언한
-- 길이로 고정됩니다.
-- 길이는 0에서 255 사이의 값일 수 있습니다.
-- CHAR 값이 저장되면 지정된 길이까지 오른쪽에 공백이 채워집니다.
-- CHAR 값이 검색되면 PAD_CHAR_TO_FULL_LENGTH SQL 모드가 활성화되지 않은 경우 후행 공백이 제거됩니다. -이하공식홈페이지 발췌
--위 상황이 아니면 varchar사용 

--DECIMAL(총자리숫자,소숫점자리숫자) 
-- EX) DECIMAL(5,2) => 999.99
-- 숫자를 초과했을때, 에러가 나오거나 반올림을해서 숫자가 이상하게변할수있다.
-- float/double과 다른점은 숫자를 더 정확하게 나타낼수있다 but 많은공간차지
-- float/double은 decimal보다 용량이 작은대신 정밀도 손실이 발생할 가능성이 있다

-- DATE/TIME/DATETIME
-- 사용형식
 DATE'YYYY-MM-DD' TIME 'HH:MM:SS' DATETIME 'YYYY-MM-DD HH:MM:SS'
-- 예시
CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
-- current_date / current_time / current_timestamp
select current_date = select curdate() 같은 의미
select current_time = select curtime() 같은 의미
select current_timestamp = select now() 같은 의미
-- 예제
SELECT CURTIME(); 
SELECT CURDATE(); 
SELECT NOW(); 
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

-- DAY() / DAYOFWEEK() / dayofyear() / MONTHNAME(birthdate) / YEAR(birthdate)
-- DAY() 은 날짜
-- DAYOFWEEK()은 1~7까지 출력 1 = 일요일
-- dayofyear()은 그해의 날짜 출력 // 12/25일은 360으로 출력
-- MONTHNAME(birthdate) 월출력
-- YEAR(birthdate)은 연도출력

-- DATE_FORMAT(%y,%h,%s)
-- 예시
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

-- TIMESTAMP
-- 예시
CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
 
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
-- => 여기서 
insert into caption2 (text) VALUES ('i love me!'); --한후에
UPDATE caption2 SET text='i love live!!!' --입력하면 updated_at 에 업데이트 이력이 찍힘