-- 2021.06.17

-- #1 아래 요구사항에 맞도록 기본 SQL 문을 작성하시오.
-- 1. 아래 조건에 맞는 DDL을 작성하시오.
------ 전화번호 부( 테이블 이름 : Contact )
------ 기본정보(not null)
-- 대리키 : 일련번호 -> pIdx 기본키로 설정
-- 이름, 전화번호, 주소, 이메일 
-- 주소값과 이메일은 입력이 없을 때 기본값 입력
-- 친구의 타입 (카테고리) : univ, com, cafe 세가지 값만 저장 가능
------ 선택 정보
-- 전공, 학년
-- 회사 이름, 부서 이름, 직급
-- 모임 이름, 닉네임

CREATE TABLE contact (
    pidx      NUMBER(6) CONSTRAINT ct_pidx_pk PRIMARY KEY,
    name      VARCHAR2(10) CONSTRAINT ct_name_nn NOT NULL,
    number    VARCHAR2(20) CONSTRAINT ct_num_nn NOT NULL,
    address   VARCHAR2(20) DEFAULT 'N' CONSTRAINT ct_addr_nn NOT NULL,
    email     VARCHAR2(20) DEFAULT 'N' CONSTRAINT ct_email_nn NOT NULL,
    type      VARCHAR2(4) CONSTRAINT ct_type_ck CHECK ( type IN ( 'univ', 'com', 'cafe' ) ) NOT NULL,
    
    major     VARCHAR2(10),
    grade     NUMBER(1),
    company   VARCHAR2(20),
    deptname  VARCHAR2(10),
    position  VARCHAR2(10),
    cafe      VARCHAR2(20),
    nickname  VARCHAR2(10)
);

COMMENT ON COLUMN contact.name IS '이름';
COMMENT ON COLUMN contact.phonenumber IS '전화번호';
COMMENT ON COLUMN contact.address IS '주소';
COMMENT ON COLUMN contact.email IS '이메일';

    
CREATE TABLE univ (
    pidx   NUMBER(6) CONSTRAINT uv_idx_pk PRIMARY KEY,
    major  VARCHAR2(20) DEFAULT 'N' CONSTRAINT uv_mj_nn NOT NULL,
    year   NUMBER(1) DEFAULT 1 CONSTRAINT uv_yr_ck
                                    CHECK ( year > 0 AND year < 5 ) NOT NULL,
    ref    NUMBER(6) CONSTRAINT uv_ref_fk REFERENCES contact ( pidx ) NOT NULL
);
    
COMMENT ON COLUMN univ.major IS '대학 친구의 전공 정보';
COMMENT ON COLUMN univ.year IS '대학 친구의 학년';
COMMENT ON COLUMN univ.ref IS '친구의 기본 정보 외래키';


CREATE TABLE com (
    pidx      NUMBER(6) CONSTRAINT co_idx_pk PRIMARY KEY,
    company   VARCHAR2(20) DEFAULT 'N' CONSTRAINT co_cp_nn NOT NULL,
    deptname  VARCHAR2(20) DEFAULT 'N' CONSTRAINT co_dn_nn NOT NULL,
    position     VARCHAR2(20) DEFAULT 'N' CONSTRAINT co_po_nn NOT NULL,
    ref       NUMBER(6) CONSTRAINT co_ref_fk REFERENCES contact ( pidx ) NOT NULL
);

COMMENT ON COLUMN com.company IS '회사 친구의 회사 이름';
COMMENT ON COLUMN com.deptname IS '회사 친구의 부서 이름';
COMMENT ON COLUMN com.position IS '회사 친구의 직급';
COMMENT ON COLUMN com.ref IS '친구의 기본 정보 외래키';

                                          
CREATE TABLE cafe (
    pidx      NUMBER(6) CONSTRAINT cf_idx_pk PRIMARY KEY,
    cafe      VARCHAR2(20) DEFAULT 'N' CONSTRAINT cf_cf_nn NOT NULL,
    nickname  VARCHAR2(20) DEFAULT 'N' CONSTRAINT cf_nn_nn NOT NULL,
    ref       NUMBER(6) CONSTRAINT cf_ref_fk REFERENCES contact ( pidx ) NOT NULL
);
    
COMMENT ON COLUMN cafe.cafe IS '모임 친구의 모임 이름';
COMMENT ON COLUMN cafe.nickname IS '모임 친구의 닉네임';
COMMENT ON COLUMN cafe.ref IS '친구의 기본 정보 외래키';



-- 2. DEPT 테이블에 데이터를 삽입하는 SQL을 작성하시오. 입력 데이터는 임의로 작성하시오.
INSERT INTO dept ( deptno, dname ) VALUES ( 50, 'INTERNATIONAL');

INSERT INTO dept VALUES ( 60, 'PLANNING', 'WASHINGTON');



-- 3. DEPT 테이블에 위에서 삽입한 데이터의 dname, loc 데이터를 변경하는 SQL을 작성하시오.
--    입력 데이터는 임의로 작성하시오.
UPDATE dept
SET
    loc = 'BUSAN'
WHERE
    dname = 'INTERNATIONAL';

UPDATE dept
SET
    dname = 'MARKETING',
    loc = 'SEOUL'
WHERE
    deptno = 60;



-- 4. DEPT 테이블에 위에서 삽입한 데이터를 deptno 컬럼의 값을 기반으로 삭제하는 SQL을 작성하시오.
DELETE FROM dept
WHERE
    deptno IN ( 50, 60 );


-- 5. 사용자가 보유한 테이블 목록을 확인하는 SQL문을 작성하시오.
SELECT * FROM tab;



-- 6. EMP 테이블의 구조를 확인하는 SQL을 작성하시오.
DESC emp;



-- 7. 사용자가 정의한 제약조건들을 확인하는 SQL문을 작성하시오.
SELECT * FROM all_constraints;



-- #2 아래 요구사항에 맞도록 고급 SQL 문을 작성하시오.
-- 1. EMP 테이블의 ename 컬럼에 인덱스를 생성하는 SQL을 작성하시오. 인덱스의 이름은 emp_index
CREATE INDEX emp_index ON emp ( ename );



-- 2. EMP 테이블과 DEPT 테이블을 조인하는 SQL을 기반으로 view 객체를 생성하는 SQL을 작성하시오.
--    view 의 이름은 emp_view 로 하시오. 
CREATE OR REPLACE VIEW emp_view AS
    SELECT
        *
    FROM
        emp   e,
        dept  d
    WHERE
        e.deptno = d.deptno;


      
-- 3. EMP 테이블에서 모든 사원의 부서번호를 이름이 'SCOTT'인 사원의 부서번호로 변경하는 SQL을 작성하시오.
UPDATE emp
SET
    deptno = (
        SELECT
            deptno
        FROM
            emp
        WHERE
            ename = 'SCOTT'
    );

COMMIT;