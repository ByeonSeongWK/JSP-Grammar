<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>input 태그</title>

</head>

<body>

 <!-- 로그인하면 값을 JspBasic11.jsp로 값을넘긴다. -->
 <h2>로그인 입력 화면</h2>
 <!--       post : 기록 안남김, action : 전송할 위치 -->
 <form method="POST" action="JspBasic11.jsp">
 		<table border="1" >
	 			<tr>
	 					<td>아이디</td>
	 					<td><input type="text" name="id"></td>
	 			</tr>
	 			<tr>
			 			<td>비밀번호</td>
			 			<td><input type="password" name="pw"></td>
	 			</tr>
	 			<tr align="center">
	 					<td colspan="2">
	 						<input type="submit" value = "로그인">
	 						<input type="reset" value = "취소">
	 					</td>
	 			</tr>
 		</table>
 </form>
<%--
 <!-- input type  -->
<h5>text input</h5>
<input type="text" size="10" value=""> <br>
<input type="text" size="15" value="default">

<h5>password input</h5>
<input type="password">

<h5>hidden input</h5>
<input type="hidden" value="hiddenField">
<p>↑ 가려진다(jsp 데이터를 저장시 사용)</p>

<h5>submit button</h5>
<input type="submit" value="submit btn">

<h5>reset button</h5>
<input type="reset"  value="reset btn">

<h5>button</h5>
<input type="button" value="button">

 <!-- HTTP 상태 404 – 찾을 수 없음 : 경로를 찾을 수 없는 것 -->
 --%>
</body>

</html>