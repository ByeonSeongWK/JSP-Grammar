<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--					id = user 패키지에 UserBean 클래스 해당 페이지에서만 사용하겠다.-->
<jsp:useBean id = "user" class = "user.UserBean" scope = "page"  />
<!-- 추가 어디에다가? = user --><!-- 만약 property만 쓰면 아이디 값이 다를때 null값이 뜬다. -->
<jsp:setProperty name = "user" property = "id" param ="uid"/>
<!----------------- 강제로 넘어오는 값을 고정하고 싶을때 어떤걸 입력해도 value로 지정한 값이 넘어온다.-->
<jsp:setProperty name = "user" property = "pw" value = "1234"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<h4>로그인정보</h4>
<p> 아이디 : <jsp:getProperty property = "id" name = "user" /> </p>
<p> 비밀번호 : <jsp:getProperty property = "pw" name = "user" /></p>
</body>
</html>