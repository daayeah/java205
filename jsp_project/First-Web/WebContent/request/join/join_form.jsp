<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>로그인</h1>
	<br>
	<form action="login_result.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpw"></td>
			</tr>
			<tr>
				<td><select name="phone">
						<option>010</option>
						<option>011</option>
						<option>016</option>
				</select></td>
				<td><input type="text" name="username"></td>
			</tr>
		</table>
	</form>
</body>
</html>