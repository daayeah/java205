-- Oracle Ex
-- dept, emp DDL -> DML
-- Table 생성 -> 데이터 저장(insert)

DROP TABLE emp;

DROP TABLE dept;

CREATE TABLE dept (                        -- dept table 생성
    deptno  NUMBER,                          -- 부서번호
    dname   VARCHAR2(14),                    -- 부서명
    loc     VARCHAR2(13),                    -- 부서위치
    CONSTRAINT pk_dept PRIMARY KEY ( deptno ) -- deptno로 pk설정
);

CREATE TABLE emp (                         -- emp table 생성
    empno     NUMBER,                        -- 직원번호
    ename     VARCHAR2(10),                  -- 직원명
    job       VARCHAR2(9),                   -- 직책
    mgr       NUMBER(4),                     -- 담당매니저
    hiredate  DATE,                          -- 입사일
    sal       NUMBER(7),                     -- 월급
    comm      NUMBER(7),                     -- 보너스
    deptno    NUMBER,                        -- 부서번호
    CONSTRAINT pk_emp PRIMARY KEY ( empno )   -- empno로 pk설정
);

-- DEPT DML
INSERT INTO dept VALUES (
    10,
    'ACCOUNTING',
    'NEW YORK'
);

INSERT INTO dept VALUES (
    20,
    'RESEARCH',
    'DALLAS'
);

INSERT INTO dept VALUES (
    30,
    'SALES',
    'CHICAGO'
);

INSERT INTO dept VALUES (
    40,
    'OPERATIONS',
    'BOSTON'
);

-- EMP DML
INSERT INTO emp VALUES (
    7839,
    'KING',
    'PRESIDENT',
    NULL,
    TO_DATE('1996-11-17', 'yyyy-mm-dd'),
    5000,
    NULL,
    10
);

INSERT INTO emp VALUES (
    7698,
    'BLAKE',
    'MANAGER',
    7839,
    TO_DATE('1991-1-05', 'yyyy-mm-dd'),
    2850,
    NULL,
    30
);

INSERT INTO emp VALUES (
    7782,
    'CLARK',
    'MANAGER',
    7839,
    TO_DATE('1999-9-06', 'yyyy-mm-dd'),
    2450,
    NULL,
    10
);

INSERT INTO emp VALUES (
    7566,
    'JONES',
    'MANAGER',
    7839,
    TO_DATE('2001-02-04', 'yyyy-mm-dd'),
    2975,
    NULL,
    20
);

INSERT INTO emp VALUES (
    7788,
    'SCOTT',
    'ANALYST',
    7566,
    TO_DATE('2003-06-17', 'yyyy-mm-dd'),
    3000,
    NULL,
    20
);

INSERT INTO emp VALUES (
    7902,
    'FORD',
    'ANALYST',
    7566,
    TO_DATE('1981-03-12', 'yyyy-mm-dd'),
    3000,
    NULL,
    20
);

INSERT INTO emp VALUES (
    7369,
    'SMITH',
    'CLERK',
    7902,
    TO_DATE('2007-12-1', 'yyyy-mm-dd'),
    800,
    NULL,
    20
);

INSERT INTO emp VALUES (
    7499,
    'ALLEN',
    'SALESMAN',
    7698,
    TO_DATE('20-2-1981', 'dd-mm-yyyy'),
    1600,
    300,
    30
);

INSERT INTO emp VALUES (
    7521,
    'WARD',
    'SALESMAN',
    7698,
    TO_DATE('22-2-1981', 'dd-mm-yyyy'),
    1250,
    500,
    30
);

INSERT INTO emp VALUES (
    7654,
    'MARTIN',
    'SALESMAN',
    7698,
    TO_DATE('28-9-1981', 'dd-mm-yyyy'),
    1250,
    1400,
    30
);

INSERT INTO emp VALUES (
    7844,
    'TURNER',
    'SALESMAN',
    7698,
    TO_DATE('8-9-1981', 'mm-dd-yyyy'),
    1500,
    0,
    30
);

INSERT INTO emp VALUES (
    7876,
    'ADAMS',
    'CLERK',
    7788,
    TO_DATE('13-7-87', 'dd-mm-yy') - 51,
    1100,
    NULL,
    20
);

INSERT INTO emp VALUES (
    7900,
    'JAMES',
    'CLERK',
    7698,
    TO_DATE('3-12-1981', 'mm-dd-yyyy'),
    950,
    NULL,
    30
);

INSERT INTO emp VALUES (
    7934,
    'MILLER',
    'CLERK',
    7782,
    TO_DATE('2003-1-23', 'yyyy-mm-dd'),
    1300,
    NULL,
    10
);

COMMIT;