-- cats 테이블 다시 생성후, 데이터삽입
CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);
-- 고양이 삽입:
INSERT INTO cats (name, age) 
VALUES ('Blue Steele', 5);
-- 추가로 삽입하기:
INSERT INTO cats (name, age) 
VALUES ('Jenkins', 7);
-- 테이블의 모든 행 표시
SELECT * FROM <table-name>;
-- 데이터 삽입 (INSERT)
-- 단일 삽입(name과 age의 순서 변경)
INSERT INTO cats (age, name) 
VALUES (2, 'Beth');
-- 다중 삽입
INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5), 
  ('Turkey', 1), 
  ('Potato Face', 15);
-- NOT NULL (데이터를 꼭 삽입해야됌)
CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);
-- 테이블의 기본값 설정(DEFAULT) => 데이터를 입력안해도 자동으로 데이터값 입력.
-- DEFAULT 이름이 지정된 테이블을 정의하기:
-- 예시
CREATE TABLE cats3  (    
    name VARCHAR(20) DEFAULT 'no name provided',    
    age INT DEFAULT 99  
);
-- 다른방법 *주의 이름이나 중복의 우려가있는 컬럼은 PRIMARY KEY 사용X
CREATE TABLE cats3 (
    name VARCHAR(100) DEFAULT 'no name provided',
    age INT DEFAULT 99,
    PRIMARY KEY (name)
);
-- 테이블 상세내용 확인:DESC cats3;
-- 예시
-- 이름 없는 고양이 삽입: 
INSERT INTO cats3(age) VALUES(13);
-- 또는 이름 없는, 나이 없는 고양이:
INSERT INTO cats3() VALUES();
-- NOT NULL과 DEFAULT의 조합:
CREATE TABLE cats4  (
        name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
        age INT NOT NULL DEFAULT 99);
-- AUTO_INCREMENT
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);
