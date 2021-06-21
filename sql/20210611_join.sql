-- 2021.06.11

-- JOIN : 스키마의 합
-- CROSS JOIN : 스키마의 합 -> 집합의 곱 연산과 동일
SELECT
    *
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
    
-- ANSI CROSS JOIN
SELECT
    *
FROM
    emp
    CROSS JOIN dept;
 
SELECT
    o.orderid,
    c.name,
    b.bookname
FROM
    orders    o,
    customer  c,
    book      b
WHERE
        o.custid = c.custid
    AND o.bookid = b.bookid
ORDER BY
    o.orderid;

-- ANSI -> INNER JOIN
-- 오라클 EQUI JOIN
SELECT
    *
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
    
SELECT
    *
FROM
    emp e INNER JOIN dept d
    ON e.deptno = d.deptno;

-- 이름이 SCOTT인 사람의 부서명 출력
-- 출력하려는 컬럼이 있는 테이블 확인
-- 이름 : emp, 부서명 : dept
SELECT
    e.ename,
    d.dname,
    e.deptno
FROM
    emp   e,
    dept  d
WHERE
    e.deptno = d.deptno -- AND ename = 'SCOTT'
ORDER BY
    d.dname, e.ename;
    
SELECT
    *
FROM
    emp e INNER JOIN dept d
    ON e.deptno = d.deptno
WHERE
    e.ename = 'SCOTT';
    
-- 비교하는 컬럼의 이름이 같을 때, on 절을 생략하고 using 이용하면 조건식을 간략하게 처리
SELECT
    *
FROM
    emp e INNER JOIN dept d
    -- on e.deptno=d.deptno
     USING ( deptno )
WHERE
    e.ename = 'SCOTT';
   
-- NATURAL JOIN
SELECT
    *
FROM
    emp NATURAL JOIN dept;
    
-- SELF JOIN : 자기 자신을 조인(참조)
-- emp -> mgr 칼럼이 emp.empno 참조
SELECT
    e.empno,
    e.ename,
    e.mgr,
    m.ename
FROM
    emp  e,
    emp  m
WHERE
    e.mgr = m.empno;

-- OUTER JOIN
SELECT
    e.empno,
    e.ename,
    e.mgr,
    m.ename
FROM
    emp  e,
    emp  m
WHERE
    e.mgr = m.empno (+); -- 표현하고자 하는 컬럼이 테이블의 반대쪽, null 값을 가지는 위치에 (+)

-- [LEFT | RIGHT | FULL] OUTER JOIN
SELECT
    e.ename,
    e.mgr,
    m.ename AS "관리자"
FROM
    emp  e
    LEFT OUTER JOIN emp  m ON e.mgr = m.empno;

SELECT
    e.ename,
    e.mgr,
    m.ename AS "관리자"
FROM
    emp  m
    RIGHT OUTER JOIN emp  e ON e.mgr = m.empno;

-- 회원별 구매 내역 출력
SELECT
    c.name,
    o.orderid
FROM
    orders    o,
    customer  c
WHERE
    o.custid (+) = c.custid;

-- 통계, 이벤트 등에 활용
SELECT
    c.name, count(o.orderid) as "구매 횟수", avg(saleprice)
FROM
    orders    o,
    customer  c
WHERE
    o.custid (+) = c.custid
group by c.name;

-- NON EQUI JOIN
-- 동등 비교가 아닌 크다, 작다와 같은 비교로 조인의 조건을 작성
select e.ename, e.sal, s.grade, s.losal, s.hisal
from emp e, salgrade s
-- where e.sal >= s.losal and e.sal <= s.hisal
where sal between s.losal and s.hisal
order by e.ename;