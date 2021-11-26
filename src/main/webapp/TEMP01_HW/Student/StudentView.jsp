<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 조회</title>
</head>
<body>
<%
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			Connection con = DriverManager.getConnection(url, "dba_user", "6546");
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM STUDENT");
		
%>
<table border = "1">
			<tr>
					<th>순번</th>
					<th>학과코드</th>
					<th>학년</th>
					<th>학번</th>
					<th>성명</th>
					<th>주민등록번호</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>email주소</th>
					<th>재학상태</th>
					<th>입학일자</th>
			</tr>
			
<%
			int idx = 1;
			while(rs.next()){
%>
			<tr>
					<td><%= idx++%></td>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getInt(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10)%></td>
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