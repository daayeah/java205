-- 32. EQUI 조인을 사용하여 SCOTT 사원의 부서번호와 부서 이름을 출력하시오.
SELECT
    e.ename,
    d.deptno,
    d.dname
FROM
    emp   e,
    dept  d
WHERE
        e.deptno = d.deptno
    AND e.ename = 'SCOTT';

-- 33. INNER JOIN과 ON 연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역 명을 출력하시오.
SELECT
    e.ename,
    d.dname,
    d.loc
FROM
    emp e INNER JOIN dept d
    ON e.deptno = d.deptno
ORDER BY
    e.ename;

-- 36. 조인과 WildCARD를 사용하여 이름에 ‘A’가 포함된 모든 사원의 이름과 부서명을 출력하시오.
SELECT
    e.ename,
    d.dname
FROM
    emp   e,
    dept  d
WHERE
        e.deptno = d.deptno
    AND e.ename LIKE '%A%';

-- 37. JOIN을 이용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
SELECT
    e.ename,
    e.job,
    d.deptno,
    d.dname,
    d.loc
FROM
    emp   e,
    dept  d
WHERE
        d.loc = 'NEW YORK'
    AND e.deptno = d.deptno;

-- 38. SELF JOIN을 사용하여 사원의 이름 및 사원번호, 관리자 이름을 출력하시오.
​SELECT
    e.ename,
    e.empno,
    m.ename as "관리자"
FROM
    emp  e,
    emp  m
WHERE
    e.mgr = m.empno;
    
-- 39. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
SELECT
    e.ename,
    e.empno,
    m.ename AS "관리자"
FROM
    emp  e,
    emp  m
WHERE
    e.mgr = m.empno (+)
ORDER BY
    e.empno DESC;

​-- 40. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. ( SCOTT )
SELECT
    e2.ename,
    e1.deptno
FROM
    emp  e1,
    emp  e2
WHERE
        e1.ename = 'SCOTT'
    AND e1.deptno = e2.deptno;
    
-- 41. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
SELECT
    e2.ename,
    e2.hiredate
FROM
    emp  e1,
    emp  e2
WHERE
        e1.ename = 'WARD'
    AND e1.hiredate < e2.hiredate
ORDER BY
    e2.hiredate;

-- 42. SELF JOIN 을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
SELECT
    e.ename,
    e.hiredate,
    m.ename,
    m.hiredate
FROM
    emp  e,
    emp  m
WHERE
        e.mgr = m.empno
    AND e.hiredate < m.hiredate;