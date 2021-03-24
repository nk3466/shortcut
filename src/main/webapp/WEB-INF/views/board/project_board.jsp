<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/project_board.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/modal.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<!-- 폰트어썸 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">


	<title>Short Cut</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="project_content">
		<div class="row">
			<div class="project_text_area">
				<div class="project_text1">
					Description
				</div>
				<div class="project_line"></div>
				<div class="project_text2">
					Wankku is a front-end, Minsero is a back-end... Yakgan e run neukkim jeok in neukkim  Right?? Understand?  You know what I’m saying???  I want to sensitive mood desing for our homepage, so we need  to help us by ourselves.
					<br>
					Conclusively, I hope our prototype will be completed tomorrow.
					<br>
					See you later~	
					<br>
					<br>
					mr.choo!~~ ipsul wi e choo
				</div>					
			</div>	
			<div class="project_board_area">
				<div class="project_text1">
					Project	
				</div>
				<div class="project_line2"></div>

				<div class="row">
					<div class="board_list">
						<a class="board_detail" href="#" data-toggle="modal" data-target="#project_produce">
							<i class="fas fa-plus"></i>
						</a>
						<div class="board_text">
							new Project	
						</div>					
					</div>
					<div class="board_list">
						<a class="board_detail type" href="http://kordzor.cafe24.com/final/kanbanboard.html">
							<img src="./img/board_icon.png">
						</a>
						<div class="board_text"  data-toggle="modal" data-target="#project_modify">
							The joeun	
						</div>					
					</div>
					<div class="board_list">
						<a class="board_detail" href="#">
							<i class="fas fa-plus"></i>
						</a>
						<div class="board_text">
							new Project	
						</div>					
					</div>
					<div class="board_list">
						<a class="board_detail" href="#">
							<i class="fas fa-plus"></i>
						</a>
						<div class="board_text">
							new Project	
						</div>					
					</div>
				</div>
				<div class="row">
					<div class="board_list">
						<a class="board_detail" href="#">
							<i class="fas fa-plus"></i>
						</a>
						<div class="board_text">
							new Project	
						</div>					
					</div>
					<div class="board_list">
						<a class="board_detail" href="#">
							<i class="fas fa-plus"></i>
						</a>
						<div class="board_text">
							new Project	
						</div>					
					</div>
					<div class="board_list">
						<a class="board_detail" href="#">
							<i class="fas fa-plus"></i>
						</a>
						<div class="board_text">
							new Project	
						</div>					
					</div>
					<div class="board_list">
						<a class="board_detail" href="#">
							<i class="fas fa-plus"></i>
						</a>
						<div class="board_text">
							new Project	
						</div>					
					</div>
				</div>
				<div class="row">
						<div class="board_list">
							<a class="board_detail" href="#">
								<i class="fas fa-plus"></i>
							</a>
							<div class="board_text">
								new Project	
							</div>					
						</div>
						<div class="board_list">
							<a class="board_detail" href="#">
								<i class="fas fa-plus"></i>
							</a>
							<div class="board_text">
								new Project	
							</div>					
						</div>
						<div class="board_list">
							<a class="board_detail" href="#">
								<i class="fas fa-plus"></i>
							</a>
							<div class="board_text">
								new Project	
							</div>					
						</div>
						<div class="board_list">
							<a class="board_detail" href="#">
								<i class="fas fa-plus"></i>
							</a>
							<div class="board_text">
								new Project	
							</div>					
						</div>
					</div>
				</div>			
			</div>

		</div>	
	</div>


<div class="modal fade" id="project_produce">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<input class="input_detail" type="text" name="name" placeholder="Add Project Title">				
			</div>
			

			<!-- Modal body -->
			
			<div class="modal-body">
				<div class="row">
					<i class="fas fa-search"></i>
					<input class="input_detail1" type="text" name="name" placeholder="Add Member">
					<select class="select_detail">
						<option>can view</option>
						<option>can edit</option>
					</select>
					<input class="input_detail2" type="button" name="name" value="Add">		
				</div>

				<div class="select_member"></div>																				
			</div>

				
				
			
			<div class="modal_btn_area">
				<button class="btn_detail">Creat Project</button>
			</div>				
		</div>
	</div>
</div>

<div class="modal fade" id="project_modify">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<input class="input_detail" type="text" name="name" placeholder="Add Project Title">				
			</div>
			

			<!-- Modal body -->
			
			<div class="modal-body">
				<div class="row">
					<i class="fas fa-search"></i>
					<input class="input_detail1 type" type="text" name="name" placeholder="">
					
					<input class="input_detail2" type="button" name="name" value="Add">		
				</div>

				<div class="select_member"></div>																				
			</div>

				
				
			
			<div class="modal_btn_area">
				<button class="btn_detail type">Revise Project</button>
				<button class="btn_detail type">Delete Project</button>
			</div>				
		</div>
	</div>
</div>
</body>
</html>