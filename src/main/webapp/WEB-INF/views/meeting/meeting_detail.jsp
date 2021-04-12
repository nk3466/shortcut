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
	<div class="modal fade" id="conference_detail">
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
										<input class="input_detail" type="date" id="meetingDate" name="enrollDate" readonly>
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
							<!-- 	<div class="row">
									<div class="item_type type">
										팀원추가
									</div>
									<div class="item_type">
										<input class="input_detail" type="text" id="memberEmail" name="" placeholder="회의 참가자 추가" onclick="this.value=''">
										<button type="button" id="memberAddBtn" class="btn_detail">Add</button>
									</div>
									
								</div>
								<div class="modal_line"></div> -->
								<div class="row">
									<div class="item_type type">
										참석자
									</div>
									<div class="item_type" id="meetingMemberDetailList">
										
									</div>
									
								</div>
								<div class="modal_line"></div>
								<div class="row">
									<div class="item_type type">
										회의제목
									</div>
									<div class="item_type">
										<input class="input_detail" type="text" id="titleName" name="meetingName" readonly>
									</div>
									
								</div>
								<div class="row">
									<div class="item_type type">
										회의내용
									</div>
									<div class="item_type type3">
										<textarea id="meetingContent" class="textarea_detail" name="meetingText" readonly></textarea>
									</div>
									
								</div>
		
							</div>
						
					</div>
	
					<!-- Modal footer -->
					<div class="modal_footer">								
						<div class="btn_area">
							<input name="${_csrf.parameterName}" type="hidden"  value="${_csrf.token}">
							<input type="button" id="upload" class="upload_btn" value="삭제">	
							<input type="button" id="upload" class="upload_btn" value="수정">	
							<input type="button" id="upload" class="upload_btn" value="완료">	
						</div>														
					</div>
				</form>

			</div>
		</div>

	</div>

</body>
</html>