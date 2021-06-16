-- 1. phoneInfo_basic 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL

-- SELECT
-- basic 정보 출력
SELECT
    *
FROM
    phoneInfo_basic;

-- basic, univ, com 정보 출력  
SELECT
    *
FROM
    phoneInfo_basic  pb,
    phoneInfo_univ   pu,
    phoneInfo_com    pc
WHERE
        pb.idx = pu.fr_ref (+)
    AND pb.idx = pc.fr_ref (+)
ORDER BY
    pb.idx;

-- INSERT
-- basic 정보 입력
INSERT INTO phoneInfo_basic VALUES (1, 'A', '000-1111-1111', 'AAA@gmail.com', 'SEOUL', '20.05.10');
INSERT INTO phoneInfo_basic VALUES (2, 'B', '000-2222-2222', 'BBB@gmail.com', 'BUSAN', sysdate);
INSERT INTO phoneInfo_basic VALUES (3, 'C', '000-3333-3333', 'CCC@gmail.com', 'INCHEON', '19.10.25');
INSERT INTO phoneInfo_basic VALUES (4, 'D', '000-4444-4444', 'DDD@gmail.com', 'DAEJEON', '21.01.30');


-- UPDATE
-- idx 값이 2인 친구의 이메일과 주소를 변경
UPDATE phoneInfo_basic
SET
    fr_email = 'bbb@gmail.com',
    fr_address = 'INCHEON'
WHERE
    idx = 2;

-- basic 정보 전체 삭제    
DELETE FROM phoneInfo_basic;



-- 2. phoneInfo_univ 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL

-- INSERT
-- idx 값이 1과 4인 친구의 정보 입력
INSERT INTO phoneInfo_univ VALUES ( 1, 'ENGLISH', 3, 1 );
INSERT INTO phoneInfo_univ VALUES ( 2, 'MATH', 1, 4 );


-- SELECT
-- univ 정보 출력
SELECT
    *
FROM
    phoneInfo_univ;

-- basic, univ 정보 출력
SELECT
    *
FROM
    phoneInfo_basic  pb,
    phoneInfo_univ   pu
WHERE
        pb.idx = pu.fr_ref (+);

-- UPDATE
-- 이름이 D이고 대전에 사는 친구의 전공을 변경
UPDATE phoneInfo_univ
SET
    fr_u_major = 'KOREAN'
WHERE
    fr_ref = (
        SELECT
            idx
        FROM
            phoneInfo_basic
        WHERE
                fr_name = 'D'
            AND fr_address = 'DAEJEON'
    );


-- DELETE
-- 이름이 A이고 이메일 주소가 'AAA@gmail.com'인 친구 삭제
DELETE FROM phoneInfo_univ
WHERE
    fr_ref = (
        SELECT
            idx
        FROM
            phoneInfo_basic
        WHERE
                fr_name = 'A'
            AND fr_email = 'AAA@gmail.com'
    );

-- univ 정보 전체 삭제    
DELETE FROM phoneInfo_univ;


-- 3. phoneInfo_com 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL

-- INSERT
-- idx 값이 2와 3인 친구의 정보 입력
INSERT INTO phoneInfo_com VALUES ( 1, 'kakao', 2);
INSERT INTO phoneInfo_com VALUES ( 2, 'NAVER', 3);

-- com 정보 출력
SELECT
    *
FROM phoneInfo_com;

-- basic, com 정보 출력
SELECT
    *
FROM
    phoneInfo_basic  pb,
    phoneInfo_com   pc
WHERE
        pb.idx = pc.fr_ref (+);


-- UPDATE
-- idx 값이 3이고 NAVER에 다니는 친구의 회사를 변경
UPDATE phoneInfo_com
SET
    fr_c_company = 'Google'
WHERE
        fr_ref = 3
    AND fr_c_company = 'NAVER';
    
    
-- DELETE
-- kakao에 다니는 친구 삭제
DELETE FROM phoneInfo_com
WHERE
    fr_c_company = 'kakao';
    
-- com 정보 전체 삭제    
DELETE FROM phoneInfo_com;

ROLLBACK;