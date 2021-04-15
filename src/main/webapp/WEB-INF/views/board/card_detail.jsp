<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 파비콘 -->
<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/img/logo1.png" type="image/x-icon">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/kanbanboard.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
	
<!-- 폰트어썸 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet">
<!-- Jquery UI -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Short Cut</title>
</head>
<body>
	<!-- The Modal -->
	<!--  -->
	<div class="modal fade" id="cardModalUpdate">
		<div class="modal-dialog">
			<div class="modal-header type">Short Cut</div>

			<!-- name="projectMemberList" -->
			<form id="card_insert" action="${pageContext.servletContext.contextPath}/card/create" method="post">
			<input type="hidden" value="${ requestScope.pjtNo }" name="pjtNo">
			<input type="text" value="" name="type" style="display: none;" id="pleaseType">
				<div class="modal-content">
					<div class="modal-body">
						<div class="row">
							<div class="modal_list">
								<i class="fas fa-check"><button id="workBtn" type="button"
								style="background: #00ff0000; border: 0;" value="1">업무</button></i>
							</div>
							<div class="modal_list">
								<i class="fas fa-calendar-week"><button id="calendarBtn" type="button"
								style="background: #00ff0000; border: 0;" value="2">일정</button></i>
							</div>
						</div>

					<div class="item_area">
						<i class="fas fa-user-circle"></i>
						<div class="login_info">
							<div class="info_detail">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}</div>
							<div class="info_detail type"><%= sf.format(nowTime) %></div>
						</div>
					</div>
							

					<div class="item_area">
						<input class="input_detail" type="text" name="title" id="title"
							placeholder="제목을 입력해주세요." style="border: none; background: transparent;">
					</div>

					<!-- 업무 영역 -->
					<div class="item_area work_btn on">
						<i class="fas fa-spinner"></i>
						<div class="btn-group">
							<button class="button on" name="request" id="request" type="button">요청</button>
							<button class="button on" name="progress" id="progress" type="button" disabled>진행</button>
							<button class="button" name="completion" id="completion" type="button" disabled>완료</button>
							<button class="button" name="hold" id="hold" type="button" disabled>보류</button>
						</div>

					</div>
					<div class="item_area work_btn on">
						<i class="fas fa-user-plus"></i> 
						<!-- <input class="input_detail type1" id="selectmember" type="text" name="addMember" placeholder="Add Member" 
						value="">  -->
						<div id="choisemember"></div>
						<!-- <input class="input_detail type2" id="addMember" type="button" name="addMember" value="멤버조회"> -->
						<div id="member"></div>
						<input id="memberInput" type="hidden" value="">
						<input type="text" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}" name="memNo" id="" style="display: none;">
					</div>
					<div class="item_area work_btn on">
						<i class="far fa-calendar-plus"></i> <input
							class="input_detail type4" type="date" name="taskStartDate"> &nbsp; -
						&nbsp; <i class="far fa-calendar-minus"></i> <input
							class="input_detail type4" type="date" name="taskEndDate">
					</div>
					<!-- 업무영역 끝 -->

					<!-- 일정 -->
					<div class="item_area calendar_btn on">
						<i class="far fa-clock"></i> 
						<input type='datetime-local' name="scheduleStartDate" style="display:inline-block; font-size: 12px"> ~ 
						<input type='datetime-local' name="scheduleEndDate" style="font-size: 12px">
					</div>
					<!-- <div class="item_area calendar_btn on">
						<i class="fas fa-user-plus"></i> <input class="input_detail type1"
							type="text" name="name" placeholder="Add Member"> <input
							class="input_detail type2" type="button" name="name" value="Add">
					</div> -->
					<div class="item_area calendar_btn on">
						<i class="fas fa-map-marker-alt"></i>
						<input class="input_detail type3" type="text" name="place" size="20px"
							placeholder="장소를 입력하세요"
							style="border: none; background: transparent;">
					</div>
					<div class="item_area calendar_btn on">
						<i class="fas fa-bell"></i> 
						<select class="select_detail" name="alert">
							<option value="1">30분 전 미리 알림</option>
							<option value="2">하루 전 미리 알림</option>
							<option value="3">알리지 않음</option>
						</select>
					</div>
					<div class="item_area calendar_btn on">
						<i class="fas fa-user-plus"></i> 
						<!-- <input class="input_detail type1" id="selectmember" type="text" name="addMember" placeholder="Add Member" 
						value="">  -->
						<div id="choisemember"></div>
						<!-- <input class="input_detail type2" id="addMember" type="button" name="addMember" value="멤버조회"> -->
						<div id="member2"></div>
						<input id="memberInput" type="hidden" value="">
						<input type="text" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}" name="memNo" id="" style="display: none;">
					</div>
					<!-- 일정 영역 끝 -->

					<div class="item_area">
						<i class="far fa-comment-alt"></i>
						<textarea class="text_detail type" name="txt"></textarea>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal_footer">
					<div class="modal_icon">
						<i class="fas fa-paperclip"></i>
					</div>
					<div class="modal_icon">
						<i class="fas fa-hashtag"></i>
					</div>

					<div class="btn_area">
					<input type="hidden" name="projectName" value="${projectName}">
					<input name="sprNo" type="hidden" value="${sprNo}">	
					<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
						<button class="upload_btn" id="upload" type="submit">올리기</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>