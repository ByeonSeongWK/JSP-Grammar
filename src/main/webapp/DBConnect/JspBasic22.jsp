<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");

		String dept_id 		= request.getParameter("dept_id");
		String dept_name = request.getParameter("dept_name");
		String dept_tel 		= request.getParameter("dept_tel");
		
		// 접속하기 위한
		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw		= "6546";
		
		// Update 구분 (SQL에서 썼던 업데이트 구분)// SET 바꿀 컬럼 구문 두개면 ,(콤마) //  WHERE 찾을 기준이 될 값
		String sql = "UPDATE DEPARTMENT SET dept_name = ?, dept_tel = ? WHERE dept_id = ?"; // 바꿀 구문
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= dept_id %>학과 정보 수정</title>
</head>
<body>

<%
		try {
			// 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 접속
			Connection con = DriverManager.getConnection(url, db_id, db_pw);
	
			// 완성 되지 않은 SQL 사용시									//(만들어둔 sql문 객체)
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 문자열(VARCHAR)이라 setString을 씀 
			pstmt.setString(1, dept_name);
			pstmt.setString(2, dept_tel);
			pstmt.setString(3, dept_id);
			// sql문 객체 만들어둔 순서대로 1, 2, 3 입력
			
			// select문이 아니면 executeQuery문이 아닌 executeUpdate문을 쓴다.
			pstmt.executeUpdate();
			
			// 접속 해제
			pstmt.close();
			con.close();
			
%>
<h4><%= dept_id  %>의 데이터를 <%= dept_name %>, <%= dept_tel %>로 변경했습니다.</h4>
<%			
		} catch(Exception e) {
			e.printStackTrace();
%>
<h4>데이터베이스 수정에 실패했습니다.</h4>
<%		
		}
%>

</body>
</html>