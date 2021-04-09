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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
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
	border: 1px dotted;
	margin: 0 1em 1em 0;
	height: 10px;
	background-color:darkgray;
	/* 노란색으로 표신되는 것이 주요 포인트 */
	
	pisition: absolute;
}
/* 마우스 포인터을 손가락으로 변경 */
.card:not(.no-move) .board-header {
	cursor: pointer;
	justify-content: center;
	cursor: move;
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
		
		<!-- 보뜨 정보 (스프린트명, 인원) -->
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
			</div> <!-- 보드 정보 영역 끝 -->
			
			
			<!--<c:forEach var="msgList" items="${requestScope.msgList }">
							<div class="recv_item"><c:out value="${ msgList.no }"/></div>
							<div class="recv_item"><c:out value="${ msgList.pjtName }"/></div>
							<div class="recv_item"><c:out value="${ msgList.type }"/></div>
							<div class="recv_item"><c:out value="${ msgList.txt }"/></div>
							<div class="recv_item"><c:out value="${ msgList.memName }"/></div>
							<div class="recv_item"><c:out value="${ msgList.date }"/></div>
                         </c:forEach> -->

				<!-- 카드1 -->
			<div class="kanban_item boardcolumn">
				<div class="kanbanboard type1">
					<div class="kanbanboard_title board-header card no-move">요청</div>
					<div class="board_item card">
						<div class="item type1 card-header bg-white">SNS 로그인</div>
						<div class="item type2 card-body">
							<span class="item_detail type">네이버</span> <span
								class="item_detail type">google</span> <span
								class="item_detail type">카카오톡</span>
						</div>
						<div class="item type3">
							<i class="fas fa-user-circle">김민기</i> <i
								class="fas fa-user-circle">이남경</i>
						</div>
					</div>
					<div id="progressSet" class="insert_card" data-toggle="modal"
						data-target="#myModal2">
						<i class="fas fa-plus"></i> 카드 생성하기
					</div>
			</div>
				</div><!-- 카드1 끝 -->
				
				<!-- 카드2 -->
			<div class="kanban_item boardcolumn">
				<div class="kanbanboard type2">
					<div class="kanbanboard_title board-header card no-move">진행중</div>
					<div class="board_item card">
						<div class="item type1 card-header bg-white">SNS 로그인</div>
						<div class="item type2 card-body">
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
			</div><!-- 카드2 -->
			
			<!-- 카드3 -->
			<div class="kanban_item boardcolumn">
				<div class="kanbanboard type3">
					<div class="kanbanboard_title board-header card no-move">완료</div>
					<div class="board_item card">
						<div class="item type1 card-header bg-white">SNS 로그인</div>
						<div class="item type2 card-body">
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
			</div><!-- 카드3 끝 -->
			
			<!-- 카드4 -->
			<div class="kanban_item boardcolumn">
				<div class="kanbanboard type4">
					<div class="kanbanboard_title board-header card no-move">>완료</div>
					<div class="board_item card">
						<div class="item type1 card-header bg-white">SNS 로그인</div>
						<div class="item type2 card-body">
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
			</div><!-- 카드4 끝-->

		</div>
	</div>


	<input type="text" value="${ requestScope.pjtNo }" name="" id="" style="display: none;">


	<!-- The Modal -->
	<!--  -->
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-header type">Short Cut</div>
			<form name="projectMemberList">
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
						<input class="input_detail" type="text" name="title" id="title"
							placeholder="제목을 입력해주세요."
							style="border: none; background: transparent;">
					</div>

					<!-- 업무 영역 -->
					<div class="item_area work_btn on">
						<i class="fas fa-spinner"></i>
						<div class="btn-group">
							<button class="button on" name="request" id="request" type="button">요청</button>
							<button class="button on" name="progress" id="progress" type="button">진행</button>
							<button class="button" name="completion" id="completion" type="button">완료</button>
							<button class="button" name="hold" id="hold" type="button">보류</button>
						</div>

					</div>
				<%-- <form action="${ pageContext.servletContext.contextPath }/board" method="get"> --%>
					<div class="item_area work_btn on">
						<i class="fas fa-user-plus"></i> 
						<!-- <input class="input_detail type1" id="selectmember" type="text" name="addMember" placeholder="Add Member" 
						value="">  -->
						<div id="choisemember"></div>
						<input class="input_detail type2" id="addMember" type="reset" name="addMember" value="멤버조회">
						<div id="member"></div>
						<p class="memberNo" style="display:none">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}</p>
					</div>
				<!-- </form> -->
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
						<select class="select_detail" name="alarm">
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
						<button type="button" class="upload_btn" id="upload">올리기</button>
					</div>
				</div>
			</div>
			</form>
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
			
			// 이동하려는 location에 추가 되는 클래스
			placeholder : "board-placeholder"
		});
		// 해당 클래스 하위의 텍스트 드래그를 막는다.
		$(".boardcolumn .card").disableSelection();
	});

	/* 한미화 */
	$(function() {
	$(".kanbanboard").sortable({
		connectWith: ".kanbanboard",
		handle: ".card-header",
		cancle : ".no-move",
		placeholder: "card-placeholder"
	});
	$(".insert_card").disableSelection();
});o

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
var pjtNo = ${requestScope.pjtNo};

$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

var count = 0;

$("#addMember").on("click", function(){
    $.ajax({
        type:"POST",
        url:"${pageContext.servletContext.contextPath}/board/kanbanboard",
        data: {pjtNo: pjtNo},
        success:function(data, status, xhr)
        {
        	
        	console.log(data)
			if(data !==0){
				
				let memberList = data; 
				let list="";
				
				for(let i = 0; i < memberList.length; i++){
					
					var insertSpan="";
					insertSpan += '<span class="item_text on">' + memberList[i].name + '<i id="delBtn" class="fas fa-times-circle"></i>' + '</span>';
					count++;
					$("#member").append(insertSpan);
				}
			} 
        
    },
        error:function(data){
			console.log(error);
		}
      });
});

var progress = "";
$("#progressSet").click(function() {
	
	$("#request").click(function() {
		progress = 1;
	})
	
	$("#progress").click(function() {
		progress = 2;
	})
	
	$("#completion").click(function() {
		progress = 3;
	})
	
	$("#hold").click(function() {
		progress = 4;
	})
})
	
$("#upload").click(function() {
	
	const projectMemberList = document.getElementById('myModal2').innerHTML;
	
	var cardMember = $('form[name=projectMemberList]').serializeArray();
	
	cardMember.push({name : "progress", value : progress});
	
	for(let i = 0; i < count; i++){
	   memberAttend = $('#member').find(".item_text").eq(i).text();
	   cardMember.push({name : "memberAttend", value : memberAttend});
	   var index = i + 1;
	   console.log(memberAttend);
	}
	
	console.table(cardMember);
	
	$.ajax({
		url: "/board/kanbanboard/${ requestScope.pjtNo }",
		type: "POST",
		data: {cardMember : cardMember},
		success: function(data, status, xhr) {
			console.log(data);
		},
		error(xhr, status, error) {
			console.log(error);
		}
	});
	
});

function emailNull(value){
	if(value === null) return true;
	if(typeof value === 'string' && value === '') return true;
	if(typeof value === 'undefined') return true;
	return false;
}



$(document).on('click','.item_text.on',function(){
	
	var $t = $(this);
	
	$t.remove();
	count--;
}) 
</script>
</html>