-- #2 요구 사항에 맞는 오브젝트를 생성하는 sql을 작성하시오.
--1. 대리키 IDX, 회원 아이디, 이름, 비밀번호, 사진 이름, 가입일을 저장할 수 있는 
--   이름이 MEMBER인 테이블을 생성하세요. 
--   IDX 에는 기본키 제약을 설정하고,
--   회원 아이디에는 unique, not null 제약 설정을 하고, 
--   이름과 비밀번호에는 not null, 
--   가입 일은 기본 값으로 sysdate가 입력되도록 하시오.

CREATE TABLE member (
    idx        NUMBER(3) CONSTRAINT mem_idx_pk PRIMARY KEY,
    id         VARCHAR2(10) CONSTRAINT mem_id_nn NOT NULL
    UNIQUE,
    name       VARCHAR2(10) CONSTRAINT mem_name_nn NOT NULL,
    password   VARCHAR2(10) CONSTRAINT mem_pw_nn NOT NULL,
    imagename  VARCHAR2(20),
    joindate   DATE DEFAULT sysdate
);


-- 2. Member 테이블에서 이름 컬럼으로 인덱스 객체를 생성하시오.
CREATE INDEX member_index ON
    member ( name );
    
    
-- 3. MEMBER 테이블에서 회원 아이디, 이름, 사진 정보 만을 출력하는 view 객체를 생성하시오.
--    view의 이름은 member_view로 생성하시오.
CREATE OR REPLACE VIEW member_view AS
    SELECT
        id,
        name,
        imagename
    FROM
        member;