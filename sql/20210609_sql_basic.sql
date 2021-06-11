-- 2021.06.09

-- 계정 HR이 보유(권한)한 테이블 객체 리스트
SELECT
    *
FROM
    tab;

-- 테이블 정보 검색 : 컬럼의 이름, null 유무, 타입, 사이즈
DESC dept;

DESC emp;

-- 데이터 조회를 위한 명령 : select
-- select {컬럼명, ..., *} from 테이블 이름;
SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    emp;

-- 필요한 컬럼 출력
-- select 컬럼명, 컬럼명 from 테이블 이름;
-- 사원 번호와 이름을 출력
SELECT
    ename,
    empno,
    deptno
FROM
    emp;

-- select 컬럼의 산술 연산 : 컬럼과 숫자, 컬럼과 컬럼 간의 연산 가능
-- 사원 이름, 월 급여, 연봉(ysal)
SELECT
    ename,
    sal,
    sal * 12 AS ysal
FROM
    emp;

-- null : 값이 없는 것이 아닌 아직 정해지지 않았음을 의미
SELECT
    sal,
    comm,
    sal * comm,
    sal * 12,
    sal / 10,
    sal - 100,
    sal + 1000
FROM
    emp;

-- 사원 이름, 직급, 급여, 수당, 연봉(급여*12), 연봉(급여*12+수당)
SELECT
    ename,
    job,
    sal,
    comm,
    sal * 12           AS ysal1,
    sal * 12 + comm      AS ysal2
FROM
    emp;
    
-- 개선 : null 값을 0으로 치환해서 연산
-- nvl(컬럼 이름, 기본 값) : 컬럼의 값이 null일 때 기본 값으로 치환
SELECT
    ename,
    job,
    sal,
    nvl(comm, 0),
    sal * 12                       AS ysal1,
    sal * 12 + nvl(comm, 0)          AS ysal2
FROM
    emp;

-- 컬럼과 문자열을 붙이는 연산 || 이용
-- 문자열 표현 -> '문자열'
SELECT
    ename
    || ' is a'
    || job
FROM
    emp;

-- 결과 리스트에서 중복된 값을 제거 : distinct
SELECT
    deptno
FROM
    emp;

SELECT DISTINCT
    deptno
FROM
    emp;

SELECT
    deptno,
    job
FROM
    emp;

SELECT DISTINCT
    deptno,
    job
FROM
    emp;

-- order by : 행의 정렬 -> 요구사항에 따라 다른 결과
SELECT DISTINCT
    deptno,
    job
FROM
    emp
ORDER BY
    deptno;

SELECT DISTINCT
    deptno,
    job
FROM
    emp
ORDER BY
    job;

-- 특정 데이터 검색
-- select ~ from ~ where 조건식
-- where 컬럼명 비교연산자 값
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

SELECT
    ename,
    empno,
    sal
FROM
    emp
WHERE
    sal >= 3000;

COMMIT;