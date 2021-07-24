<%@page import="dept.domain.Dept"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 1. 사용자가 입력한 데이터 처리 -> 객체 속성에 결과 데이터 저장 -> view 지정
// 입력 데이터 한글 처리
request.setCharacterEncoding("utf-8");

String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

int resultCnt = 0;

// 2. DB 처리 : insert
// 서블릿 클래스 Loader에서 드라이버 로드

// 연결
Connection conn = null;
DeptDao dao = DeptDao.getInstance();

try {
	conn = ConnectionProvider.getConnction();

	resultCnt = dao.insertDept(conn, new Dept(Integer.parseInt(deptno), dname, loc));
} catch (Exception e) {

}

if (resultCnt > 0) {
%>
<script>
	alert('등록되었습니다.');
	location.href = 'dept_list.jsp';
</script>
<%
} else {
%>
<script>
	alert('오류 발생으로 등록되지 않았습니다.\n입력 페이지로 다시 이동합니다.');
	// location.href = 'dept_regForm.jsp';
	window.history.go(-1);
</script>
<%
}
%>