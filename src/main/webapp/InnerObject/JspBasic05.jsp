<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 내장 객체</title>
</head>
<body>
	<!-- 클라이언트에서 요청이 있을 때 요청메서드, 요청 URL, 프로토콜 종류,
 			서버 이름, 서버의 포트번호, 사용자 컴퓨터의 IP 주소와 이름을 출력-->
<h2>request 내장객체</h2>
<table border="1">
			<%-- request는 내장객체이다 jsp에 이미 포함이 되어 있어서 객체를 생성안해도 사용가능 --%>
			<tr>
					<td>요청 메서드 :</td>
					<td><%= request.getMethod() %></td>
			</tr>
			<tr>
					<td>요청 URL :</td>
					<td><%= request.getRequestURL() %></td>
			</tr>
			<tr>
					<td>프로토콜 종류 :</td>
					<td><%= request.getProtocol() %></td>
			</tr>
			<tr>
					<td>Server 이름 :</td>
					<td><%=  request.getServerName()%></td>
			</tr>
			<tr>
					<td>Server의 포트 번호 :</td>
					<td><%= request.getServerPort() %></td>
			</tr>
			<tr>
					<td>사용자 컴퓨터 IP 주소 :</td>
					<td><%= request.getRemoteAddr() %></td>
			</tr>
			<tr>
					<td>사용자 컴퓨터 이름 : </td>
					<td><%= request.getRemoteHost() %></td>
			</tr>
</table>

</body>
</html>