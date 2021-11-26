<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 	// 1. java.sql.* import -->
<%@ page import="java.sql.*" %>
<%--sql에 모든 패키지 사용 --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		// 2. 사용할 DBMS - JDBC Drvier 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");

		// 3. 데이터 베이스 접속
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
							// 로컬 호스트 주소 // @ : 호스트 (127......은 로컬 호스트 주소이다.):포트번호:시드
		String db_id = "dba_user";
		String db_pw = "6546";
		Connection con = DriverManager.getConnection(url, db_id, db_pw);
							
		
		// 4. Connection으로 SQL문 생성
		Statement stmt = con.createStatement();
		// 입력 해주는 행위
		
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM DEPARTMENT WHERE dept_id =  ? ~ ?");
		pstmt.setString(1, "aa");// (몇 번째 자리, ?에 넣을 데이터)		// ↑ 완성되지 않은 sql문 
		pstmt.setInt(2, 1);
		
		// 5. SQL문 실행
		stmt.executeQuery("SELECT");
		stmt.executeUpdate("INSERT or UPDATE or DELETE");
		
		pstmt.executeQuery(); // 위ㅅ에서 완성 시켰기 때문에 () 안에 안넣는다.
		// -> ResultSet으로 반환
		pstmt.executeUpdate();
		
		// 6. SQL문 결과 처리
		ResultSet rs = pstmt.executeQuery();
		
		// ResultSet 객체의 모든 데이터 가져오기
		while(rs.next()) { // re에 다음 값이 있으면 반복 실행 없으면 종료
				String dept_id 		= rs.getString(1);	
				String dept_name = rs.getString(2);	
				String dept_tel 		= rs.getString(3);	
		}
		
		// 7. 연결해제
		// 데이터를 받아오는 작업이 다 끝난 후
		// 생성 순서 반대로 진행
		rs.close(); // ResultSet 닫기
		pstmt.close(); stmt.close();
		con.close();
		
%>

</body>
</html>