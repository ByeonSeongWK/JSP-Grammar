<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<%!
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = new GregorianCalendar(); /* <-- 다형성이 적용(추상메서드)*/
		
		Date date1 = new Date();
		Date date2 = new Date();
%>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 유틸</title>
</head>

<body>

<table border="1">
	<tr>
			<td>c1</td>
			<td><%= c1.toString() %></td>
	</tr>
	<tr>
			<td>c2</td>
			<td><%= c2.toString() %></td>
	</tr>

</table>

<%
		c2.set(Calendar.YEAR, 2020);
		c2.set(Calendar.MONTH, 0);
%>
<!---------------------- c1.get 사용 ----------------------->								    
<p>
<%= c1.get(Calendar.YEAR)%>
<%-- MONTH는 실제 월보다 -1 작게 찍힌다. 그래서 +1 을 해줘야함 --%>
<%-- Calendar에 MONTH를 입력할시 항상 1작게 입력해줘야 한다. --%>
<%= c1.get(Calendar.MONTH) + 1 %>
<%= c1.get(Calendar.DATE) %>
</p>

<p> <%= c1.get(Calendar.DAY_OF_WEEK) %></p>
							<%-- DAY_OF_WEEK(요일) 반환시 일요일 1, 토요일 7 --%>

<!---------------------- c2.get 사용 ----------------------->		
<p>
<%-- Set 메서드로 YEAR을 2020으로 MONTH를 1월로 바꿔줬다. --%>
<%= c2.get(Calendar.YEAR) %>
<%= c2.get(Calendar.MONTH) + 1 %>
<%= c2.get(Calendar.DATE) %>
</p>

<p> <%= c2.get(Calendar.DAY_OF_WEEK) %></p>

<%
		c2.set(2022, 11, 25);
%>

<!---------------------- c2.set 사용 ----------------------->		
<p>
<%-- Set 메서드로 한번에 값을 다 바꿨다. --%>
<%= c2.get(Calendar.YEAR) %>
<%= c2.get(Calendar.MONTH) + 1 %>
<%= c2.get(Calendar.DATE) %>
</p>
<p> <%= c2.get(Calendar.DAY_OF_WEEK) %></p>

<!---------------------- getTimeInMillis 사용 ----------------------->		
<h3> <%= (c2.getTimeInMillis() - c1.getTimeInMillis()) / (24*60*60*1000) %> </h3>

<%
		date1 = c1.getTime();
		date2 = c2.getTime();
%>

<h3> <%= date1 %></h3>
<h3> <%= date2 %></h3>

<%--Calendar--%>
<%
		c1.setTime(date2);
%>
<p>
<%= c1.get(Calendar.YEAR) %>
<%= c1.get(Calendar.MONTH) + 1 %>
<%= c1.get(Calendar.DATE) %>
</p>
<p> <%= c1.get(Calendar.DAY_OF_WEEK) %></p>

<p>
<%= c2.get(Calendar.YEAR) %>
<%= c2.get(Calendar.MONTH) + 1 %>
<%= c2.get(Calendar.DATE) %>
</p>
<p> <%= c2.get(Calendar.DAY_OF_WEEK) %></p>

</body>

</html>