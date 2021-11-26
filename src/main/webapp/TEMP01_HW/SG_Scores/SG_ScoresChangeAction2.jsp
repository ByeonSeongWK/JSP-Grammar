<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String student_id 			= request.getParameter("student_id");
		String course_id 			= request.getParameter("course_id");
		int score 						= Integer.parseInt(request.getParameter("score"));
		String grade 					= request.getParameter("grade");
		String score_assigned	= request.getParameter("score_assigned");

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id = "dba_user";
		String db_pw = "6546";
		
		String sql = "UPDATE SG_SCORES SET course_id = ?, score = ?, grade = ?, score_assigned = ? WHERE student_id = ?";
%>
<!DOCTYPE html>
<html>
<head>
<style>
		a{
		display : block;
		text-decoration : none;
		color : #999;
		font-weight : bold;
		}
</style>
<meta charset="UTF-8">
<title><%= student_id %> - 수강 정보 수정</title>
</head>
<body>
<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, course_id);
			pstmt.setInt(2, score);
			pstmt.setString(3, grade);
			pstmt.setString(4, score_assigned);
			pstmt.setString(5, student_id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
%>
<h4><%=student_id %> - 의 데이터를  <%= course_id%>, <%= score%>, <%= grade%>, <%= score_assigned%> 으로 변경했습니다.</h4>
<a href="SG_ScoresView.jsp">초기화면으로</a>
<%
		} catch(Exception e) {
			e.printStackTrace();
%>
<h4>수강 정보 수정을 실패했습니다.</h4>
<a href="SG_ScoresView.jsp">초기화면으로</a>
<%
		}
%>
</body>
</html>