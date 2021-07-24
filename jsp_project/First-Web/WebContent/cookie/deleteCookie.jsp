<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//쿠키 삭제 : 쿠키 유지시간을 0으로 설정
Cookie c = new Cookie("cname", "");
// c.setMaxAge(60 * 60); // 1시간 유지
// c.setMaxAge(60 * 60 * 24); // 하루 유지
// c.setMaxAge(60 * 60 * 24 * 7); // 일주일 유지
/* c.setMaxAge(0); // 쿠키 소멸(삭제)

response.addCookie(c); */
response.addCookie(CookieBox.makeCookie("name", "", "/web/cookie", 0));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
	
</script>
</head>
<body>
	<h1>쿠키가 삭제되었습니다.</h1>
	<a href="viewCookie.jsp">쿠키 보기</a>
</body>
</html>