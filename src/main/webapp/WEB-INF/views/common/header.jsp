<%@page import="org.apache.el.util.Validation"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.lang.Validate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="top_area">
	<div class="row">
		<div class="top_logo_area">
			<a href="${ pageContext.servletContext.contextPath }/main">
				<img class="logo_detail" src="${ pageContext.servletContext.contextPath }/resources/img/logo1.png">
				<span class="logo_text">Short Cut</span>	
			</a>			
		</div>
		<div class="top_menu_area">			
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/mypage/mypage">
				<i class="fas fa-cog"></i>
			</a>
			<a class="menu_list" href="#">
				<i class="far fa-bell"></i>
			</a>	
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/messenger/messenger">
				<i class="far fa-envelope"></i>	
			</a>
			
			<!-- <a class="menu_list" data-toggle="modal" data-target="#member_regist">회원가입</a>
			<a class="menu_list" data-toggle="modal" data-target="#member_login">로그인</a> -->
			
			<c:if test="${ sessionScope.newAuth eq null}">
			<a class="menu_list" data-toggle="modal" data-target="#member_regist">회원가입</a>
			<a class="menu_list" data-toggle="modal" data-target="#member_login">로그인</a>
			</c:if>
			<c:if test="${ sessionScope.newAuth eq not null}">
			반갑습니다!
			</c:if>
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/board/project_board">프로젝트</a>
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/mywork/mywork">내업무</a>
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/meeting/meetinglog">한국어</a>
		</div>
	</div>
</div>
</body>
</html>