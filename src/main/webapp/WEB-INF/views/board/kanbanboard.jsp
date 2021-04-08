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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/kanbanboard.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 폰트어썸 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet">
<!-- Jquery UI -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.board-placeholder {
	border: 1px dotted black;
	margin: 0 1em 1em 0;
	height: 50px;
	margin-left: auto;
	margin-right: auto;
	/* 노란색으로 표신되는 것이 주요 포인트 */
	background-color: yellow;
}
/* 마우스 포인터을 손가락으로 변경 */
.card:not(.no-move) .board-header {
	cursor: pointer;
	justify-content: center;
}
/* 일정, 업무 버튼 */
.work_btn.on {
	display: none;
}
.calendar_btn.on {
	display: none;
}
/* 업무 진행도 버튼 */
.btn-group .button {
	background-color: #00ff0000;
	border: 1px solid green;
	color: black;
	padding: 5px 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	float: left;
}

.btn-group .button on {
	background-color: #4CAF50;
}

.btn-group .button:not(:last-child) {
	border-right: none;
}
</style>

<title>Short Cut</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="kanbanboard_area">
		<div class="row">
			<div class="project_info_area">
				<div class="project_info">
					<div class="info_item">
						<div class="item_name">프로젝트명</div>
						<div class="item_detail">Short Cut</div>
					</div>
					<div class="info_item">
						<div class="item_name">Backlog No</div>
						<div class="item_detail">C001-9</div>
					</div>
					<div class="info_item">
						<div class="item_name">참여인원</div>
						<div class="item_detail">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i> <i class="fas fa-user-circle">정민서</i>
							<i class="fas fa-user-circle">한미화</i> <i
								class="fas fa-user-circle">미스터추</i>
						</div>
					</div>

				</div>
			</div>

			<div class="kanban_item boardcolumn">
				<div class="kanbanboard type1">
					<div class="kanbanboard_title board-header">요청</div>
					<div class="board_item">
						<div class="item type1">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type">네이버</span> <span
								class="item_detail type">google</span> <span
								class="item_detail type">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="insert_card" data-toggle="modal"
						data-target="#myModal2">
						<i class="fas fa-plus"></i> 카드 생성하기
					</div>
				</div>
			</div>
			<div class="kanban_item boardcolumn">
				<div class="kanbanboard type2">
					<div class="kanbanboard_title board-header">진행중</div>
					<div class="board_item">
						<div class="item type1">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type1">네이버</span> <span
								class="item_detail type1">google</span> <span
								class="item_detail type1">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type1">네이버</span> <span
								class="item_detail type1">google</span> <span
								class="item_detail type1">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type1">네이버</span> <span
								class="item_detail type1">google</span> <span
								class="item_detail type1">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type1">네이버</span> <span
								class="item_detail type1">google</span> <span
								class="item_detail type1">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
				</div>
			</div>
			<div class="kanban_item boardcolumn">
				<div class="kanbanboard type3">
					<div class="kanbanboard_title board-header">완료</div>
					<div class="board_item">
						<div class="item type1">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type2">네이버</span> <span
								class="item_detail type2">google</span> <span
								class="item_detail type2">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item board-header">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type2">네이버</span> <span
								class="item_detail type2">google</span> <span
								class="item_detail type2">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div class="board_item">
						<div class="item type1">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type2">네이버</span> <span
								class="item_detail type2">google</span> <span
								class="item_detail type2">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
				</div>
			</div>
			<div class="kanban_item boardcolumn">
				<div class="kanbanboard type4">
					<div class="kanbanboard_title board-header">보류</div>
					<div class="board_item">
						<div class="item type1">SNS 로그인</div>
						<div class="item type2">
							<span class="item_detail type3">네이버</span> <span
								class="item_detail type3">google</span> <span
								class="item_detail type3">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>





	<!-- The Modal -->
	<!--  -->
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-header type">Short Cut</div>
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">


						<div class="modal_list">
							<i class="fas fa-check"><button id="workBtn"
									style="background: #00ff0000; border: 0;">업무</button></i>
						</div>
						<div class="modal_list">
							<i class="fas fa-calendar-week"><button id="calendarBtn"
									style="background: #00ff0000; border: 0;">일정</button></i>
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
						<input class="input_detail" type="text" name="title"
							placeholder="제목을 입력해주세요."
							style="border: none; background: transparent;">
					</div>

					<!-- 업무 영역 -->
					<div class="item_area work_btn on">
						<i class="fas fa-spinner"></i>
						<div class="btn-group">
							<button class="button on" name="request">요청</button>
							<button class="button on" name="progress">진행</button>
							<button class="button" name="feedback">피드백</button>
							<button class="button" name="completion">완료</button>
							<button class="button" name="hold">보류</button>
						</div>

					</div>
				<%-- <form action="${ pageContext.servletContext.contextPath }/board" method="get"> --%>
					<div class="item_area work_btn on">
						<i class="fas fa-user-plus"></i> 
						<!-- <input class="input_detail type1" id="selectmember" type="text" name="addMember" placeholder="Add Member" 
						value="">  -->
						<div id="choisemember"></div>
						<input class="input_detail type2" id="addMember" type="button" name="addMember" value="멤버조회">
						<div id="member"></div>
					</div>
				<!-- </form> -->
					<div class="item_area work_btn on">
						<i class="far fa-calendar-plus"></i> <input
							class="input_detail type4" type="date" name=""> &nbsp; -
						&nbsp; <i class="far fa-calendar-minus"></i> <input
							class="input_detail type4" type="date" name="">
					</div>
					<!-- 업무영역 끝 -->

					<!-- 일정 -->
					<div class="item_area calendar_btn on">
						<i class="far fa-clock"></i> <input type='datetime-local'>~<input
							type='datetime-local'>
					</div>
					<div class="item_area calendar_btn on">
						<i class="fas fa-user-plus"></i> <input class="input_detail type1"
							type="text" name="name" placeholder="Add Member"> <input
							class="input_detail type2" type="button" name="name" value="Add">
					</div>
					<div class="item_area calendar_btn on">
						<i class="fas fa-map-marker-alt"></i><input
							class="input_detail type3" type="text" name="name" size="20px"
							placeholder="장소를 입력하세요"
							style="border: none; background: transparent;">
					</div>
					<div class="item_area calendar_btn on">
						<i class="fas fa-bell"></i> <select class="select_detail">
							<option>30분 전 미리 알림</option>
							<option>하루 전 미리 알림</option>
							<option>알리지 않음</option>
						</select>
					</div>
					<!-- 일정 영역 끝 -->

					<div class="item_area">
						<i class="far fa-comment-alt"></i>
						<textarea class="text_detail type"></textarea>
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
<script type="text/javascript">
	$(function() {
		$(".boardcolumn").sortable({
			// 드래그 앤 드롭 단위 css 선택자
			connectWith : ".boardcolumn",
			// 움직이는 css 선택자
			handle : ".board-header",
			// 움직이지 못하는 css 선택자
			cancel : ".no-move",
			// 이동하려는 location에 추가 되는 클래스
			placeholder : "board-placeholder"
		});
		// 해당 클래스 하위의 텍스트 드래그를 막는다.
		$(".boardcolumn .card").disableSelection();
	});

	$(".kanban_item").children('div').click(function() {

	})

	/* 일정, 업무 버튼 */
	var count1 = 0;
	var count2 = 0;

	$(function() {
		$("#workBtn").click(function(e) {
			e.preventDefault();

			$(".work_btn").toggleClass("on");
		})

		$("#calendarBtn").click(function(e) {
			e.preventDefault();

			$(".calendar_btn").toggleClass("on");
		})
	})
	
	 $(function() {
          $('.button').click(function() {
              $('.button').removeAttr("style");
              $(this).css("background", "#8592D6");
          });
      });
	
	
</script>
<script>
/* 시큐리티 권한  */
const token = $("meta[name='_csrf']").attr("content");
const header = $("meta[name='_csrf_header']").attr("content");

$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$("#addMember").one("click", function(){
    $.ajax({
        type:"POST",
        url:"${pageContext.servletContext.contextPath}/board/kanbanboard",
        success:function(data, status, xhr)
        {
        	console.log(data);
            let memberList=data;
            let res="";
            	
            var choisemember = document.getElementById("choisemember");
        	var member = document.getElementById("member");
            for(let i = 0; i < memberList.length; i++)
            {
            	const nike = document.createElement("button");
            	
            	member.style.fontSize = 12+"px";
            	member.style.padding = 5+"px";
            	nike.style.backgroundColor = "#fce4ec";
            	nike.style.color = "black";
            	nike.style.margin = 5+"px";
            	nike.innerHTML = nike.value = memberList[i].name;
            	member.appendChild(nike);
            	
            }
        
        var $mem = document.getElementById("member");
        var $mem1 = document.getElementById("choisemember");
        const $mems = $mem.childNodes;
        
        for(let i = 0; i < memberList.length; i++) {
        	$mems[i].onclick = function() {
        		const nikes = document.createElement("button");
        		
        		nikes.style.fontSize = 10+"px";
        		nikes.style.padding = 5+"px";
        		nikes.style.backgroundColor = "#eeffff";
        		nikes.style.color = "black";
        		nikes.style.margin = 5+"px";
        		nikes.innerHTML = nikes.value = memberList[i].name;
        		$mem1.appendChild(nikes);
        		
        		$(document).on('click','#bc',function(e){
        			e.preventDefault();
        			
                	var t = $(this);
                	
                	t.toggleClass();
                	
        			
        		})
        		
        		
          		if(nikes.style.backgroundColor = "#eeffff") {
        			nikes.id = "bc";
	        		var $bc = document.getElementById("bc");
	        		$bc.onclick = this.remove();
        		}
        		
        		nikes.id = "ac";
        		
        		if(nikes.id = "ac") {
	        		var $ac = document.getElementById("ac");
	        		$ac.onclick = this.remove();
	        		nikes.id = "bc";
        		} 
        		
        	}
        	
        	
        }
        
    }
      });
});
</script>
</html>