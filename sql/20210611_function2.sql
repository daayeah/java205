-- 2021.06.11

-- 그룹 함수 : 여러 행을 묶어 처리하는 함수, null 값을 제외하고 연산
-- COUNT, SUM, AVG, MAX, MIN
SELECT
    COUNT(*)               AS "사원의 수",
    SUM(sal)               AS "급여 총합",
    round(AVG(sal))        AS "급여 평균",
    MAX(sal)               AS "최대 급여",
    MIN(sal)               AS "최소 급여",
    COUNT(comm)            AS "커미션 받는 사원의 수",
    SUM(comm)              AS "커미션 총합",
    AVG(comm)              AS "커미션 평균"
FROM
    emp;
    
-- DISTINCT로 중복 제거
SELECT
    COUNT(DISTINCT job)
FROM
    emp;

-- GROUP BY : 특정 컬럼을 이용하여 그룹핑
-- SELECT 그룹핑 기준 칼럼, 그룹 함수 FROM 테이블 WHERE 조건절 GROUP BY 그룹핑 기준 칼럼

-- 부서별 급여 계산
SELECT
    deptno                 AS "부서 번호",
    COUNT(*)               AS "부서의 인원",
    SUM(sal)               AS "부서의 급여 총합",
    trunc(AVG(sal))        AS "부서의 급여 평균",
    MAX(sal)               AS "부서의 최대 급여액",
    MIN(sal)               AS "부서의 최소 급여액"
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
    
-- 직급별 사원의 수
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
ORDER BY
    job;
    
-- 부서별 전체 사원의 수와 커미션 받는 사원의 수 계산
SELECT
    deptno          AS "부서 번호",
    COUNT(*)        AS "전체 사원의 수",
    COUNT(comm)     AS "커미션 받는 사원의 수"
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;
    
-- HAVING : GROUP BY의 그룹 함수 결과를 비교 시 사용
-- SELECT ~ FROM ~ WHERE ~ GROUP BY ~ HAVING 그룹 함수 연산자 값(=, !=, >, <, >=, <=)

-- 평균 급여가 2000 이상인 부서의 부서 번호와 평균 급여를 부서별로 출력
SELECT
    deptno,
    round(AVG(sal))
FROM
    emp
GROUP BY
    deptno
HAVING
    avg(sal) >= 2000
ORDER BY
    deptno;
    
-- 최대 급여가 2900 이상인 부서의 최대 급여와 최소 급여를 부서별로 출력
SELECT
    deptno,
    MAX(sal),
    MIN(sal)
FROM
    emp
GROUP BY
    deptno
HAVING
    MAX(sal) >= 2900
ORDER BY
    deptno;

COMMIT;