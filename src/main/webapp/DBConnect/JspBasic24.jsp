<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String dept_id 	= request.getParameter("dept_id");
		
		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		String sql = "DELETE FROM DEPARTMENT WHERE  dept_id = ?";
		// 테이블 명 : DEPARTMENT
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= dept_id %> 데이터 삭제</title>
</head>
<body>
<%
		try {
			// jdbc  driver 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 접속															  //(접속 기준1, 2, 3)
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			
			// ?로 했기때문에 PreparedStatement로 쓰는것.
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dept_id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
%>			
<h4><%= dept_id %> 데이터를 삭제했습니다.</h4>
<%
			} catch(Exception x) {
				x.printStackTrace();
%>
<h4><%= dept_id %> 데이터 삭제에 실패했습니다.</h4>
<%
		}
%>		

</body>
</html>