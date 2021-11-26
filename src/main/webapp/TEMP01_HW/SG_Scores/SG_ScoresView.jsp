<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");
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
<title>수강 정보 검색</title>
</head>
<body>
<%
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id = "dba_user";
		String db_pw = "6546";
		
		String sql = "SELECT * FROM SG_SCORES";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
%>
<h4>수강 정보 검색</h4>
<table border = "1">
		<tr>
				<th>순번</th>
				<th>학번</th>
				<th>과목코드</th>
				<th>성적</th>
				<th>등급</th>
				<th>성적취득일자</th>
		</tr>
<%
		int idx = 1;
		while(rs.next()) {
%>
		<tr>
				<td><%= idx++ %></td>
				<td><%= rs.getString(1)%></td>
				<td><%= rs.getString(2)%></td>
				<td><%= rs.getInt(3)%></td>
				<td><%= rs.getString(4)%></td>
				<td><%= rs.getString(5)%></td>
		</tr>
<%
		}
%>
		<tr>
				<td colspan="6" bgcolor = "gray"></td>
		</tr>
		<tr align = "center">
				<td colspan = "2"><a href="SG_ScoresRegist.jsp" target = "_self"> 수강 정보 추가</a></td>
				<td colspan = "2"><a href="SG_ScoresChange.jsp" target = "_self"> 수강 정보 수정</a></td>
				<td colspan = "2"><a href="SG_ScoresDelete.jsp" target = "_self"> 수강 정보 삭제</a></td>
		</tr>
</table>
<h5>데이터베이스 검색 성공</h5>
<%
		}catch(Exception e) {
			e.printStackTrace();
%>		
<h5>데이터베이스 검색 실패</h5>
<%
	}
%>

</body>
</html>