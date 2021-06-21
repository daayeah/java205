-- 2021.06.18

SELECT
    *
FROM dept01;

INSERT INTO dept01 VALUES ( dept01_deptno_seq.NEXTVAL, 'dev', 'SEOUL' );

--deptno에 입력할 일련 번호 -> sequence
CREATE SEQUENCE dept01_deptno_seq START WITH 10 INCREMENT BY 10;

DELETE FROM dept01 WHERE deptno = ?;

UPDATE dept SET dname=?, loc=? WHERE deptno=?;

SELECT
    *
FROM dept;

SELECT dept_deptno_seq.NEXTVAL FROM dual;