package model.service;

// static import 작성 
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import model.dao.MemberDAO;
import model.vo.Member;

public class MemberService {
/* Service는 데이터에 대한 비즈니스 로직(가공처리) 수행 및 
 * DB와의 연결 정보를 가지고 있는 Connection객체를 생성하고
 * 여러 DAO를 호출하여 하나의 요청에 대한  
 * 여러 번의 DB 접근 / 갱신을 진행하며 
 * 그것을 하나의 트랜잭션으로 묶어 처리하는 클래스
 * */
	
/* Service 클래스에서 메소드 작성하는 방법
 * 1) Controller에서 데이터를 전달 받는다. (매개변수 활용)
 * 2) Connection 객체를 생성한다.
 * 3) DAO객체를 생성한다.
 * 4) Connection 객체와 Controller에서 전달 받은 데이터를 
 *	     알맞은 DAO 메소드로 전달한다. (호출)
 * 5) DAO 수행 결과를 가지고 필요시  데이터 가공 및 트랜잭션 처리
 * */
	
	// 1_6. 새로운 회원 정보 추가용 Service
	// 매개변수로 Controller로 부터 데이터를 전달 받는다. 
	/**
	 * 새로운 회원정보 추가용 Service
	 * @param member : Member
	 * @return result :int 
	 * @throws Exception
	 */
	public int insertMember(Member member) throws Exception { // DML구문은 수행결과 ->int형으로 반환
		
		// 1_7. DB 연결을 위한 Connection 객체 생성 구문의 
		// 		중복되는 코드를 JDBCTemplate에 작성 
	
		// 1_8. Connection 객체 생성 (얻어오기)
		//Connection conn = JDBCTemplate.getConnection();
		
		// * static import 사용 
		// -> static 필드 또는 메소드를 한 클래스에서 지속적으로  호출해야 하는 경우,
		//	     해당 static 호출에 필요한 클래스명을 생략할 수 있게 해주는 기능 
		
		Connection conn = getConnection();
		
		// 1_9. DBMS에 접속하여 데이터를 전송하고 결과 값을 전달 받을 
		// 		MemberDAO객체 생성 및 클래스 작성 
		
		MemberDAO memberDAO = new MemberDAO();
		
		// 1_13. 새로운 회원 정보 삽입을 위한 
		// 		 MemberDAO.insertMember(conn, member)메소드 작성 
		
		// 1_23. 매개변수로 Connection 객체와 
		//		 Controller에서 전달 받은 값을 DAO로 전달하고
		// 		  회원 정보 삽입 결과를 반환 받아 저장
		int result = memberDAO.insertMember(conn, member);
		
		// 1_24. DB 처리 결과에 따라 트랜잭션 처리
		if(result > 0 ) {// 삽입 성공 시 
			commit(conn);
		}else {// 삽입 실패 시 
			rollback(conn);
		}
		// 1_25. DB 처리 결과를 Controller로 반환
		return result;
		
	}
	
	// 2_2. 전체 회원 정보 조회용 Service
	public List<Member> selectAll() throws Exception{
		
		// 2_3. JDBCTemplate에서 Connection객체를 얻어옴
		Connection conn = getConnection();
		
		// 2_4. MemberDAO 객체 생성
		MemberDAO memberDAO = new MemberDAO();
		
		// 2_5. Connection 객체를 전달 받아 
		// 		모든 회원정보를 조회하고 반환 할 메소드 
		//		MemberDAO.selectAll(conn) 작성
		
		// 2_16. MemberDAO.selectAll(conn) 호출 후 반환 값 저장
		List<Member>mList = memberDAO.selectAll(conn);
		
		// 2_17. 별도의 트랜잭션 처리가 필요하지 않으므로 
		// 		  바로 Controller로 반환
		return mList;
		
	}
	
	// 3_8. 입력 받은 성별의 회원 정보 조회용 Service
	public List<Member> selectGender(char gender) throws Exception {
		
		// 3_9. Connection 객체 얻오오기 + DAO 객체 생성
		Connection conn = getConnection();
		MemberDAO memberDAO = new MemberDAO();
		
		// 3_10. Connection과 Controller에서 전달 받은 값을 
		// 		  매개변수로 전달 받아 회원 정보를 조회하는 
		// 		 MemberDAO.selectGender(conn, gen)
				
		// 3_21. MemberDAO.selectGender(conn,gen) 호출 후 변환 값 저장
		List<Member> mList = memberDAO.selectGender(conn, gender);
		
		// 3_22. 별도의 트랜잭션 처리가 필요하지 않으므로 바로 반환.
		return mList;
	}
	
	public List<Member> selectId(String Id) throws Exception {
		Connection conn = getConnection();
		MemberDAO memberDAO = new MemberDAO();
		
		//(1) SQL구문에 사용될 id 데이터 가공, 쿼리문은 like ?
		//List<Member> mList = memberDAO.selectId(conn, "%"+Id+"%");
		
		//(2) 쿼리문  '%' || ? || '%'
		//List<Member> mList = memberDAO.selectId(conn, Id);
		
		//return mList;
		
		// 참조변수 쓰지않고 바로 return도 가능~
		return memberDAO.selectId(conn, Id);
		
	}
	
	public List<Member> selectAddr(String Addr) throws Exception{
		Connection conn = getConnection();
		MemberDAO memberDAO = new MemberDAO();
		return memberDAO.selectAddr(conn,Addr);
	}
	
	// 4_5. 아이디 존재 여부 확인 Service
	public int checkMember(String memberId) throws Exception{
		
		// 4_6. Connection 얻어오기 + DAO 객체 생성
		Connection conn = getConnection();
		MemberDAO memberDAO = new MemberDAO(); 
		
		// 4_7. MemberDAO.checkMember(conn, memberId)메소드 작성
		
		// 4_17. MemberDAO.checkMember(conn, memberId)메소드  호출 후 반환값 저장
		int check = memberDAO.checkMember(conn, memberId);
		
		// 4_18. 별도의 트랜잭션 처리 없이 반환 
		return check;
			
		}
	
	// 4_29. 회원 정보 수정용  Service
	public int updateMember(int sel, String memberId, String input)throws Exception{
		
		// 4_30. Connection, DAO 생성
		Connection conn = getConnection();
		MemberDAO memberDAO = new MemberDAO();
		
		// 4_31. ★ 선택된 서브 메뉴 각각에 대한 DAO 메소드를 만들지 않고
		// 		 하나의 DAO로 처리 하되, 
		// 		 수행할 SQL 구문을 구분해 줄 변수 선언
		String updateQuery = "updateMember" + sel;
		
		// 4_32. MemberDAO.updateMember(conn, updateQuery, memberId, input) 메소드 작성
		
		// 4_41. MemberDAO.updateMember(conn, updateQuery, memberId, input)호출 후 반환값 저장
		int result = memberDAO.updateMember(conn, updateQuery, memberId, input);
		
		// 4_42. 트랜잭션 처리
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		//(result>0)?commit(conn);:rollback(conn); // 삼항연산자 응용
		
		return result;
	}
	
	public int deleteMember(String memberId)throws Exception{
		Connection conn = getConnection();
		MemberDAO memberDAO = new MemberDAO();
		
		int result = memberDAO.deleteMember(conn, memberId);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	public String randomString() {
		String str = "";
		int random = 0;
		for(int i=0 ; i<6 ; ) {
			random = (int)(Math.random() * (('z'+1) - '0') ) + '0';
			
			if(random >= '0' && random <= '9' || 
				random >='A' && random <= 'Z' ||
				random >='a' && random <= 'z') {
				
				str += (char)random;
				i++;
			}
		}
		return str;
	}

	public void exitProgram() {
		// TODO Auto-generated method stub
		close(getConnection());
	}
	
	
}
