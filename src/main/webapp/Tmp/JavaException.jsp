<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
		int a = 10;
		int b = 0;
		int [] arr = {1, 2, 3, 4, 5};
%>
<html>
<head>
<meta charset="UTF-8">
<title>예외처리</title>
</head>
<body>

<%
		try {
%>
		<%= a/5 %>
		<%= arr[5] %>
<%
		} catch(Exception e) {	// 모든 예외에 대해서 다 처리 해준다.
//		} catch(ArithmeticException e) {	// 산술 예외(0으로 나누는 예외)
%>	
		<p> 예외 발생 </p>
<%--<p> 산술 예외 발생 </p> --%>
<%	
//		} catch(ArrayIndexOutOfBoundsException e) {	// 인덱스 접근 예외(배열 예외)
%>
<%--<p> 인덱스 접근 예외 발생 </p> --%>
<%
	} finally { // 예외가 발생하든 안하든 출력
%>
	<p>연산완료</p>
<%
	} 
%>

</body>
</html>