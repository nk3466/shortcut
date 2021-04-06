<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
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
				<form action="${pageContext.servletContext.contextPath}/meeting/meetinglog" method="post">
					<div class="modal-body">
						
							<div class="conference_item">
								<div class="row">
									<div class="item_type type">
										회의날짜
									</div>
									<div class="item_type">
										<input class="input_detail" type="date" id="meetingDate" name="enrollDate">
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
										<input class="input_detail" type="text" id="memberEmail" name="" placeholder="회의 참가자 추가" onclick="this.value=''">
										<button type="button" id="memberAddBtn" class="btn_detail">Add</button>
									</div>
									
								</div>
								<div class="modal_line"></div>
								<div class="row">
									<div class="item_type type">
										참석자
									</div>
									<div class="item_type" id="meetingMember">
										
									</div>
									
								</div>
								<div class="modal_line"></div>
								<div class="row">
									<div class="item_type type">
										회의제목
									</div>
									<div class="item_type">
										<input class="input_detail" type="text" id="titleName" name="meetingName">
									</div>
									
								</div>
								<div class="row">
									<div class="item_type type">
										회의내용
									</div>
									<div class="item_type type3">
										<textarea id="meetingContent" class="textarea_detail" name="meetingText"></textarea>
									</div>
									
								</div>
		
							</div>
						
					</div>
	
					<!-- Modal footer -->
					<div class="modal_footer">								
						<div class="btn_area">
							<input name="${_csrf.parameterName}" type="hidden"  value="${_csrf.token}">
							<input type="button" id="upload" class="upload_btn" value="완료">	
						</div>														
					</div>
				</form>

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
	const token = $("meta[name='_csrf']").attr("content");
	const header = $("meta[name='_csrf_header']").attr("content");
	
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});
	
		
	$("#upload").click(function(){

		var $enrollDate = $("#meetingDate").val();
		var $meetingName = $("#titleName").val();
		var $meetingText = $("#meetingContent").val();
		
		console.log($enrollDate);
		console.log($meetingName);
		console.log($meetingText);
		
		
		$.ajax({
			url : "${pageContext.servletContext.contextPath}/meeting/meetinglog",
			type : "POST",		
			data : {
					enrollDate : $enrollDate,
					meetingName : $meetingName,
					meetingText : $meetingText
					},
			success : function(data, status, xhr){
				console.log(data);
				
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		})
	})
</script>
<script type="text/javascript">
	
	var count = 0;
	
	$("#memberAddBtn").click(function(){
		if(!emailNull($("#memberEmail").val())){
			
			/* const addMember = $("#projectMember span:last"); */
			var insertSpan="";
			insertSpan += '<span class="item_text">' + document.getElementById("memberEmail").value + '<i id="delBtn" class="fas fa-times-circle"></i>' + '</span>';
			
			$("#meetingMember").append(insertSpan);
			$("#memberEamil").val('');
		}
	});
	
	
	function emailNull(value){
		if(value === null) return true;
		if(typeof value === 'string' && value === '') return true;
		if(typeof value === 'undefined') return true;
		return false;
	}
	
	

	$(document).on('click','.item_text',function(){
		
		var $t = $(this);
		
		$t.remove();
	}) 

	
</script>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/data.js"></script>

</html>