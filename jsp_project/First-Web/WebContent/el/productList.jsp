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
	<jsp:useBean id="product" class="product.Product" scope="session" />
	1. session 객체의 product 속성 존재 확인 2. 있다 -> product 이름의 변수에 session 영역에 저장되어 있는 객체를 저장 없다 ->
	product.Product 클래스로 객체 생성하고 session 영역 속성에 product 이름으로 객체 저장 Product p=session Product
	p=session.getAttribute("product"); if(p==null){ p=new Product(); session.setAttribute("product",
	p); }

	<%-- 
	<%=product%>
	<br>${product }
	 --%>

	<h1>상품 리스트 : 원하시는 상품을 선택하세요.</h1>
	<form action="productSelect.jsp">
		<select name="select">
			<%
	 for(int i=0; i<product.getProductList().length; i++){
		 out.println("<option>"+product.getProductList()[i]+"</option>");
		 %>"
		</select>
	</form>
</body>
</html>