package department;

import java.sql.*;  
import java.util.ArrayList;

public class DepartmentDAO {
		
		// 3. 생성자 안에 있으면 지역 변수라서 글로벌 변수로 선언을 미리 해준다.(메소드에서 접근 가능하게 하기 위해서)
		Connection con 				= null;
		
		// 4.
		PreparedStatement pstmt = null;
		ResultSet rs 						= null;
		String sql 							= null;
	
		// 중복 되는 코드들은 생성자로 만들어준다. 객체가 생성되자마자 만들어짐
		public DepartmentDAO() {
			// 1.
			String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String db_id 		= "dba_user";
			String db_pw 	= "6546";
			
			// 2.
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection(url, db_id, db_pw);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	
		public int departmentInsert(String dept_id, String dept_name, String dept_tel) {
			
//			String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
//			String db_id 		= "dba_user";
//			String db_pw 	-= "6546";

			sql = "INSERT INTO DEPARTMENT VALUES (?, ?, ?)";// 삽입 하는 문 
			try {
				
//				Class.forName("oracle.jdbc.driver.OracleDriver");
				
//				 3. 지역변수로 선언되있기 때문에 con에 접근할 수 없다.
//				Connection con = DriverManager.getConnection(url, db_id, db_pw);
			
				// 4.
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dept_id);			// 1번째 물음표에 dept_id
				pstmt.setString(2, dept_name);	// 2번째 물음표에 dept_name
				pstmt.setString(3, dept_tel);		// 3번째 물음표에 dept_tel	
			
				pstmt.executeUpdate();
				
				// 연결 해제
//				pstmt.close();
//				con.close();
				
				} catch(Exception e) {
					e.printStackTrace();
					return 1;
				} finally {
					try {
						if(pstmt != null) pstmt.close();
						
					} catch(Exception e) { 
						e.printStackTrace();
					}
				}
			
			return 0;
		}
		// departmentDelete 삭제 메소드
		public int departmentDelete(String dept_id) {
			
//			String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
//			String db_id 		= "dba_user";
//			String db_pw 	= "6546";
			
			// 4.
			sql = "DELETE FROM DEPARTMENT WHERE  dept_id = ?";
			
			try {
//				Class.forName("oracle.jdbc.driver.OracleDriver");	
//				Connection con = DriverManager.getConnection(url, db_id, db_pw);
				
				// 4.
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dept_id);
				
				pstmt.executeUpdate();
				
//				pstmt.close();
//				con.close();
				
			} catch(Exception x) {
				x.printStackTrace();
				return 1;
				
			} finally {
				try {
						if(pstmt != null) pstmt.close();
				} catch(Exception e) {
						e.printStackTrace();
				}
			}
			return 0;
			
		}
		public ArrayList<DepartmentBean> departmentList() {
			/*
			// ArrayList : 데이터타입 제약이 없다.
//			ArrayList<int> li = new ArrayList<int>(10); 					// <> 안에는 객체만 올 수 있다. 데이터 타입은 올 수 없다
			ArrayList<Integer> li = new ArrayList<Integer>(10); 	// 정수형 데이터 타입을 넣고 싶으면 Integer을 넣어 줘야 한다.
			//					↑ 어떠한 타입만 배열에 오게 할 수 있는지 지정하는 것.
			li.add(1);
//			li.add("hi"); X(Integer라 정수형만 올 수 있음)
			*/
			// 다형성이 적용되서 부모 클래스로 만들 수도 있다.
//			List<DepartmentBean> list = new ArrayList<DepartmentBean>();
			ArrayList<DepartmentBean> list = new ArrayList<DepartmentBean>();
			sql = "SELECT * FROM DEPARTMENT";
			
			try {
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					// 반복할때마다 객체를 생성되게 해줘야 한다.(새로운 주소를 받게 해줘야함)
					while(rs.next()) {
						DepartmentBean bean = new DepartmentBean();
						bean.setDept_id(rs.getString(1));
						bean.setDept_name(rs.getString(2));
						bean.setDept_tel(rs.getString(3));
						
						list.add(bean);
					}
					
			} catch(Exception e) {
					e.printStackTrace();
					return null;
			} finally {
						try {
								if(rs != null) rs.close();
								if(pstmt != null) pstmt.close();
							} catch(Exception e) {
								e.printStackTrace();
					}
			}
			
			return list;
		}
	}
