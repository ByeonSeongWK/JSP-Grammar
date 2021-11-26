<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id = "dba_user";
		String db_pw = "6546";
		
		String course_id		= request.getParameter("course_id");
		String title					= request.getParameter("title");
		int c_number				= Integer.parseInt(request.getParameter("c_number"));
		String professor_id	= request.getParameter("professor_id");
		int course_fees			= Integer.parseInt(request.getParameter("course_fees"));
	 	
		String sql = "INSERT INTO COURSE VALUES(?, ?, ?, ?, ?)";
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
		
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, course_id);
			pstmt.setString(2, title);
			pstmt.setInt(3, c_number);
			pstmt.setString(4, professor_id);
			pstmt.setInt(5, course_fees);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
%>
<script>
		alert('추가가 성공적으로 이루어 졌습니다.');
</script>
<% 

		} catch(Exception e) {
			e.printStackTrace();
%>
<script>
		alert('추가에 실패하였습니다.');
</script>
<%
		}
%>

</body>
</html>