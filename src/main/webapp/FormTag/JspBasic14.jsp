<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
<select name="sle1" > <!-- multiple이 없으면 하나만 선택이 된다.
		<option value="1"> 1 </option>
		<option value="2"> 2 </option>
		<option value="3"> 3 </option>
		<option value="4"> 4 </option>
</select>
<select name="sle2" multiple> 
		<option value="1"> 1 </option>
		<option value="2"> 2 </option>
		<option value="3"> 3 </option>
		<option value="4"> 4 </option>
</select>
 -->
 
 <!-- 넷플릭스 인기 콘텐츠 "오징어 게임", "뷰티풀 마인드", "귀멸의 칼날", "관상", "D.P.", "암살"  -->
 <h2>관심 목록</h2>
 <h4>관심 있는 영상을 선택하세요.</h4>
 <h4>여러 영상을 선택할 경우는 Ctrl 키를 누르고 선택</h4>
 
 <form method=GET action="JspBasic15.jsp">
 
 		<select name="video" multiple>
 				<option value="오징어 게임">오징어 게임</option>
 				<option value="뷰티풀 마인드">뷰티풀 마인드</option>
 				<option value="귀멸의 칼날">귀멸의 칼날</option>
 				<option value="관상">관상</option>
 				<option value="D.P.">D.P.</option>
 				<option value="암살">암살</option>
 		</select>
 		
 		<input type="submit" value="전송">
 
 </form>
 
 
 

</body>
</html>