<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String dept_id 	= request.getParameter("dept_id");
		
		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		String sql = "SELECT * FROM STUDENT WHERE dept_id = ?";
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 수정</title>
</head>
<body>
<h4><%=dept_id %> - 학생 정보 수정</h4>
<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dept_id);
			
			ResultSet rs = pstmt.executeQuery();
		
			if(rs.next()){
				int year					= rs.getInt(2);
				String student_id 	= rs.getString(3);		
				String name			= rs.getString(4);		
				String id_number	= rs.getString(5);		
				String addr 			= rs.getString(6);		
				String telephone	= rs.getString(7);		
				String email 			= rs.getString(8);		
				String status 		= rs.getString(9);		
				String i_date 		= rs.getString(10);		
%>
<h4>학생 정보 수정</h4>
<form method = "POST" action = "StudentChangeAction2.jsp">
		<table border = "1">
				<tr>
						<td>학과코드</td>
						<td><input type = "hidden" name = "dept_id" value = "<%=dept_id%>"></td>
				</tr>
				<tr>
						<td>학년</td>
						<td><input type = "text" name = "year" value = "<%=year%>"></td>
				</tr>
				<tr>
						<td>학번</td>
						<td><input type = "text" name = "student_id" value = "<%=student_id%>"></td>
				</tr>
				<tr>
						<td>성명</td>
						<td><input type = "text" name = "name" value = "<%=name%>"></td>
				</tr>
				<tr>
						<td>주민등록번호</td>
						<td><input type = "text" name = "id_number" value = "<%=id_number%>"></td>
				</tr>
				<tr>
						<td>주소</td>
						<td><input type = "text" name = "addr" value = "<%=addr%>"></td>
				</tr>
				<tr>
						<td>전화번호</td>
						<td><input type = "text" name = "telephone" value = "<%=telephone%>"></td>
				</tr>
				<tr>
						<td>email주소</td>
						<td><input type = "text" name = "email" value = "<%=email%>"></td>
				</tr>
				<tr>
						<td>재학상태</td>
						<td><input type = "text" name = "status" value = "<%=status%>"></td>
				</tr>
				<tr>
						<td>입학일자</td>
						<td><input type = "text" name = "i_date" value = "<%=i_date%>"></td>
				</tr>
				<tr>
						<td>
							<input type = "submit" value = "수정" >
							<input type = "reset" value = "취소" >
						</td>
				</tr>
		</table>
</form>
<%
			} else {
%>
<%= dept_id %><h4>학과코드가 존재하지 않습니다.</h4>
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