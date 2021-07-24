<%@page import="jdbc.util.JdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dept.dao.DeptDao"%>
<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 사용자가 전달한 deptno -> 실행 -> 결과
String deptno = request.getParameter("deptno");

// DB에 있는 데이터 삭제
int resultCnt = 0;

// 2. DB 처리 : insert
// 서블릿 클래스 Loader에서 드라이버 로드
Connection conn = null;
DeptDao dao = DeptDao.getInstance();

try {
	conn = ConnectionProvider.getConnction();

	resultCnt = dao.deleteDept(conn, Integer.parseInt(deptno));
} catch (SQLException e) {
	e.printStackTrace();
} catch (Exception e) {
	e.printStackTrace();
} finally {
	JdbcUtil.close(conn);
}

if (resultCnt > 0) {
%>
<script>
	alert('삭제되었습니다.');
	location.href = 'dept_list.jsp';
</script>
<%
} else {
%>
<script>
	alert('해당 데이터를 찾지 못했습니다.');
	location.href = 'dept_list.jsp';
</script>
<%
}
%>