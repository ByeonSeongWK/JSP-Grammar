<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- INSERT 문 -->
    <%@ page import="java.sql.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String dept_id 		= request.getParameter("dept_id"); // 전송 받은 값(dept_id)을 먼저 저장 시켜준다.
		String dept_name = request.getParameter("dept_name");
		String dept_tel 		= request.getParameter("dept_tel");

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id = "dba_user"; // 접속 아이디
		String db_pw = "6546";	  // 접속 패스워드

		String sql = "INSERT INTO DEPARTMENT VALUES (?, ?, ?)";// 삽입 하는 문 
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
		
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dept_id);			// 1번째 물음표에 dept_id
			pstmt.setString(2, dept_name);	// 2번째 물음표에 dept_name
			pstmt.setString(3, dept_tel);		// 3번째 물음표에 dept_tel	
		
			pstmt.executeUpdate();
			
			// 연결 해제
			pstmt.close();
			con.close();
			
			out.println("<h4>추가에 성공했습니다.</h4>");
			
			} catch(Exception e) {
				e.printStackTrace();
				out.println("<h4>추가에 실패했습니다.</h4>");
			}
%> 

</body>
</html>