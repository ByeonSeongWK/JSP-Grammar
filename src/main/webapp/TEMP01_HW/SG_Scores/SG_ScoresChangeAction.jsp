<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String student_id = request.getParameter("student_id");
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id = "dba_user";
		String db_pw = "6546";
		
		String sql = "SELECT * FROM SG_SCORES WHERE student_id = ?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 정보 수정</title>
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
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, student_id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				String course_id 			= rs.getString(2);
				int score 						= rs.getInt(3);
				String grade 					= rs.getString(4);
				String score_assigned	= rs.getString(5);
%>
<h4>수강 정보 수정</h4>
<form method = "POST" action = "SG_ScoresChangeAction2.jsp">
		<table border = "1">
						<tr>
								<td>학번</td>
								<td><%=student_id %><input type = "hidden" name = "student_id" value = "<%=student_id%>"></td>
						</tr>
						<tr>
								<td>과목코드</td>
								<td><input type = "text" name = "course_id" value = "<%=course_id%>"></td>
						</tr>
						<tr>
								<td>성적</td>
								<td><input type = "text" name = "score" value = "<%=score%>"></td>
						</tr>
						<tr>
								<td>등급</td>
								<td><input type = "text" name = "grade" value = "<%=grade%>"></td>
						</tr>
						<tr>
								<td>성적취득일자</td>
								<td><input type = "text" name = "score_assigned" value = "<%=score_assigned%>"></td>
						</tr>
						<tr>
								<td>
										<input type = "submit" value = "수정">
										<input type = "reset" value = "취소">								
								</td>
						</tr>
		</table>
</form>
<%
			} else {
%>
<h4><%= student_id %> - 수강정보가 존재하지 않습니다.</h4>
<a href="SG_ScoresView.jsp">초기화면으로</a>
<%
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
%>
<h4>데이터베이스 접속에 실패했습니다.</h4>
<a href="SG_ScoresView.jsp">초기화면으로</a>
<% } %>
</body>
</html>