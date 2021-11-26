<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%
		request.setCharacterEncoding("UTF-8");

		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		String dept_id 			= request.getParameter("dept_id");
		String dept_name 	= request.getParameter("dept_name");
		String dept_tel			= request.getParameter("dept_tel");
		
		String sql = "INSERT INTO DEPARTMENT VALUES (?, ?, ?)";

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
		pstmt.setString(1, dept_id);
		pstmt.setString(2, dept_name);
		pstmt.setString(3, dept_tel);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
%>
<h4>삽입이 성공적으로 완료되었습니다.</h4>
<%
		} catch(Exception e) {
			e.printStackTrace();
%>
<h4>삽입이 실패했습니다.</h4>
<%
}
%>
		
</body>
</html>