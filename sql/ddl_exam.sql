CREATE TABLE phoneinfo_basic (
    idx             NUMBER(6) CONSTRAINT pb_idx_pk PRIMARY KEY,
    fr_name         VARCHAR2(20) CONSTRAINT pb_fn_nn NOT NULL,
    fr_phonenumbet  VARCHAR2(20) CONSTRAINT pb_fp_nn NOT NULL,
    fr_email        VARCHAR2(20),
    fr_address      VARCHAR2(20),
    fr_regdate      DATE DEFAULT sysdate
);

COMMENT ON COLUMN phoneinfo_basic.fr_name IS '친구 이름';
COMMENT ON COLUMN phoneinfo_basic.fr_phonenumbet IS '친구 전화번호';
COMMENT ON COLUMN phoneinfo_basic.fr_email IS '친구 이메일';
COMMENT ON COLUMN phoneinfo_basic.fr_address IS '친구 주소';
COMMENT ON COLUMN phoneinfo_basic.fr_regdate IS '등록 시간';


CREATE TABLE phoneinfo_univ (
    idx         NUMBER(6) CONSTRAINT pu_idx_pk PRIMARY KEY,
    fr_u_major  VARCHAR2(20) DEFAULT 'N' CONSTRAINT pu_fum_nn NOT NULL,
    fr_u_year   NUMBER(1) DEFAULT '1' CONSTRAINT pu_fuy_ck
                                      CHECK ( fr_u_year > 0 AND fr_u_year < 5 ) NOT NULL,
    fr_ref      NUMBER(7) CONSTRAINT pu_fr_fk REFERENCES phoneinfo_basic ( idx ) NOT NULL
);

COMMENT ON COLUMN phoneinfo_univ.fr_u_major IS '대학 친구의 전공 정보';
COMMENT ON COLUMN phoneinfo_univ.fr_u_year IS '대학 친구의 학년';
COMMENT ON COLUMN phoneinfo_univ.fr_ref IS '친구의 기본 정보 외래키';


CREATE TABLE phoneinfo_com (
    idx           NUMBER(6) CONSTRAINT pc_idx_pk PRIMARY KEY,
    fr_c_company  VARCHAR2(20) DEFAULT 'N' CONSTRAINT pc_fcc_nn NOT NULL,
    fr_ref        NUMBER(6) CONSTRAINT pc_fr_fk REFERENCES phoneinfo_basic ( idx ) NOT NULL
);

COMMENT ON COLUMN phoneinfo_com.fr_c_company IS '회사 친구의 회사이름';
COMMENT ON COLUMN phoneinfo_com.fr_ref IS '친구의 기본 정보 외래키';