-- ��ȸ�� ������ �Խù� ��ȸ
SELECT  BOARD_NO, 
        BOARD_TITLE, 
        BOARD_CONTENT, 
        BOARD_COUNT, 
        BOARD_MODIFY_DT,                
        BOARD_TYPE,
        MEMBER_ID,
        CATEGORY_NM
FROM BOARD
JOIN MEMBER ON (BOARD_WRITER = MEMBER_NO)
JOIN CATEGORY ON (BOARD_CATEGORY = CATEGORY_CD)
WHERE BOARD_STATUS = 'Y';


-- VIEW ����
CREATE OR REPLACE VIEW V_BOARD AS 
SELECT  BOARD_NO, 
        BOARD_TITLE, 
        BOARD_CONTENT, 
        BOARD_COUNT, 
        BOARD_MODIFY_DT,                
        BOARD_TYPE,
        MEMBER_ID,
        CATEGORY_NM
FROM BOARD
JOIN MEMBER ON (BOARD_WRITER = MEMBER_NO)
JOIN CATEGORY ON (BOARD_CATEGORY = CATEGORY_CD)
WHERE BOARD_STATUS = 'Y'
ORDER BY BOARD_NO DESC;


-- ORA-01031: insufficient privileges
-- -> VIEW ���� ������ ���� ��� ��Ÿ���� ����
-- ������ �������� �����Ͽ� VIEW���� ���� �ο�
GRANT CREATE VIEW TO server;

SELECT * FROM V_BOARD WHERE BOARD_TYPE = 1;

-- BOARD ��� ��ȸ �� LIMIT��ŭ�� ������ �߶� ��ȸ

-- V_BOARD���� ROWNUM�� 1 ~ 5 ���� �̰� 
-- �Խ��� Ÿ���� 1�� ���� 
-- ROWNUM, �۹�ȣ, ������, ��ȸ�� 
-- ������, �ۼ���, ī�װ��� ��ȸ
SELECT RNUM, BOARD_NO, BOARD_TITLE, BOARD_COUNT, BOARD_MODIFY_DT, MEMBER_ID, CATEGORY_NM
FROM ( SELECT ROWNUM RNUM, BOARD_NO, 
                        BOARD_TITLE, 
                        BOARD_COUNT, 
                        BOARD_MODIFY_DT, 
                        MEMBER_ID, 
                        CATEGORY_NM, 
                        BOARD_TYPE 
                        FROM V_BOARD WHERE BOARD_TYPE=1                   
                        )
WHERE RNUM BETWEEN 1 AND 5
;
-- ROWNUM�� RESULTSET�� �� ������ ���� �Ű����� ���ڵ�


BEGIN
    FOR N IN 1..500 LOOP
    
        INSERT INTO BOARD
        VALUES (SEQ_BNO.NEXTVAL,
                    N || ' ��° �Խñ�',
                    N || ' ��° �Խñ��Դϴ�.',
                    DEFAULT, DEFAULT, DEFAULT, DEFAULT, 1, 
                    CEIL(DBMS_RANDOM.VALUE(1,6)) * 10,
                    1);
    END LOOP;
END;
/




