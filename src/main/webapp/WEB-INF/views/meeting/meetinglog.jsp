<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/meetinglog.css">

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
	<header>
		<h1>
			<i class="far fa-calendar-check"></i> 
			<span>캘린더</span>
		</h1>
		<div class="calendar_title">
			<button class="prev">&#60;</button>
			<span id="asdf" class="current-year-month"></span>
			<button class="next">&#62;</button>
		</div>
	</header>
	<section class="content-left">
		<div class="left-main">
			<div class="main-wrap">
				<div class="main-day"></div>
				<div class="main-date"></div>
			</div>
			<div class="todo-wrap">
				<div class="todo-title">Todo List</div>
				<button class="conference_update">올리기</button>
				<form class="input-form">
					<input type="text" placeholder="write here!!" class="input-box" />
					<button type="submit" class="input-btn clickBtn">INPUT</button>
				</form>
				<ul class="todoList"></ul>
				<div class="showList">
					<span class="listText"></span> <span class="createDate"></span>
					<button class="closed">close</button>
				</div>
				<div class="bgblack"></div>
			</div>
		</div>
	</section>
	<section class="content-right">
		<div class="day-of-week">
			<div class="dayHeader sun">Sun</div>
			<div class="dayHeader">Mon</div>
			<div class="dayHeader">Tue</div>
			<div class="dayHeader">Wed</div>
			<div class="dayHeader">Thu</div>
			<div class="dayHeader">Fri</div>
			<div class="dayHeader sat">Sat</div>
		</div>
		<div class="calendar-body"></div>
	</section>

	<div class="modal fade" id="conference">
		<div class="modal-dialog">			
			<div class="modal-content">
				<div class="modal-body">
					<div class="conference_item">
						<div class="row">
							<div class="item_type type">
								회의날짜
							</div>
							<div class="item_type">
								<input class="input_detail" type="date" name="datee">
							</div>
							<div class="item_type">
								<input class="input_detail" type="time" name="">
								~
								<input class="input_detail" type="time" name="">
							</div>
						</div>
						<div class="modal_line"></div>
						<div class="row">
							<div class="item_type type">
								프로젝트
							</div>							
							<div class="item_text">
								ShortCut 애자일 협업툴
							</div>							
							<div class="item_type type1">
								스프린트
							</div>							
							<div class="item_text">
								C1009-1
							</div>							
						</div>
						<div class="modal_line"></div>
						<div class="row">
							<div class="item_type type">
								팀원추가
							</div>
							<div class="item_type">
								<input class="input_detail" type="text" name="">
								<button class="btn_detail">Add</button>
							</div>
							
						</div>
						<div class="modal_line"></div>
						<div class="row">
							<div class="item_type type">
								참석자
							</div>
							<div class="item_type">
								<span class="item_text">깅밍기</span>
								<span class="item_text">깅밍기</span>
								<span class="item_text">깅밍기</span>
							</div>
							
						</div>
						<div class="modal_line"></div>
						<div class="row">
							<div class="item_type type">
								회의제목
							</div>
							<div class="item_type">
								<input class="input_detail" type="text" name="">
							</div>
							
						</div>
						<div class="row">
							<div class="item_type type">
								회의내용
							</div>
							<div class="item_type type3">
								<textarea class="textarea_detail"></textarea>
							</div>
							
						</div>

					</div>
					
				</div>

				<!-- Modal footer -->
				<div class="modal_footer">								
					<div class="btn_area">
						<button type="button" id="upload" class="upload_btn">완료</button>	
					</div>														
				</div>

			</div>
		</div>

	</div>
</body>

<script type="text/javascript">
	$(function(){
		$(".conference_update").click(function(e){
			e.preventDefault();

			
			$("#conference").modal();
			
			
		})
	})
</script>
<script type="text/javascript">
	$(function() {
		$("#upload").click(function(){
			$.ajax({
				url : "meetinglog",
				data : "meetingDate : meetingDate",
				success : function(data, status, xhr){
					console.log(data);
				},
				error : function(xhr, status, error){
					console.log(error);
				}
			})
			
		})
	})
</script>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/data.js"></script>

</html>