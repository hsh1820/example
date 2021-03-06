/*
    DCL (DATA CONTROL LANGUAGE) : 데이터 제어 언어
    DML : 컬럼단에서 수정, 삭제, 삽입 
    DCL : 테이블단에서 접근권한 제어
    
    - 데이터베이스, 데이터베이스 객체에 대한 
        접근 권한을 제어(부여,회수) 하는 언어
        
    DCL -> GRANT(권한부여), REVOKE (권한회수)
    TCL -> COMMIT, ROLLBACK, SAVEPOINT      


*/
-- 권한은 크게 시스템, 객체 권한으로 나뉘어 있음

-- 시스템 권한 부여
-- 사용자에게 권한을 부여할 때 사용

/*
    [ 표기법 ]
    GRANT 권한1, 권한2, ...
    TO 사용자계정명;
    
    * 시스템 권한의 종류
    CREATE SESSION          : 데이터베이스 접속 권한
    CREATE TABLE             : 테이블 생성 권한
    CREATE VIEW              : 뷰 생성 권한
    CREATE SEQUENCE       : 시퀀스 생성 권한
    CREATE PROCEDURE     : 프로시져 함수 생성 권한    
    CREATE USER             : 계정 생성 권한
    DROP USER               : 계정 삭제 권한
    DROP ANY TABLE       : 임의의 테이블 삭제 권한
*/

/*
    계정의 종류
    1) 관리자 계정 (SYS AS SYSDBA, SYSTEM)
    데이터베이스의 생성과 관리를 담당하는 계정으로 
    모든 권한과 책임을 가지는 계정
    
    2) 사용자 계정 (EX) KH .. )
    데이터베이스에 대하여 질의, 갱신, 보고서 작성 등의 작업을 
    수행할 수 있는 계정으로 
    업무에 필요한 최소한의 권한만을 가지는 것을 원칙으로 함
*/


-- 테스트용 계정 SAMPLE 생성
CREATE USER sample IDENTIFIED BY sample;
--> CMD -> SQLPLUS실행
    --> sample 계정 로그인 
    -- user SAMPLE lacks CREATE SESSION privilege; logon denied
    --> 접속 권한이 없어서 로그인 불가능 상태
    
-- KH 계정으로 sample계정에 DB 접속 권한 부여
GRANT CREATE SESSION TO sample;
-- ORA-01031: insufficient privileges
-- 01031. 00000 -  "insufficient privileges"
-- 해당 계정은 권한을 부여할 권한이 없다는 오류
-- KH 계정에는 DB 접속 권한을 부여할 권한이 없어서 오류 발생

-- 관리자 계정으로 sample계정에 DB 접속 권한 부여
GRANT CREATE SESSION TO sample;
--> 접속권한 부여 성공
--> 다시 SQLPLUS 에서 SAMPLE 로그인
-- ORA-01031: insufficient privileges
--> 테이블 생성 권한이 없어서 에러 발생

-- 관리자 계정으로 테이블 생성 권한을 부여
GRANT CREATE TABLE TO sample;
--> 다시 SQLPLUS에서 테이블 생성
--> ORA-01950: no privileges on tablespace 'SYSTEM'

-- tablespace 테이블 스페이스 
-- 테이블, 뷰, 인덱스 등 DB 객체들이 저장되는 논리적 공간 
-- 테이블 스페이스 할당량 부여
-- ALTER USER sample QUOTA 2M ON SYSTEM;
--SAMPLE 유저에게 2MB의 공간을 할당하겠다
-- 다시 SQLPLUS에서 테이블 생성

----------------------------------------------------------------------

-- 객체 권한 부여

-- 객체 권한 : 특정 DB 객체를 조작(DML)할 수 있는 권한을 부여

/*
    [ 표기법 ]
    GRANT 권한종류 [ (컬럼명) ] | ALL 
    ON 객체명(EX)테이블명 | ROLE 이름 | PUBLIC 
    TO 사용자계정명
    
    * 객체 권한 종류
    [ 권한 종류 ]         [ 설정 객체 ]
    SELECT (조회)         TABLE, VIEW, SEQUENCE 
    INSERT (삽입)         TABLE, VIEW
    UPDATE                TABLE, VIEW
    DELETE                 TABLE, VIEW
    ALTER                  TABLE, SEQUENCE
    REFERENCES           TABLE
    INDEX                   TABLE 
    EXECUTE                PROCEDURE
*/


-- SQLPLUS에서 sample 계정으로 kh 계정의 EMPLOYEE 테이블 조회
SELECT * FROM KH.EMPLOYEE ;
-- ORA-00942: table or view does not exist
-- 접근 권한이 없어서 보이지 않는 상태

-- 관리자 계정으로 sample 계정에게 KH 계정의 EMPLOYEE 테이블 조회 권한 부여하기
GRANT SELECT ON KH.EMPLOYEE TO sample;

-- 권한 회수 ( REVOKE)
-- 관리자 계정으로 SAMPLE 에게 부여된
-- KH.EMPLOYEE 테이블 조회 권한을 회수 하기
REVOKE SELECT ON KH.EMPLOYEE from sample;
--> sample 계정으로 kh.employee 테이블 조회 해보기 --> 에러발생
--> 권한이 회수되어 에러발생

-- sample 게정 db 접속 권한 회수 
REVOKE CREATE SESSION FROM sample;

/*
    * ROLE : 사용자에게 허가할 수 있는 권한들의 집합.
            ROLE을 이용하면 권한 부여와 회수에 용이함.
            
    
    * CONNECT : 사용자가 데이터베이스에 접속 가능하도록 하기 위한
                        CREATE SESSION 권한이 작성되어있는 ROLE
                     CREATE SESSION 권한의 이름 단순화   
    
    * RESOURCE : CREATE 구문을 통한 객체 생성 권한과 
                        INSERT, UPDATE, DELETE 구문을 사용할 수 있는 권한을
                        모아놓은 ROLE
    ---> CONNECT, RESOURCE 만 있으면 기본적인 사용자 계정 권한                    
*/

-- 관리자 계정으로 sample 계정에 CONNECT, RESOURCE 계정에 ROLE 부여
GRANT CONNECT, RESOURCE TO sample;






----------------------------------------------------------------------


-- TCL( TRANSACTION CONTROL LANGUAGE) : 트랜잭션 제어 언어

-- TRANSACTION 
/*
    - 데이터베이스의 논리적 연산단위
    - 데이터 변경 사항을 묶어 하나의 트랜잭션에 담아 처리함.
    - 트랜잭션의 대상이 되는 SQL : INSERT, UPDATE, DELETE ( DML )
    == DML 이 트랜잭션의 연산단위가 되는 것
    
    * COMMIT / ROLLBACK 
    - COMMIT 또는 ROLLBACK 명령이 입력되기 전 까지는
    데이터 변경사항이 메모리 버퍼에 임시 저장되어 있는 상태로 존재 
    
    - COMMIT : 메모리 버퍼에 임시 저장된 데이터를 DB에 반영
    - ROLLBACK : 메모리 버퍼에 임시 저장된 데이터를 삭제하고
        마지막 COMMIT 상태로 돌아감
    - SAVEPOINT : 저장 지점을 정의하면 롤백 할 때 트랜잭션에 포함된 
    전체 작업을 롤백하는 것이 아닌 현 시점에서 지정한 SAVEPOINT 까지 트랜잭션 일부만 롤백
    --> 중간 저장

*/

    






                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
