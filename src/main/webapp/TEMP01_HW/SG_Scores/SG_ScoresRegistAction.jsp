<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");
	
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 정보 추가</title>
<style>
		a{
		display : block;
		text-decoration : none;
		color : #999;
		font-weight : bold;
		}
</style>
</head>

<body>
<%
		String student_id 			= request.getParameter("student_id");
		String course_id 			= request.getParameter("course_id");
		int score 						= Integer.parseInt(request.getParameter("score"));
		String grade 					= request.getParameter("grade");
		String score_assigned 	= request.getParameter("score_assigned");
		
		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		String sql = "INSERT INTO SG_SCORES VALUES(?, ?, ?, ?, ?)";
		
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url, db_id, db_pw);
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, student_id);
		pstmt.setString(2, course_id);
		pstmt.setInt(3, score);
		pstmt.setString(4, grade);
		pstmt.setString(5, score_assigned);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
%>
<h4>추가에 성공했습니다. </h4>
<a href="SG_ScoresView.jsp">초기화면으로</a>
<%		
	} catch(Exception e) {
			e.printStackTrace();
%>			
<h4>추가에 실패했습니다.</h4>
<a href="SG_ScoresView.jsp">초기화면으로"</a>
<%
		}
%>

</body>
</html>