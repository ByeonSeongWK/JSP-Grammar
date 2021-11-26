<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection con = DriverManager.getConnection(url, "dba_user", "6546");
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM COURSE");
%>
<table border="1">
			<tr>
					<th>순번</th>
					<th>과목코드</th>
					<th>과목명</th>
					<th>학점수</th>
					<th>담당교수번호</th>
					<th>추가수강료</th>
			</tr>
<%
		
		int idx = 1;
		while(rs.next()){
%>			
			<tr>
					<td><%=idx++ %></td>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
			</tr>
<%
		}
		rs.close();
		stmt.close();
		con.close();
		} catch(Exception e) {
			e.printStackTrace();
			
		}
%>			
</table>
</body>
</html>