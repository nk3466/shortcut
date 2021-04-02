<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="./css/index.css">
	<link rel="stylesheet" type="text/css" href="./css/backlog.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/backlo.css">
	

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
	<div class="backlog_area">
		<div class="backlog_header_area">
			<span class="backlog_header">
				Backlog			
			</span>			
			<a class="meeting_btn">Meeting Log</a>
			
		</div>
		

		<div class="sprint_box_area">			
			<div class="sprint_text_btn">
				<span class="sprint_text">Sprint 1</span>				
				<button class="btn_detail on"  data-toggle="modal" data-target="#myModal3">Start Sprint</button>	
				<button class="btn_detail ">Edit Sprint</button>			
			</div>				
			
								
			
			
			<div class="sprint_box on"></div>
							
			<div class="table_area">
				<div class="table_item">
					<a href="http://kordzor.cafe24.com/final/kanbanboard.html">
						<div class="row">							
							<div class="table_detail type1">ABC</div>
							<div class="table_detail type1">입금</div>
							<div class="table_detail type2">30</div>
							<div class="table_detail type2">5</div>
							<div class="table_detail type3">로그인, 입금 페이지 열기, 10달러 입금. 잔액 조회 페이지 이동. 잔액 확인</div>
							<div class="table_detail type4">지금은 암호화를 고려하지 않아도 됨</div>					
						</div>						
					</a>
				</div>
			</div>				
		</div>

		<div class="backlog_create_area">
			<div class="create_sprint_btn">
				<button class="sprint_btn_detail"  data-toggle="modal" data-target="#myModal2">Create Sprint</button>	
							
			</div>
			<div class="backlog_line"></div>
			<div class="backlog_table_area">				
				<div class="table_area">
					<div class="table_item">
						<div class="row">
							<div class="table_detail type1">ABC</div>
							<div class="table_detail type1">입금</div>
							<div class="table_detail type2">30</div>
							<div class="table_detail type2">5</div>
							<div class="table_detail type3">로그인, 입금 페이지 열기, 10달러 입금. 잔액 조회 페이지 이동. 잔액 확인</div>
							<div class="table_detail type4">지금은 암호화를 고려하지 않아도 됨</div>
						</div>
						<div class="row">
							<div class="table_detail type1">ABC</div>
							<div class="table_detail type1">입금</div>
							<div class="table_detail type2">30</div>
							<div class="table_detail type2">5</div>
							<div class="table_detail type3">로그인, 입금 페이지 열기, 10달러 입금. 잔액 조회 페이지 이동. 잔액 확인</div>
							<div class="table_detail type4">지금은 암호화를 고려하지 않아도 됨</div>
						</div>
						<div class="row">
							<div class="table_detail type1">ABC</div>
							<div class="table_detail type1">입금</div>
							<div class="table_detail type2">30</div>
							<div class="table_detail type2">5</div>
							<div class="table_detail type3">로그인, 입금 페이지 열기, 10달러 입금. 잔액 조회 페이지 이동. 잔액 확인</div>
							<div class="table_detail type4">지금은 암호화를 고려하지 않아도 됨</div>
						</div>
					</div>
				</div>
			</div>

			<div class="create_backlog_btn">
				<label>
					<i class="fas fa-plus"></i>
					<button class="backlog_btn_detail"  data-toggle="modal" data-target="#myModal">Create</button>	
				</label>					
			</div>
			
		</div>	


		<div class="sprint_box_area">			
			<div class="sprint_text_btn">
				<span class="sprint_text">Sprint 1</span>					
				<button class="btn_detail">Write Retrospect</button>			
			</div>				
			
								
			
			
			<div class="sprint_box on"></div>
							
			<div class="table_area">
				<div class="table_item">
					<!-- <a href="http://kordzor.cafe24.com/final/kanbanboard.html"> -->
						<div class="row">							
							<div class="table_detail type1">ABC</div>
							<div class="table_detail type1">입금</div>
							<div class="table_detail type2">30</div>
							<div class="table_detail type2">5</div>
							<div class="table_detail type3">로그인, 입금 페이지 열기, 10달러 입금. 잔액 조회 페이지 이동. 잔액 확인</div>
							<div class="table_detail type4">지금은 암호화를 고려하지 않아도 됨</div>	
						</div>						
						<button class="btn_detail">기록</button>			
					<!-- </a> -->
				</div>
			</div>				
		</div>

	</div>
	

  <!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<div class="header_detail">Create Backlog</div>					
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
						<div class="backlog_info">
							<div class="info_item">
								<div class="info_detail">ID</div>
								<input class="input_detail" type="text" name="">
							</div>
							<div class="info_item">
								<div class="info_detail">이름</div>
								<input class="input_detail" type="text" name="">
							</div>
							<div class="info_item">
								<div class="info_detail">중요도</div>
								<input class="input_detail" type="text" name="">
								<select>
									<option>상</option>
									<option>중</option>
									<option>하</option>
								</select>
							</div>
						</div>
						<div class="backlog_textarea">
							<div class="text_item">
								<div class="text_detail">데모 방식</div>
								<textarea class="textarea_detail"></textarea>
							</div>
							<div class="text_item">
								<div class="text_detail">참고</div>
								<textarea class="textarea_detail"></textarea>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn_detail">생성</button>
					<button type="button" class="btn_detail" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>




	<div class="modal fade" id="myModal2">
		<div class="modal-dialog type1">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<div class="header_detail type1">Create Sprint</div>					
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="create_item">
						<div class="item_name">
							Sprint name
						</div>
						<input class="input_detail" type="text" name="">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn_detail">생성</button>
					<button type="button" class="btn_detail" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>


	<div class="modal fade" id="myModal3">
		<div class="modal-dialog type2">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<div class="header_detail type1">Start Sprint</div>					
				</div>
				<p class="m_text">2 backlog will be included in this sprint</p>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="sprint_item">
						<div class="item_name">
							Sprint name
						</div>
						<input class="input_detail" type="text" name="">
					</div>
					<div class="sprint_item">
						<div class="item_name">
							Duration
						</div>
						<select class="input_detail">
							<option>2 weeks</option>
							<option>3 weeks</option>
							<option>1 weeks</option>
						</select>
					</div>
					<div class="sprint_item">
						<div class="item_name">
							Start Date
						</div>
						<input class="input_detail" type="date" name="">
					</div>
					<div class="sprint_item">
						<div class="item_name">
							End Date
						</div>
						<input class="input_detail" type="date" name="">
					</div>
					<div class="sprint_item">
						<div class="item_name">
							Sprint Goal
						</div>
						<textarea class="textarea_detail"></textarea>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn_detail">생성</button>
					<button type="button" class="btn_detail" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
	
</body>
</html>