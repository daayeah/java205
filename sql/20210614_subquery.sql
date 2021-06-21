-- 2021.06.14

-- 스칼라 부속 질의 : select 절 이후에 사용
-- 단일행, 단일열 값 사용
SELECT
    o.custid,
    (
        SELECT
            c.name
        FROM
            customer c
        WHERE
            o.custid = c.custid
    ) AS name
FROM
    orders o;
    
-- emp 테이블만 사용해서 사원 이름, 부서 이름 출력
SELECT
    e.ename,
    (
        SELECT
            d.dname
        FROM
            dept d
        WHERE
            e.deptno = d.deptno
    ) AS dname
FROM
    emp e;
    
SELECT
    emp.ename,
    dept.dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
    
-- 마당서점의 고객별 판매액을 보이시오.(결과는 고객 이름과 고객별 판매애일 출력)
SELECT
    c.custid,
    c.name,
    SUM(o.saleprice)
FROM
    orders    o,
    customer  c
WHERE
    o.custid = c.custid
GROUP BY
    c.custid,
    c.name;
    
-- 스칼라 부속질의 이용
SELECT
    custid,
    (
        SELECT
            c.name
        FROM
            customer c
        WHERE
            o.custid = c.custid
    )                      AS name,
    SUM(o.saleprice)       AS "구매액"
FROM
    orders o
GROUP BY
    custid;
    
-- 인라인 뷰 : from 절 뒤에 사용되는 부속 질의, 가상 테이블처럼 사용
-- 고객번호 2 이하 -> customer
-- 판매액 -> orders
-- 고객번호가 2 이하인 고객의 판매액을 보이시오.(결과는 고객 이름과 고객별 판매액 출력)
SELECT
    o.custid, c.name, sum(o.saleprice)
FROM
    (
        SELECT
            *
        FROM
            customer
        WHERE
            custid <= 2
    )       c,
    orders  o
WHERE
    c.custid = o.custid
GROUP BY
    o.custid, c.name;
    
-- 중첩 질의 : where 절 뒤에 사용하는 부속 질의
-- 비교 연산자를 이용할 때는 단일행, 단일열의 결과를 갖는 부속 질의를 사용
-- >, <, =, !=, >=, <=
-- 평균 급여보다 더 많은 급여를 받는 사원을 검색
SELECT
    *
FROM
    emp
WHERE
    sal > (
        SELECT
            AVG(sal)
        FROM
            emp
    );
    
-- 평균 주문 금액 이하의 주문에 대해서 주문 번호와 금액을 보이시오. -> orders
SELECT
    orderid,
    saleprice
FROM
    orders
WHERE
    saleprice < (
        SELECT
            AVG(saleprice)
        FROM
            orders
    )
ORDER BY
    saleprice;

-- 각 고객의 평균 주문 금액보다 큰 금액의 주문 내역에 대해서 주문 번호, 고객 번호, 금액을 보이시오.
SELECT
    orderid,
    custid,
    saleprice
FROM
    orders o1
WHERE
    saleprice > (
        SELECT
            AVG(saleprice)
        FROM
            orders o2
        WHERE
            o2.custid = o1.custid
    );

-- 다중행 연산자 IN    
-- 3000 이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원 리스트 출력
SELECT
    distinct deptno
FROM emp where sal >= 3000;

SELECT
    *
FROM emp where deptno in (select distinct deptno from emp where sal >= 3000);

-- 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
SELECT
    SUM(saleprice)
FROM
    orders
WHERE
    custid IN (
        SELECT
            custid
        FROM
            customer
        WHERE
            address LIKE '%대한민국%'
    );

-- 다중행 연산자 ALL    
-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문 번호와 금액을 보이시오.
SELECT
    orderid,
    saleprice
FROM
    orders
WHERE
    saleprice > (
        SELECT
            MAX(saleprice)
        FROM
            orders
        WHERE
            custid = 3
    );

SELECT
    orderid,
    saleprice
FROM
    orders
WHERE
    saleprice > ALL (
        SELECT
            saleprice
        FROM
            orders
        WHERE
            custid = 3
    );
    
-- EXISTS 연산자
-- 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
SELECT
    SUM(saleprice)
FROM
    orders o
WHERE
    EXISTS (
        SELECT
            *
        FROM
            customer c
        WHERE
                o.custid = c.custid
            AND c.address LIKE '%대한민국%'
    );
    
COMMIT;