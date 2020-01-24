--------------------------------------------------
-------------- MEMBER 관련	----------------
--------------------------------------------------
DROP TABLE MEMBER;
DROP SEQUENCE SEQ_UNO;

-- MEMBER 테이블 생성
CREATE TABLE MEMBER (
  MEMBER_NO NUMBER PRIMARY KEY,
  MEMBER_ID VARCHAR2(30) NOT NULL,
  MEMBER_PWD VARCHAR2(100) NOT NULL,
  MEMBER_NM VARCHAR2(15) NOT NULL,
  MEMBER_PHONE VARCHAR2(13),
  MEMBER_EMAIL VARCHAR2(100),
  MEMBER_ADDR VARCHAR2(100),
  MEMBER_INTEREST VARCHAR2(100),
  MEMBER_ENROLL_DATE DATE DEFAULT SYSDATE,
  MEMBER_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(MEMBER_STATUS IN('Y', 'N')) ,
  MEMBER_GRADE VARCHAR2(1) DEFAULT 'G' CHECK(MEMBER_GRADE IN('A', 'G')) 
);

-- 멤버 테이블 컬럼별 코멘트
COMMENT ON COLUMN MEMBER.MEMBER_NO IS '회원 번호';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NM IS '회원 이름';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '전화번호(- 포함)';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEMBER_ADDR IS '주소';
COMMENT ON COLUMN MEMBER.MEMBER_INTEREST IS '관심사';
COMMENT ON COLUMN MEMBER.MEMBER_ENROLL_DATE IS '가입일';
COMMENT ON COLUMN MEMBER.MEMBER_STATUS IS '회원 상태(Y:정상, N:탈퇴)';
COMMENT ON COLUMN MEMBER.MEMBER_GRADE IS '회원 등급(A:관리자 ,G:일반회원)';

-- 회원 번호 시퀀스 생성
CREATE SEQUENCE SEQ_UNO;


-- 샘플 데이터 삽입
INSERT INTO MEMBER 
VALUES (SEQ_UNO.NEXTVAL, 'admin', 'admin', '김관리', '010-1111-1111', 'admin@kh.or.kr', '서울시 강남구 역삼동', NULL, SYSDATE, DEFAULT, 'A');

INSERT INTO MEMBER 
VALUES (SEQ_UNO.NEXTVAL, 'user01', 'pass01', '홍길동', '010-1234-1234', 'user01@kh.or.kr', '서울시 양천구 목동', NULL, SYSDATE, DEFAULT, DEFAULT);

COMMIT;





--------------------------------------------------
--------------     NOTICE 관련	-------------------
--------------------------------------------------

-- MEMBER 테이블에서 누락된 MEMBER_ID UNIQUE 제약 조건
ALTER TABLE MEMBER
ADD UNIQUE(MEMBER_ID);

DROP TABLE NOTICE;
DROP SEQUENCE SEQ_NNO;

CREATE TABLE NOTICE(
  NOTICE_NO NUMBER PRIMARY KEY,
  NOTICE_TITLE VARCHAR2(100) NOT NULL,
  NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
  NOTICE_WRITER VARCHAR2(30) REFERENCES MEMBER(MEMBER_ID) NOT NULL,
  NOTICE_COUNT NUMBER DEFAULT 0,
  NOTICE_CREATE_DT DATE DEFAULT SYSDATE,
  NOTICE_MODIFY_DT DATE DEFAULT SYSDATE,
  NOTICE_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(NOTICE_STATUS IN ('Y','B','N'))
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지사항 번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.NOTICE_WRITER IS '공지사항 작성자(회원 아이디)';
COMMENT ON COLUMN NOTICE.NOTICE_COUNT IS '공지사항 조회 수';
COMMENT ON COLUMN NOTICE.NOTICE_CREATE_DT IS '공지사항 작성일';
COMMENT ON COLUMN NOTICE.NOTICE_MODIFY_DT IS '공지사항 수정일';
COMMENT ON COLUMN NOTICE.NOTICE_STATUS IS '공지사항 상태(Y:정상, B:블라인드, N:삭제)';


CREATE SEQUENCE SEQ_NNO;

INSERT INTO NOTICE
VALUES (SEQ_NNO.NEXTVAL, '첫 번째 공지사항입니다.', '환영합니다.', 'admin', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO NOTICE
VALUES (SEQ_NNO.NEXTVAL, '두 번째 공지사항입니다.', '환영합니다.', 'admin', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO NOTICE
VALUES (SEQ_NNO.NEXTVAL, '세 번째 공지사항입니다.', '환영합니다.', 'admin', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO NOTICE
VALUES (SEQ_NNO.NEXTVAL, '네 번째 공지사항입니다.', '환영합니다.', 'admin', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

COMMIT;


-------------------------------------------------------------- BOARD 관련 -------------------------------------------------------------------------------

DROP TABLE CATEGORY;
DROP TABLE BOARD_TYPE;
DROP TABLE BOARD;
DROP SEQUENCE SEQ_BNO;



----------------------------------------------------
------------------  CATEGORY   --------------   
----------------------------------------------------

CREATE TABLE CATEGORY(
  CATEGORY_CD NUMBER PRIMARY KEY,
  CATEGORY_NM VARCHAR2(30) CHECK(CATEGORY_NM IN('운동', '영화', '음악',  '요리', '게임', '기타'))  
);

INSERT INTO CATEGORY VALUES(10, '운동');
INSERT INTO CATEGORY VALUES(20, '영화');
INSERT INTO CATEGORY VALUES(30, '음악');
INSERT INTO CATEGORY VALUES(40, '요리');
INSERT INTO CATEGORY VALUES(50, '게임');
INSERT INTO CATEGORY VALUES(60, '기타');

COMMIT;

SELECT * FROM CATEGORY;

----------------------------------------------------
-------------  BOARD_TYPE   ---------------   
----------------------------------------------------

CREATE TABLE BOARD_TYPE(
    BOARD_CD NUMBER PRIMARY KEY,
    BOARD_NM VARCHAR2(50) NOT NULL
);

INSERT INTO BOARD_TYPE VALUES(1, '자유게시판');
INSERT INTO BOARD_TYPE VALUES(2, '질문게시판');

COMMIT;

SELECT * FROM BOARD_TYPE;


----------------------------------------------------
--------------------- BOARD -------------------   
----------------------------------------------------
CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(300) NOT NULL,
    BOARD_CONTENT CLOB NOT NULL,
    BOARD_COUNT NUMBER DEFAULT 0,
    BOARD_CREATE_DT DATE DEFAULT SYSDATE,
    BOARD_MODIFY_DT DATE DEFAULT SYSDATE,
    BOARD_STATUS CHAR(1) DEFAULT 'Y' CHECK(BOARD_STATUS IN ('Y','B','N')),
    BOARD_WRITER NUMBER REFERENCES MEMBER NOT NULL,
    BOARD_CATEGORY NUMBER REFERENCES CATEGORY NOT NULL,
    BOARD_TYPE NUMBER REFERENCES BOARD_TYPE NOT NULL
);

CREATE SEQUENCE SEQ_BNO;



INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '첫 번째 게시글 입니다.', '게시글 TEST1.', 
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 10, 1);
            
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '두 번째 게시글 입니다.', '게시글 TEST2.', 
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 20, 1);

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '세 번째 게시글 입니다.', '게시글 TEST3.', 
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 30, 1);            
            
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '네 번째 게시글 입니다.', '게시글 TEST4.', 
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 40, 1);

INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '다섯 번째 게시글 입니다.', '게시글 TEST5.', 
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 50, 1);
            
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '여섯 번째 게시글 입니다.', '게시글 TEST6.', 
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 50, 2);
            
INSERT INTO BOARD
VALUES (SEQ_BNO.NEXTVAL, '일곱 번째 게시글 입니다.', '게시글 TEST7.', 
            DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 50, 1);
            
COMMIT;

SELECT * FROM BOARD;

BEGIN
    FOR N IN 1..500 LOOP
    
        INSERT INTO BOARD
        VALUES (SEQ_BNO.NEXTVAL,
                    N || ' 번째 게시글',
                    N || ' 번째 게시글입니다.',
                    DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 
                    CEIL(DBMS_RANDOM.VALUE(1,6)) * 10,
                    1);
    END LOOP;
END;
/

----------------------------------------------------
--------------   REPLY 관련         ----------------- 
----------------------------------------------------

CREATE TABLE REPLY(
  REPLY_NO NUMBER PRIMARY KEY,
  REPLY_CONTENT VARCHAR2(400) NOT NULL,
  BOARD_ID NUMBER REFERENCES BOARD NOT NULL,
  REPLY_WRITER NUMBER REFERENCES MEMBER NOT NULL,
  REPLY_CREATE_DT DATE DEFAULT SYSDATE,
  REPLY_MODIFY_DT DATE DEFAULT SYSDATE,
  REPLY_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (REPLY_STATUS IN ('Y', 'N'))
);

CREATE SEQUENCE SEQ_RNO;


----------------------------------------------------
------------- ATTACHMENT 관련   --------------   
----------------------------------------------------
DROP TABLE ATTACHMENT;

CREATE TABLE ATTACHMENT (
  FILE_NO NUMBER PRIMARY KEY,
  BOARD_ID NUMBER REFERENCES BOARD NOT NULL,
  FILE_ORIGIN_NAME VARCHAR2(255) NOT NULL,
  FILE_CHANGE_NAME VARCHAR2(255) NOT NULL,
  FILE_PATH VARCHAR2(1000) NOT NULL,
  FILE_UPLOAD_DATE DATE DEFAULT SYSDATE,
  FILE_LEVEL NUMBER,
  FILE_DOWNLOAD_COUNT NUMBER DEFAULT 0,
  FILE_STATUS CHAR(1) DEFAULT 'Y'
);

CREATE SEQUENCE SEQ_FID;


-------------------------------------------
-- dba 계정으로 접속
grant create view to server;
-------------------------------------------

CREATE OR REPLACE VIEW V_REPLY AS
SELECT REPLY_NO, REPLY_CONTENT, BOARD_ID, MEMBER_ID, REPLY_MODIFY_DT 
FROM  REPLY JOIN BOARD ON(BOARD_ID = BOARD_NO) JOIN MEMBER ON(REPLY_WRITER = MEMBER_NO)
WHERE REPLY_STATUS='Y'
ORDER BY REPLY_NO DESC;

