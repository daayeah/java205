-- 2021.06.10

-- 특정 데이터 검색 : 행 검색 -> 컬럼 선택
-- 10번 부서의 사원 리스트 출력 -> where deptno = 10
SELECT
    *
FROM
    emp
WHERE
    deptno = 10;

-- 데이터 명은 대소문자를 구분
-- 이름이 'SCOTT'인 사원 출력
SELECT
    *
FROM
    emp
WHERE
    ename = 'SCOTT';

SELECT
    *
FROM
    emp
WHERE
    ename = 'scott';

-- 날짜 타입의 데이터
SELECT
    *
FROM
    emp
WHERE
    hiredate = '96/11/17';

-- 논리 연산자 : and, or, not
-- 10번 부서의 관리자(manager) 리스트 출력
SELECT
    *
FROM
    emp
WHERE
        deptno = 10
    AND job = 'MANAGER';
    
-- 10번 부서의 직원과 관리자 리스트 출력
SELECT
    *
FROM
    emp
WHERE
    deptno = 10
    OR job = 'MANAGER';
    
-- 10번 부서의 직원을 제외한 나머지 직원 리스트 출력
SELECT
    *
FROM
    emp
WHERE
    NOT deptno = 10;

SELECT
    *
FROM
    emp
WHERE
    deptno != 10;
    
-- 10번 부서 관리자의 사원 번호, 이름, 직업 출력
SELECT
    deptno,
    ename,
    job
FROM
    emp
WHERE
        deptno = 10
    AND job = 'MANAGER';

-- 범위 연산은 논리 연산자를 이용 -> between a and b : a 이상 b 이하
-- 2000 이상 3000 이하의 급여를 받는 직원 리스트 출력
SELECT
    ename,
    sal,
    job
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    ename,
    sal,
    job
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;
    
-- 연봉 20% 인상(upsal) 출력
SELECT
    ename,
    sal,
    sal * 1.2 AS upsal,
    job
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- between 연산자는 날짜의 연산도 가능
-- 1981년에 입사한 사원 리스트를 입사순으로 출력
SELECT
    *
FROM
    emp
WHERE
        hiredate >= '81/01/01'
    AND hiredate <= '81/12/31'
ORDER BY
    hiredate;

SELECT
    *
FROM
    emp
WHERE
    hiredate BETWEEN '81/01/01' AND '81/12/31'
ORDER BY
    hiredate;

-- 연산자 in : 여러개의 or 연산자를 대체
-- 커미션이 300 또는 500 또는 1400인 리스트 출력
SELECT
    *
FROM
    emp
WHERE
    comm = 300
    OR comm = 500
    OR comm = 1400;

SELECT
    *
FROM
    emp
WHERE
    comm IN ( 300, 500, 1400 );

-- 패턴 검색 : 키워드 검색에 많이 사용(게시판)
-- 컴럼 like '%'
-- ename like 'F%' -> F로 시작하는 문자열
-- ename like '%F' -> F로 끝나는 문자열
-- ename like '%F%' -> F를 포함하는 문자열
-- 제목에 'java' 단어 포함하는 게시물 검색 -> title like '%java%'

-- F로 시작하는 이름을 가진 사원 검색
SELECT
    ename
FROM
    emp
WHERE
    ename LIKE 'F%';
    
-- ES로 끝나는 이름을 가진 사원 검색
SELECT
    ename
FROM
    emp
WHERE
    ename LIKE '%ES';
    
-- LA를 포함하는 이름을 가진 사원 검색
SELECT
    ename
FROM
    emp
WHERE
    ename LIKE '%LA%';

-- 자릿수 패턴 : 컬럼 값에 자릿수가 정해져 있고 패턴이 있는 경우 사용
-- 이름의 두 번째 자리에 문자 A를 포함하는 사원 리스트 출력
SELECT
    ename
FROM
    emp
WHERE
    ename LIKE '_A%';
    
-- 이름의 세 번째 자리에 문자 A를 포함하는 사원 리스트 출력
SELECT
    ename
FROM
    emp
WHERE
    ename LIKE '__A%';
    
-- 이름의 세 번째 자리에 문자 A를 포함하지 않는 사원 리스트 출력
SELECT
    ename
FROM
    emp
WHERE
    ename NOT LIKE '__A%';

-- null 값을 확인하는 연산자 : is null, is not null
-- 커미션이 등록되어 있지 않은 사원 리스트 출력
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
    
-- 커미션이 등록되어 있는 사원 리스트 출력
SELECT
    *
FROM
    emp
WHERE
    comm IS NOT NULL;

-- 결과 행의 정렬 : order by 컬럼 [asc|desc]
-- [asc|desc] : [] -> 선택, asc -> 오름차순, desc -> 내림차순
-- 급여가 적은 사원순으로 출력 -> 오름차순
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal; -- 정렬의 기본은 오름차순
    
-- 급여가 많은 사원순으로 출력 -> 내림차순
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;
    
-- 급여가 많은 사원순으로 정렬하되 급여가 같은 사원은 이름순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC,
    ename;

COMMIT;