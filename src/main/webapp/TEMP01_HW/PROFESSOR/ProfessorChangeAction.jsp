<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String professor_id = request.getParameter("professor_id");
		
		String url			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		String sql = "SELECT * FROM PROFESSOR WHERE professor_id = ?";
		
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
		pstmt.setString(1, professor_id);
		
		ResultSet rs = pstmt.executeQuery();

		if(rs.next()) {
			String name 			= rs.getString(2);
			String position 		= rs.getString(3);
			String dept_id 		= rs.getString(4);
			String telephone 	= rs.getString(5);
			String email 			= rs.getString(6);
			String duty 			= rs.getString(7);
			String mgr 			= rs.getString(8);
	 %>
<h4>교수 정보 수정</h4>
<form	method="POST" action="ProfessorChangeAction2.jsp" name="idform">
		<table border="1">
					<tr>
							<td>교수번호</td>
							<td><%=professor_id %><input type="hidden" name="professor_id" value="<%= professor_id %>"></td>
					</tr>
					<tr>
							<td>교수명</td>
							<td><input type="text" name="name" value="<%= name %>"></td>
					</tr>
					<tr>
							<td>직위</td>
							<td><input type="text" name="position" value="<%= position %>"></td>
					</tr>
					<tr>
							<td>소속학과코드</td>
							<td><input type="text" name="dept_id" value="<%= dept_id %>"></td>
					</tr>
					<tr>
							<td>전화번호</td>
							<td><input type="text" name="telephone" value="<%= telephone %>"></td>
					</tr>
					<tr>
							<td>email주소</td>
							<td><input type="text" name="email" value="<%= email %>"></td>
					</tr>
					<tr>
							<td>직책명</td>
							<td><input type="text" name="duty" value="<%= duty %>"></td>
					</tr>
					<tr>
							<td>관리자번호</td>
							<td><input type="text" value="mgr" value="<%= mgr %>"></td>
					</tr>
					<tr align="center">
							<td colspan="2">
									<input type="submit" value = "수정" >
									<input type="reset" value = "취소">
							</td>
					</tr>
		</table>
</form>
<%
		} else {
%>
<h4><%=professor_id %> 교수번호가 존재하지 않습니다.</h4>
<%
		}
		rs.close();
		pstmt.close();
		con.close();
			
	} catch(Exception e) {
		e.printStackTrace();
%>
<h4>데이터베이스 접속에 실패했습니다.</h4>
<%
}
%>

</body>
</html>