<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.setAttribute("userName", request.getParameter("id"));
response.sendRedirect("/member/mypage/mypage.jsp"); // /web/member/mypage/mypage.jsp
%>