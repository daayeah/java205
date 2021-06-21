-- 2021.06.16

-- 테스트 테이블 생성
CREATE TABLE dept01
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            1 = 0;
            
-- 데이터 입력 : 행단위 입력
-- INSERT INTO 테이블명 (컬럼명, ...) VALUES (데이터, 데이터, ...)
-- 입력하고자 하는 컬럼과 입력 데이터의 개수 일치
-- 컬럼의 도메인과 입력 데이터의 타입 일치
INSERT INTO dept01( deptno, dname, loc ) VALUES ( 10, '개발팀', '서울' );
INSERT INTO dept01 ( deptno, dname ) VALUES ( 10, '개발팀', '서울' ); --컬럼명과 데이터의 개수 불일치
INSERT INTO dept01( deptno, dname, loc ) VALUES ( '십', '개발팀', '서울' ); -- '십'의 타입이 달라 불가능
INSERT INTO dept01( deptno, dname, loc ) VALUES ( '10', '개발팀', '서울' ); -- '10'이 자동 형변환 되어 가능

-- 기본키와 같이 NOT NULL인 경우 컬럼 생략 불가
-- 모든 컬럼의 데이터를 입력할 때, 저장할 데이터의 컬럼 기술은 생략 가능
-- values 질의 데이터 순서 : 테이블이 생성될 때 정의된 컬럼의 순서
INSERT INTO dept01 VALUES ( 20, '마케팅', '부산');

-- 데이터 확인 : DESC 테이블명
DESC dept01;

SELECT
    *
FROM
    dept01;

DESC emp;

-- 행 삽입
INSERT INTO emp ( empno, deptno) VALUES (7777, 60 );

SELECT
    *
FROM emp;

-- 롤백으로 행 삽입 취소
ROLLBACK;

DESC orders;

INSERT INTO orders ( orderid, custid, bookid ) VALUES ( 11, 6, 11 );

-- 서브 쿼리를 이용하여 데이터 입력
CREATE TABLE dept02
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
    dept02;
    
-- 데이터 입력 : 여러 번 가능
INSERT INTO dept02
    SELECT
        *
    FROM
        dept; -- 본인 테이블(dept02)도 가능
        
-- 데이터 변경 : 행단위로 선택하고 변경하고자 하는 컬럼을 기술 
-- UPDATE 테이블명 SET 컬럼명 = 새로운 데이터, 컬럼명 = 새로운 데이터 WHERE 행 선택 조건
CREATE TABLE dept03
    AS
        SELECT
            *
        FROM
            dept;
            
SELECT
    *
FROM
    dept03;

-- 모든 부서의 위치를 SEOUL로 변경 -> WHERE 절 불필요
UPDATE dept03
SET
    loc = 'SEOUL';

-- 10번 부서의 위치를 BUSAN로, 부서 이름은 DEV로 변경
UPDATE dept03
SET
    loc = 'BUSAN',
    dname = 'DEV'
WHERE
    deptno = 10;
    
-- NULL값 입력 가능한지 확인
UPDATE dept03
SET
    loc = NULL,
    dname = NULL
WHERE
    deptno = 20;
    
-- emp01 테이블 새롭게 생성 후 변경
DROP TABLE emp01;

CREATE TABLE emp01
    AS
        SELECT
            *
        FROM
            emp;

SELECT
    *
FROM
    emp01;
     
-- 모든 사원의 부서 번호를 30번으로 변경
UPDATE emp01
SET
    deptno = 30;
    
-- 모든 사원의 급여를 10% 인상
UPDATE emp01
SET
    sal = sal * 1.1;

-- 모든 사원의 입사일을 오늘로 변경
UPDATE emp01
SET
    hiredate = sysdate;
    
----------------------------------------------- 테이블 초기화 추가
-- 급여가 3000 이상인 사원의 급여를 10% 인상
UPDATE emp01
SET
    sal = sal * 1.1
WHERE
    sal >= 3000;

-- 부서 번호가 10번인 사원의 부서 번호를 30번으로 변경
UPDATE emp01
SET
    deptno = 30
WHERE
    deptno = 10;
    
-- 1981년에 입사한 사원의 입사일을 오늘로 변경
UPDATE emp01
SET
    hiredate = sysdate
WHERE
    substr(hiredate, 1, 2) = 81; -------------- 강사님 결과 10행 변경??????
    
-- SCOTT 사원의 부서 번호를 30번으로, 직급은 MANAGER로 변경
UPDATE emp01
SET
    deptno = 30,
    job = 'MANAGER'
WHERE
    ename = 'SCOTT';
    
-- SCOTT 사원의 일사일을 오늘로, 급여를 50으로, 커미션을 4000으로 변경
UPDATE emp01
SET
    hiredate = sysdate,
    sal = 50,
    comm = 4000
WHERE
    ename = 'SCOTT';
    
-- 서브 쿼리를 이용하여 20번 부서의 지역명을 40번 부서의 지역명으로 변경   
TRUNCATE TABLE dept01;

INSERT INTO dept01
    SELECT
        *
    FROM
        dept;

SELECT
    *
FROM
    dept01;

UPDATE dept01
SET
    loc = (
        SELECT
            loc
        FROM
            dept01
        WHERE
            deptno = 40
    )
WHERE
    deptno = 20;
    
-- 서브 쿼리를 이용하여 20번 부서의 부서명과 지역명을 10번 부서와 동일하게 변경
SELECT
    *
FROM
    dept01
WHERE
    deptno = 10;

SELECT
    *
FROM
    dept01
WHERE
    deptno = 20;

UPDATE dept01
SET
    ( dname,
      loc ) = (
        SELECT
            dname,
            loc
        FROM
            dept01
        WHERE
            deptno = 10
    )
WHERE
    deptno = 20;
    
-- 데이터 삭제 : 행단위 삭제
-- DELETE from 테이블명 WHERE 조건
-- dept01 테이블의 모든 데이터 삭제
DELETE FROM dept01;

-- 이름이 SCOTT인 사원 삭제
DELETE FROM emp01
WHERE
    ename = 'SCOTT';
    
SELECT
    *
FROM emp01;

-- 부서명이 SALES인 사원 삭제
DELETE FROM emp01
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept
        WHERE
            dname = 'SALES'
    );
    