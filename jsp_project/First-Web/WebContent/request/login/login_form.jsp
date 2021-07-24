<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<style>
</style>
<script>
	
</script>
</head>
<body>
	<a href="https://www.naver.com/"> <img src="..\..\images\NAVER_Logo.png" width="240">
	</a>
	<br>
	<form action="login_result.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpw"></td>
			</tr>

		</table>
	</form>
</body>
</html>