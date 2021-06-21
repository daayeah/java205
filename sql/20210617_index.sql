-- 2021.06.17

-- INDEX : 검색을 빠르게 하기 위한 객체
-- 물리적인 저장 공간과 생성 시간 필요
-- INDEX가 많으면 DML 작업이 많을 때 성능이 저하

-- emp01 테이블 복사 ->  로우 계속 복사
DROP TABLE emp01;

CREATE TABLE emp01
    AS
        SELECT
            *
        FROM
            emp;

INSERT INTO emp01
    SELECT
        *
    FROM
        emp01;

INSERT INTO emp01 ( empno, ename ) VALUES ( 7777, 'KING' );

SELECT
    *
FROM
    emp01
WHERE
    ename = 'KING';          

-- emp01 테이블의 ename 컬럼을 INDEX로 설정
CREATE INDEX idx_emp01_ename ON
    emp01 (
        ename
    ); 
    