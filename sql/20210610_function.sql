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