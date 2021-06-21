-- 2021.06.16

-- 자주 사용되는 30번 부서에 소속된 사원들의 사번과 이름, 부서 번호를 출력하기 위한 SELECT 문을 하나의 뷰로 정의
CREATE OR REPLACE VIEW emp_view30 AS
    SELECT
        empno,
        ename,
        deptno
    FROM
        emp
    WHERE
        deptno = 30;
        
SELECT
    *
FROM
    emp_view30
WHERE
    ename = 'JAMES';
        
-- view 삭제
drop view emp_view30;

-- 인라인 뷰를 이용한 Top3
SELECT
    ROWNUM, -- 자동 생성된 입력 순서
    ename
FROM
    emp;
    
  
SELECT
    ROWNUM,
    ename
FROM  
    ( -- 인라인 뷰 생성 
        SELECT
            *
        FROM
            emp
        ORDER BY
            ename
    );  

-- 입사일이 빠른 사람 Top5
SELECT
    ROWNUM,
    ename,
    hiredate
FROM
    (
        SELECT
            *
        FROM
            emp
        ORDER BY
            hiredate
    )
WHERE
    ROWNUM < 6;

CREATE OR REPLACE VIEW view_hir AS
    SELECT
        *
    FROM
        emp
    ORDER BY
        hiredate;

SELECT
    ROWNUM,
    ename,
    hiredate
FROM
    view_hir;  
    
SELECT
    ROWNUM,
    ename,
    hiredate
FROM
    view_hir
WHERE
    ROWNUM < 6
ORDER BY
    ename;