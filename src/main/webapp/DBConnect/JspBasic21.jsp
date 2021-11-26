<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
		request.setCharacterEncoding("UTF-8");	// 외부에서 받아올땐 항상 걸어줘야함(아니면 깨진다.)

		String dept_id 	= request.getParameter("dept_id");
		
		// 접속할 문장
		String url 			= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String db_id 		= "dba_user";
		String db_pw 	= "6546";
		
		// sql 문(완성되지 않은	// 밑에서 작업함)
		String sql			=	"SELECT * FROM DEPARTMENT WHERE dept_id = ?"; // <-- ?에 값을 담는다.
								// 기본 셀렉트 문								 // 어디에 어떤값(primery값)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= dept_id %> 학과 정보 수정</title>
		 <!--  입력 받은 값으로 타이틀을 만들수도 있다. -->
</head>
<body>

<%
		try {
				// 로드
				Class.forName("oracle.jdbc.driver.OracleDriver");
				// 접속
				Connection con = DriverManager.getConnection(url, db_id, db_pw);
				
				// 완성되지 않은 SQL을 완성하기 위해 pstmt 객체를 만듦
				PreparedStatement pstmt = con.prepareStatement(sql);// ?에 담을 값
				pstmt.setString(1, dept_id); // ?에 받아온 dept_id를 담아준다.
				
				// 실행시키는 문장
				ResultSet rs = pstmt.executeQuery();
				
				// 하나의 값만 받아올땐 while 말고 if를 써주는게 좋다.
				// └─(while 써도 상관X while도 if문으로 작동하기 때문에.)
				
				if(rs.next()) { // next() 다음 커서가 존재하면(커서 이동은 행 기준으로 이동(아래로))
						String dept_name = rs.getString(2); // 몇번째 열의 값을 바꿔 줄껀지
						String dept_tel 		= rs.getString(3); 
				
%>
<h4> 학과 수정 </h4>
<form method = "POST" action = "JspBasic22.jsp">
			<table border = "1">
					<tr>
							<td>학과 코드</td>
							<td><%=dept_id%><input  type="hidden" name="dept_id" value="<%=dept_id%>"></td>
							<!-- dept_id만 찍힌다. // input은 type이 hidden으로 되어 있기 때문에 보이지 않고 값만 받기 위해 숨겨둠.  -->
					</tr>
					<tr>
							<td>학과명	:</td>
							<td><input type = "text" name = "dept_name" value = "<%=dept_name%>"></td> 
					</tr>
					<tr>
							<td>전화번호 :</td>
							<td><input type = "text" name = "dept_tel" value = "<%=dept_tel %>"></td>
					</tr>
					<tr align = "center">
							<td colspan = "2">
									<input type="submit" value = "수정">
									<input type="reset" value = "취소">
							</td>
					</tr>
			</table>
</form>
<%
				
				} else { // 입력한 dept_id가 존재하지 않을 시 
%>
<h4><%= dept_id %> 학과코드가 존재하지 않습니다.</h4>
<%					
				}
				// 해제(생성 반대)
				rs.close();
				pstmt.close();
				con.close();
				
		// 데이터베이스 연동 도중 에러에 대한 예외 처리
		}	catch(Exception e) {
			e.printStackTrace();
%>
<!--  에러가 뜨면 클라이언트에게 보여줄 표시 내용 -->
<h4>데이터베이스 접속에 실패했습니다.</h4>
<% } %>

</body>
</html>