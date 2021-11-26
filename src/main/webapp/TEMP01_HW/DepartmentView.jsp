<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//					폴더 : 폴더	: 폴더  : 호스트 	:	포트번호	:SID;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection con = DriverManager.getConnection(url, "dba_user", "6546");
		
		// 완성되는 SQL문 쓸땐 Statement // 미완성된 것은 PreparedStatement
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM DEPARTMENT");
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table	border="1">
			<tr>
					<th>순번 :</th>
					<th>학과코드 :</th>
					<th>학과명 :</th>
					<th>전화번호 :</th>
			</tr>
<%
		int idx = 1;
		while(rs.next()){
%>
			<tr>
					<td><%= idx++ %></td>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
			</tr>
<%
		}
		rs.close();
		stmt.close();
		con.close();
%>
</table>


</body>
</html>