<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 정보 검색</title>
</head>
<body>
<%
		int idx = 1;
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");	
		
		Connection con = DriverManager.getConnection(url, db_id, db_pw);
		String sql 			= "SELECT * FROM PROFESSOR";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
%>
<h4>professor 정보</h4>
<table border = "1">
		<tr>
				<th>순번</th>
				<th>교수번호</th>
				<th>교수명</th>
				<th>직위</th>
				<th>소속학과코드</th>
				<th>전화번호</th>
				<th>email주소</th>
				<th>직책명</th>
				<th>관리자번호</th>				
		</tr>
<%		
	while(rs.next()) {	
%>	
		<tr>
				<td><%= idx++ %></td>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><%= rs.getString(7) %></td>
				<td><%= rs.getString(8) %></td>
		</tr>
<%
	}
%>		
</table>
<%
		} catch(Exception e) {
			e.printStackTrace();
%>
<h5>데이터베이스 검색 실패</h5>
<%
}
%>

</body>
</html>