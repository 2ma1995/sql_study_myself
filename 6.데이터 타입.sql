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
 \