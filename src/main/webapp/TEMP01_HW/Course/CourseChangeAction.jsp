<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String course_id = request.getParameter("course_id");
		
		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw		= "6546";
		
		String sql = "SELECT * FROM COURSE WHERE course_id = ?";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4><%=course_id %> 과목 정보 수정</h4>
<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, course_id);
			
			ResultSet rs = pstmt.executeQuery();
		
			if(rs.next()){
				String title					= rs.getString(2);
				int c_number				= Integer.parseInt(rs.getString(3));
				String professor_id	= rs.getString(4);
				int course_fees			= Integer.parseInt(rs.getString(5));
		
%>
<h4>과목 정보 수정</h4>
<form method="POST" action="CourseChangeAction2.jsp">
		<table border="1">
					<tr>
							<td>과목코드</td>
							<td><%=course_id %><input type = "hidden" name = "course_id" value="<%=course_id%>"></td>
					</tr>
					<tr>
							<td>과목명</td>
							<td><input type = "text" name = "title" value="<%=title%>"></td>
					</tr>
					<tr>
							<td>학점수</td>
							<td><input type = "text" name = "c_number" value="<%=c_number%>"></td>
					</tr>
					<tr>
							<td>담당교수번호</td>
							<td><input type = "text" name = "professor_id" value="<%=professor_id%>"></td>
					</tr>
					<tr>
							<td>추가수강료</td>
							<td><input type = "text" name = "course_fees" value="<%=course_fees%>"></td>
					</tr>
					<tr align="center">
							<td colspan="2">
									<input type="submit" value="수정">
									<input type="reset" value="취소">
							</td>
					</tr>
		</table>
</form>
<%
			} else {
%>
<%=course_id %><h4>과목코드가 존재하지 않습니다.</h4>
<%
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();

%>
<h4>데이터베이스 수정에 실패했습니다.</h4>
<% } %>

</body>
</html>