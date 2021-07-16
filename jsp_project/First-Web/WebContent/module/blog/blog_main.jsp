<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blog JSP</title>
<link rel="stylesheet" href="css/blog.css">
</head>
<body>
	<div id="main_wrap">
		<!-- header 시작 -->
		<%@ include file="frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- navigation 시작 -->
		<%@ include file="frame/nav.jsp"%>
		<!-- navigation 끝 -->

		<!-- content 시작 -->
		<div id="content_wrap">
			<%@ include file="frame/section.jsp"%>
			<%@ include file="frame/aside.jsp"%>
		</div>
		<!-- content 끝 -->

		<!-- footer 시작 -->
		<%@ include file="frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>