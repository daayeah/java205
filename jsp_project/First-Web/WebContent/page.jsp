<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
	
</script>
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<hr>
	<div id="nav">[게임][쇼핑][뉴스]</div>
	<div id="wrap">
		<div id="news">
			<h3>[최신 뉴스]</h3>
			<hr>
			<p>코로나 발생 현황</p>
		</div>
		<div id="shopping">
			<h3>[쇼핑 정보] 인기 상품</h3>
			<p>이것은 아이폰 13입니다.</p>
		</div>
	</div>

실행된 jsp의 html(text)결과를 가져옴 
	<jsp:include page="footer.jsp">
		<jsp:param name="email" value="test@gmail.com" />
		<jsp:param name="tel" value="010-0000-0000" />
	</jsp:include>
</body>
</html>