-- 2021.06.17

-- SEQUENCE : 숫자를 생성하는 객체
-- 설정을 통해 일련번호 생성 -> 기본키가 대리키인 경우엔 입력되는 값으로 사용
CREATE SEQUENCE pi_idx_pk;

SELECT
    pi_idx_pk.CURRVAL
FROM
    dual;
    
SELECT
    pi_idx_pk.NEXTVAL
FROM
    dual;

-- dept 테이블 복사 -> deptno에 들어갈 데이터 시퀀스 생성 -> INSERT 테스트
DROP TABLE dept03;

CREATE TABLE dept03
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            1 = 0;
            
SELECT
    *
FROM
    dept03;
    
-- SEQUENCE 생성
CREATE SEQUENCE dept_deptno_seq START WITH 10 INCREMENT BY 10;

-- dept03에 저장
INSERT INTO dept03 VALUES ( dept_deptno_seq.NEXTVAL, 'DEV', 'SEOUL' );

SELECT
    *
FROM
    dept03;