package course;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.Database;

// 데이터베이스의 Course 테이블에 접근하는 객체를 생성하는 클래스 
public class CourseDAO {
	
	// 각 객체가 사용할 커넥션 객체 선언
	Connection con = null;
	
	// 각 객체가 사용할 statement 객체 선언 
	PreparedStatement pstmt = null;
	
	// 각 객체가 사용할 resultSet 객체 선언
	ResultSet rs 	= null;
	
	// 각 객체가 사용할 SQL 구문 선언
	String sql = null;

	// 모든 객체가 공통으로 가져야 하는 부분은 생성되자마자 실행되게 생성자에 만들어 준다.
	// 객체가 생성됨과 동시에 데이터베이스에 접속하도록 생성자를 선언함
	public CourseDAO() {
		con = Database.oracleConnect();
	}  // 아래 코드를 따로 클래스로 빼두어서 코드를 쭐임
//		// DB 접속 부분 
//		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
//		String db_id 		= "dba_user";
//		String db_pw	 	= "6546";
//	
//		try {
//			// jdbc 로드
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			
//			// 데이터베이스 접속
//			con = DriverManager.getConnection(url, db_id, db_pw);
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//	}
	
	// 	Bean객체 그대로 들고 올 수도 있다.(대신 객체에 넣어주고 빼주고 작업이 조금 귀찮다. 하지만 이게 제일 정확한 방법임)
	
	// COURSE 테이블에 데이터를 삽입하는 메소드
	public int courseRegist(CourseBean course) {
		
			int result = 0;
			// 삽입 sql 구문
			// INSERT INTO 테이블명(컬럼명) || 테이블명 VALUES (v1, v2, ...);
			sql = "INSERT INTO COURSE VALUES (?, ?, ?, ?, ?)";
			
			try {
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
					try {
						// statement에 sql 구문 생성
						pstmt = con.prepareStatement(sql);
						// pstmt의 ?에 각 데이터를 set 시킴
						
						// course 객체의 getter 메소드를 이용해서 인스턴스 값을 가져온다.
						pstmt.setString	(1, course.getCourse_id());
						pstmt.setString	(2, course.getTitle());
						pstmt.setInt		(3, course.getC_number());
						pstmt.setString	(4, course.getProfessor_id());
						pstmt.setInt		(5, course.getCourse_fees());
						
						// sql 구문을 실행 
						// UPDATE 구문이기 때문에 executeUpdate() 메소드 사용
						// 반환값을 ResultSet으로 받지 않는다.
						pstmt.executeUpdate();
									
						} catch(Exception e) {
							e.printStackTrace();
							// 데이터베이스 오류 발생시 -1 반환
							result = -1;
						} finally {
								Database.close(pstmt, con);
						}
					// 아래 코드를 클래스로 빼두어서 위 코드로 쭐임
//							try {
//								// 사용 완료 후 객체 닫음
//								if(pstmt != null) pstmt.close();
//							} catch(Exception e) {
//								e.printStackTrace();
//							}
//							
//						}
					}
				return result;
				} // end of SELCET method
	
		// COURSE 테이블 리스트를 출력 하는 메소드
		public ArrayList<CourseBean> courseList() {
			
			// 검색한 COURSE 테이블의 데이터를 저장할 리스트 생성 
			ArrayList<CourseBean> list = new ArrayList<CourseBean>();
		
			// SELECT sql 문
			sql = "SELECT * FROM COURSE";
		
			try {
			
				// sql문 생성
				pstmt = con.prepareStatement(sql);
				
				// SELECT문 결과를 ResultSet에 담아온다.
				rs = pstmt.executeQuery();
				
				// rs의 다음 커서가 존재하는 동안 rs를 읽어서 list에 저장
				while(rs.next()) {
					// 각각의 행을 담을 Course 객체 생성
					CourseBean course = new CourseBean();
					//┣──(객체를 만들때부터 바로 선언해도 상관없다. ex) CourseBean course = new CourseBean(rs.getString(1), ...)
					// 불러온 rs 행의 데이터를 course 객체에 저장(순서대로)
					course.setCourse_id		(rs.getString	(1));
					course.setTitle				(rs.getString	(2));
					course.setC_number		(rs.getInt		(3));
					course.setProfessor_id	(rs.getString	(4));
					course.setCourse_fees	(rs.getInt		(5));
					// course 객체를 list에 추가						  ↑ 순서
					list.add(course);
					
				}
			
			} catch (Exception e) {
				e.printStackTrace();
				list  = null;
			} finally {
//////////////////////////////////////////////////
//				사용이 완료된 객체 close
//				try {
//					if(rs != null)			rs.close();
//					if(pstmt != null)	pstmt.close();
//				} catch (Exception e) { 
//					e.printStackTrace();
//				}
/////////////////////////////////////////////////
//				위 주석 코드를 클래스를 따로 만들어서 한줄로 쭐였다.
				
				// 사용이 완료된 객체 close
				Database.close(rs, pstmt, con);
			}
			return list;
			
		}
	
} // end of class