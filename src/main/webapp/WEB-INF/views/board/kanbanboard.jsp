<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/kanbanboard.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<!-- 폰트어썸 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">

	<!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>



	<title>Short Cut</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="kanbanboard_area">
		<div class="row">
			<div class="project_info_area">
				<div class="project_info">					
					<div class="info_item">						
						<div class="item_name">
							프로젝트명
						</div>
						<div class="item_detail">
							Short Cut
						</div>
					</div>
					<div class="info_item">						
						<div class="item_name">
							Backlog No
						</div>
						<div class="item_detail">
							C001-9
						</div>
					</div>
					<div class="info_item">						
						<div class="item_name">
							참여인원
						</div>
						<div class="item_detail">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
							<i class="fas fa-user-circle">정민서</i>
							<i class="fas fa-user-circle">한미화</i>
							<i class="fas fa-user-circle">미스터추</i>							
						</div>
					</div>
					
				</div>
			</div>
			<div class="kanban_item">
				<div class="kanbanboard type1">
					<div class="kanbanboard_title">
						요청
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type">네이버</span>
							<span class="item_detail type">google</span>
							<span class="item_detail type">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="insert_card" data-toggle="modal" data-target="#myModal2">
						<i class="fas fa-plus"></i>
						카드 생성하기
					</div>
				</div>
			</div>
			<div class="kanban_item">
				<div class="kanbanboard type2">
					<div class="kanbanboard_title">
						진행중
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type1">네이버</span>
							<span class="item_detail type1">google</span>
							<span class="item_detail type1">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type1">네이버</span>
							<span class="item_detail type1">google</span>
							<span class="item_detail type1">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type1">네이버</span>
							<span class="item_detail type1">google</span>
							<span class="item_detail type1">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type1">네이버</span>
							<span class="item_detail type1">google</span>
							<span class="item_detail type1">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
				</div>
			</div>
			<div class="kanban_item">
				<div class="kanbanboard type3">
					<div class="kanbanboard_title">
						완료
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type2">네이버</span>
							<span class="item_detail type2">google</span>
							<span class="item_detail type2">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type2">네이버</span>
							<span class="item_detail type2">google</span>
							<span class="item_detail type2">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type2">네이버</span>
							<span class="item_detail type2">google</span>
							<span class="item_detail type2">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
				</div>
			</div>
			<div class="kanban_item">
				<div class="kanbanboard type4">
					<div class="kanbanboard_title">
						보류
					</div>
					<div class="board_item">
						<div class="item type1">
							SNS 로그인
						</div>
						<div class="item type2">
							<span class="item_detail type3">네이버</span>
							<span class="item_detail type3">google</span>
							<span class="item_detail type3">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i>
							<i class="fas fa-user-circle">이남경</i>
						</div>
					</div>
				</div>
			</div>			

		</div>
	</div>		





  <!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-header type">
				Short Cut
			</div>
			<div class="modal-content">						
				<div class="modal-body">
					<div class="row">
						<div class="modal_list">
							<i class="fas fa-pen"></i>
							<a class="list_detail on" href="#myModal">글작성</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-check"></i>
							<a class="list_detail" href="#">업무</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-calendar-week"></i>
							<a class="list_detail" href="#">일정</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-tasks"></i>
							<a class="list_detail" href="#">할일</a>
						</div>						
					</div>
					<textarea class="text_detail"></textarea>
				</div>

				<!-- Modal footer -->
				<div class="modal_footer">										
					<div class="modal_icon">
						<i class="fas fa-paperclip"></i>
					</div>
					<div class="modal_icon">
						<i class="fas fa-hashtag"></i>
					</div>
					<div class="modal_icon">
						<i class="fas fa-user-plus"></i>
					</div>
					<div class="btn_area">
						<button type="button" class="upload_btn">올리기</button>	
					</div>														
				</div>

			</div>
		</div>
	</div>



	<div class="modal fade" id="myModal1">
		<div class="modal-dialog">
			<div class="modal-header type">
				Short Cut
			</div>
			<div class="modal-content">						
				<div class="modal-body">
					<div class="row">
						<div class="modal_list">
							<i class="fas fa-pen"></i>
							<a class="list_detail" href="#myModal">글작성</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-check"></i>
							<a class="list_detail" href="#">업무</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-calendar-week"></i>
							<a class="list_detail on" href="#">일정</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-tasks"></i>
							<a class="list_detail" href="#">할일</a>
						</div>						
					</div>

					<div class="item_area">
						<input class="input_detail" type="text" name="title" placeholder="제목 맞나 ..??">
					</div>
					<div class="item_area">
						<i class="far fa-clock"></i>
						<input class="input_detail type4" type="date" name="">
						<input class="input_detail type5" type="time" name="">~<input class="input_detail type5" type="time" name="">
					</div>
					<div class="item_area">
						<i class="fas fa-user-plus"></i>
						<input class="input_detail type1" type="text" name="name" placeholder="Add Member">						
						<input class="input_detail type2" type="button" name="name" value="Add">
					</div>
					<div class="item_area">
						<i class="fas fa-map-marker-alt"></i>
						<input class="input_detail type3" type="text" name="name" placeholder="장소를 입력하세요">						
						
					</div>
					<div class="item_area">
						<i class="fas fa-bell"></i>
						<select class="select_detail">
							<option>30분 전 미리 알림</option>
							<option>하루 전 미리 알림</option>
							<option>알리지 않음</option>
						</select>					
						
					</div>

					<div class="item_area type">
						<i class="far fa-comment-alt"></i>
						<textarea class="text_detail"></textarea>
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
						<button type="button" class="upload_btn">올리기</button>	
					</div>														
				</div>

			</div>
		</div>

	</div>


<div class="modal fade" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-header type">
				Short Cut
			</div>
			<div class="modal-content">						
				<div class="modal-body">
					<div class="row">
						<div class="modal_list">
							<i class="fas fa-pen"></i>
							<a class="list_detail" href="#myModal">글작성</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-check"></i>
							<a class="list_detail on" href="#">업무</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-calendar-week"></i>
							<a class="list_detail" href="#">일정</a>
						</div>
						<div class="modal_list">
							<i class="fas fa-tasks"></i>
							<a class="list_detail" href="#">할일</a>
						</div>						
					</div>

					<div class="item_area">
						<i class="fas fa-user-circle"></i>
						<div class="login_info">
							<div class="info_detail">정민서</div>
							<div class="info_detail type">2021-03-08 19:00</div>							
						</div>
						<i class="fas fa-ellipsis-v"></i>						
					</div>

					<div class="item_area">
						<input class="input_detail" type="text" name="title" placeholder="제목 맞나 ..??">
					</div>

					<div class="item_area">						
						<div class="row type">
							<i class="fas fa-spinner"></i>
							<div class="progress_list">요청</div>
							<div class="progress_list">진행</div>
							<div class="progress_list">피드백</div>
							<div class="progress_list">완료</div>
							<div class="progress_list">보류</div>
						</div>						
					</div>

					<div class="item_area">
						<i class="fas fa-user-plus"></i>
						<input class="input_detail type1" type="text" name="name" placeholder="Add Member">						
						<input class="input_detail type2" type="button" name="name" value="Add">
					</div>
					
					
					<div class="item_area">
						<i class="far fa-calendar-plus"></i>
						<input class="input_detail type4" type="date" name="">
					</div>


					<div class="item_area">
						<i class="far fa-calendar-minus"></i>
						<input class="input_detail type4" type="date" name="">
					</div>

					

					<div class="item_area">
						<i class="far fa-comment-alt"></i>
						<textarea class="text_detail type"></textarea>
					</div>

					<div class="item_area type">
						<i class="fas fa-list-ul">하위 업무</i>
						<select>
							<option class="option_detail">요청</option>
							<option class="option_detail">요청</option>
							<option class="option_detail">요청</option>
							
						</select>
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
						<button type="button" class="upload_btn">올리기</button>	
					</div>														
				</div>

			</div>
		</div>

	</div>

	
	
</body>




</html>