-- 2021.06.10

-- function : 단일행 함수, 집합(다중행) 함수
-- 단일행 함수 : 하나의 행이 포함하는 특정 컬럼의 값 하나를 처리하고 반환
-- 다중행(집합) 함수 : 여러 행의 특정 걸럼 값들을 대상으로 연산하고 반환

-- 숫자 함수
SELECT
    'Oracle'
FROM
    dual;

SELECT
    abs(10),
    abs(- 10)
FROM
    dual;

SELECT
    floor(15.7)
FROM
    dual;

SELECT
    round(15.193, 1),
    round(15.193, - 1)
FROM
    dual;

SELECT
    round(15.193, 2),
    round(15.193, - 2)
FROM
    dual;

SELECT
    trunc(15.79, 1),
    trunc(15.79)
FROM
    dual;

SELECT
    mod(11, 4)
FROM
    dual;
   
-- 사원들의 급여
SELECT
    sal,
    mod(sal, 2)
FROM
    emp
WHERE
    mod(sal, 2) = 1;
    
-- 문자 함수
-- concat(문자, 문자) : '' || ''
SELECT
    concat(' abc ', ' efg'),
    'abc' || 'efg'
FROM
    dual;

-- substr : 문자열 추출
-- substr(문자열, 시작 위치, 길이)
SELECT
    substr('apple', 1, 3)
FROM
    dual;
    
SELECT
    substr('apple', - 3)
FROM
    dual;
    
-- replace : 특정 문자열(패턴)을 다른 문자열(패턴)으로 변경
SELECT
    replace('JACK and JUE', 'J', 'BL')
FROM
    dual;

-- sysdate : 현재 날짜    
SELECT
    sysdate
FROM
    dual;
 
---------------------------------------------------------------------------------------

-- 2021.06.11

-- 형변환 함수 : 날짜 -> 문자, 숫자 -> 문자, 문자 -> 숫자, 문자 -> 날짜

-- 날짜 -> 문자 : to_char(날짜, 데이터, '패턴'), 
SELECT
    sysdate,
    to_char(sysdate, 'YYYY.MM.DD. HH24:MI:SS')
FROM
    dual;

SELECT
    ename,
    hiredate,
    to_char(hiredate, 'YYYY.MM.DD.')
FROM
    emp;
    
SELECT
    orderid,
    orderdate,
    to_char(orderdate, 'YYYY.MM.DD.')
FROM
    orders;

-- 숫자 -> 문자 : to_char(숫자, '패턴)
SELECT 
    to_char(123456, '0000000000'),
    to_char(123456, '9999999999')
FROM
    dual;
    
SELECT
    empno,
    ename,
    to_char(sal * 1100, 'L999,999,999')
FROM
    emp;

-- 문자 -> 숫자 : to_number('문자열', '패턴')
SELECT
    to_number('1,000,000', '9,999,999'),
    to_number('1,000,000', '9,999,999') + 100000
FROM
    dual;
    
-- 문자 -> 날짜 : TO_DATA('문자열', '패턴')
SELECT
    TO_DATE('2012-05-17', 'YYYY-MM-DD'),
    trunc((sysdate - TO_DATE('2012-05-17', 'YYYY-MM-DD'))/365)
FROM
    dual;
    
-- decode 함수 : 분기를 위해 사용. switch-case 유사
-- decode(컬럼, = 조건1 값, 조건1이 참일 때 사용할 값
--            , = 조건2 값, 조건2가 참일 때 사용할 값
--            , ...)

-- emp 테이블에서 부서 번호에 맞는 부서 이름 출력
SELECT
    *
FROM dept;

-- 10 ACCOUNTING
-- 20 RESEARCH
-- 30 SALES
-- 40 OPERATIONS
SELECT
    ename,
    deptno,
    decode(deptno, 10, 'ACCOUNTING',
                   20, 'RESEARCH',
                   30, 'SALES',
                   40, 'OPERATIONS') AS dname
FROM
    emp
ORDER BY
    dname;
    
-- 직급에 따라 급여를 인상
-- 'ANALYST' 5% 인상
-- 'SALESMAN' 10% 인상
-- 'MANATER' 15% 인상
-- 'CLERK' 20% 인상
SELECT
    ename,
    sal,
    decode(job, 'ANALYST', sal * 1.05,
                'SALESMAN', sal * 1.1,
                'MANATER', sal * 1.15,
                'CLERK', sal * 1.2) AS upsal
FROM
    emp;
    
-- CASE 함수 : 분기를 위해 사용
-- CASE WHEN 조건식 THEN 참일 때 값
SELECT
    ename,
    deptno,
    CASE
        WHEN deptno = 10 THEN 'ACCOUNTING'
        WHEN deptno = 20 THEN 'RESEACH'
        WHEN deptno = 30 THEN 'SALES'
        WHEN deptno = 40 THEN 'OPERATIONS'
    END AS deptname
FROM
    emp;
    
COMMIT;