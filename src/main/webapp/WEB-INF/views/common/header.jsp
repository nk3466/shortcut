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
			<a href="http://kordzor.cafe24.com/final/index.html">
				<img class="logo_detail" src="./resources/img/logo1.png">
				<span class="logo_text">Short Cut</span>	
			</a>			
		</div>
		<div class="top_menu_area">			
			<a class="menu_list" href="#">
				<i class="fas fa-cog"></i>
			</a>
			<a class="menu_list" href="#">
				<i class="far fa-bell"></i>
			</a>			
			<a class="menu_list" data-toggle="modal" data-target="#member_regist">회원가입</a>
			<a class="menu_list" data-toggle="modal" data-target="#member_login">로그인</a>
			
			<!-- <a class="menu_list" data-toggle="modal" data-target="#member_login">로그인</a> -->										
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/board/kanban">프로젝트</a>
			<a class="menu_list" href="#">내업무</a>
			<a class="menu_list" href="#">ENGLISH</a>
		</div>
	</div>
</div>
</body>
</html>