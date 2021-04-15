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
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
	
  	
  	
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
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="kanbanboard_area">
		<div class="row">
		
		<!-- 보뜨 정보 (스프린트명, 인원) -->
			<div class="project_info_area">
				<div class="project_info">
					<div class="info_item">
						<div class="item_name">프로젝트명</div>
						<div class="item_detail"><input type="text" id="projectName" placeholder="${ projectName }" readonly style="border: none; background: transparent;"></div>
					</div>
					<div class="info_item">
						<div class="item_name">SPRINT_NO</div>
						<div class="item_detail"><input type="text" id="projectName" placeholder="${ requestScope.sprNo }" readonly style="border: none; background: transparent;"></div>
					</div>
					<div class="info_item">
						<div class="item_name">참여인원</div>
						<div class="item_detail">
						<c:forEach var="memberList" items="${memberList}">
							<i class="fas fa-user-circle"><c:out value="${ memberList.name }"/></i>				
						</c:forEach>
					
						</div>
					</div>
					
					<div class="info_item">
					<div id="newBoard" class="insert_board" data-toggle="modal"
						data-target="#myModal3">
						<i class="fas fa-plus"></i> 보드 생성하기</div>
					</div>
					
				</div>
			</div> 
			<!-- 보드 정보 영역 끝 -->
			
			
			
<!-- 내가 만든 보드  -->
<c:forEach var="boardList" items="${boardList }">
				<div class="kanban_item boardcolumn">
				<div class="kanbanboard type1" id="newBoard<c:out value="${boardList.brdOrder}"/>">
					<div class="kanbanboard_title board-header card no-move"><c:out value="${boardList.brdName}"/><i class="fas fa-ellipsis-v" id="modify"></i></div>
					
					
					<div class="kanbanboard_title board-header card no-move"><c:out value="${boardList.brdName}"/></div>
					<!--  카드 영역  -->
					<c:forEach var="cardList" items="${cardList }">
					
					<c:if test="${boardList.brdNo eq cardList.brdNo}">
					    <div class="board_item card">
                        <div class="item type1 card-header bg-white"><c:out value="${cardList.title}"/></div>
                        <div class="item type2 card-body">
                        <c:if test="${ 1 eq cardList.type}">
                            <span class="item_detail type">일반</span> 
                        </c:if>  
                        <c:if test="${ 2 eq cardList.type}">
                            <span class="item_detail type">업무</span> 
                        </c:if>  
                        <c:if test="${ 3 eq cardList.type}">
                            <span class="item_detail type">일정</span> 
                        </c:if>  
                        <c:if test="${ 4 eq cardList.type}">
                            <span class="item_detail type">업무</span> 
                            <span class="item_detail type">일정</span> 
                        </c:if>  
                        </div>
                        <div class="item type3">
                            <i class="fas fa-user-circle"><c:out value="${cardList.member}"/></i> <i
                                class="fas fa-user-circle"><c:out value="${cardList.memberList}"/></i>
                        </div>
                    </div>
					</c:if>
					 </c:forEach>
					                                                   
					<!-- /카드영역 -->
					<input type="text" value="${boardList.brdNo}" class="boardNo" name="" style="display: none;">
					
					
					<div id="progressSet" class="insert_card" data-toggle="modal"
						data-target="#myModal2">
						<i class="fas fa-plus" id="cardCreate"></i> 카드 생성하기
					</div>
				</div>
			</div>		
 </c:forEach>


		</div>
	</div>

<script type="text/javascript">
console.log("boardList" +  "${requestScope.boardList}");
</script>

	<input type="text" value="${ requestScope.pjtNo }" name="" id="" style="display: none;">


	<!-- The Modal -->
	<!--  -->
	<div class="modal fade" id="myModal2">
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
	
	<!-- Modal 보드 생성 (한미화) -->
	<div class="modal fade" id="myModal3">
		<div class="modal-dialog">
			<div class="modal-header type">Short Cut</div>
				<div class="modal-content">
				<form action="${ pageContext.servletContext.contextPath }/board/kanbanboard" method="post">
				<input type="hidden" name="pjtNo" value="${pjtNo}">
				<input type="hidden" name="projectName" value="${projectName}">
				
					<div class="modal-body">
					
						<input class="input_detail" type="text" name="title" id="title"
							placeholder="제목을 입력해주세요." size="50"
							style="border: none; background: transparent;">
						<input name="sprNo" type="hidden" value="${sprNo}">	
				</div>
				<!-- Modal footer -->
				<div class="modal_footer">
					<div class="btn_area">
					<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
						<input type="submit" class="upload_btn" id="newBoard" value="올리기">					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../board/card_detail.jsp"/>

</body>
<script type="text/javascript">

	$(function(){
		
		$(".board_item.card").click(function(){
		    
		   $("#cardModalUpdate").modal();
		    
		});
		
	/* 	var iddd = "";
	      
	      $(".board_item.card").click(function(e){
			e.preventDefault(); 			   	  
		      $("#cardModalUpdate").modal();
		      iddd = $(this).attr('id');
		      console.log('id : '+ $(this).attr('id'));
		      selectCardDetail($(this).attr('id'));
	    	  
	      }); */
	      
	})
</script>
<script type="text/javascript">
/* 보드 드래그앤 드롭(한미화) */
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

	/* 칸반보드 드래그앤드롭(한미화) */
	$(function() {
		$(".kanbanboard").sortable({
			connectWith: ".kanbanboard",
			handle: ".card-header",
			cancle : ".no-move",
			placeholder: "card-placeholder"
		});
		$(".no-move").disableSelection();
	});
	
	/* 보드생성 */

	$("#newBoard").click(function() {
		function makeTag(name, value) {
			var hiddenTag = document.createElement('input');
			hiddenTag.setAttribute("type", "hidden")
			hiddenTag.setAttribute("name", name)
			hiddenTag.setAttribute("value", value)
		}
	});
	/* $("#newBoard").click(fuction() {
		$.ajax({
			url : "newBoard";
			success : function(data, status, xhr) {
			console.log(data);
			
			const $div = $("#newBoard1");
			$div.html("");
			

			
			return hiddenTag
		}
		
		const kanbanboardList = document.getElement({'newBoard1', 'newBoard2', 'newBoard3'}).innerHTML;
		var brdName = document.getElementById("brdName").value;
		console.log("brdName : " + brdName);
		});
	*/
	//}); 

	/* 일정, 업무 버튼 */
	var count1 = 0;
	var count2 = 0;

	$(function() {
		
		var isTypeTwo = false;
		var isTypeThree = false;
		var isTypeFour = false;
		
		$("#workBtn").click(function(){

			if(isTypeTwo) {
				isTypeTwo = false;
			} else if(!isTypeTwo) {
				isTypeTwo = true;
			}
			
			if(isTypeTwo && isTypeThree) {
				isTypeFour = true;
			} else {
				isTypeFour = false;
			}

			resultToggle(isTypeTwo, isTypeThree, isTypeFour);
			
			$(".work_btn").toggleClass("on");
		});
		
		$("#calendarBtn").click(function(){
			
			if(isTypeThree) {
				isTypeThree = false;
			} else if(!isTypeThree) {
				isTypeThree = true;
			}
			
			if(isTypeTwo && isTypeThree) {
				isTypeFour = true;
			} else {
				isTypeFour = false;
			}
			
			resultToggle(isTypeTwo, isTypeThree, isTypeFour);
			
			$(".calendar_btn").toggleClass("on");
		});
		
		function resultToggle(isTypeTwo, isTypeThree, isTypeFour) {
			console.log("업무 : " + isTypeTwo);
			console.log("일정 : " + isTypeThree);
			console.log("업무&일정 : " + isTypeFour);
			
			let typeNumber = 1;
			
			if(isTypeTwo && !isTypeThree) {
				console.log("업무 : 2");
				typeNumber = 2;
			} else if(!isTypeTwo && isTypeThree) {
				console.log("일정 : 3");
				typeNumber = 3;
			} else if(isTypeTwo && isTypeThree && isTypeFour) {
				console.log("업무&일정 : 4");
				typeNumber = 4;
			} 
			
			console.log(typeNumber);
			var $pleaseType = document.getElementById("pleaseType");
			$pleaseType.value = typeNumber;
			
		}
	})
	
	/* 업무 진척도 버튼 색 바뀜 */
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
	
	$("#workBtn").click(function(){
	
	    $.ajax({
	        type:"POST",
	        url:"${pageContext.servletContext.contextPath}/card/cardmember",
	        data: {pjtNo: pjtNo},
	        success:function(data, status, xhr)
	        {
	        	
	        	console.log(data)
				if(data !==0){
					
					let memberList = data; 
					let list="";
					$("#member").empty();
					for(let i = 0; i < memberList.length; i++){
						
						var insertSpan="";
						insertSpan += '<span class="item_text onTask">' + memberList[i].name 
						+ '<i id="delBtn" class="fas fa-times-circle"></i>' 
			        	+ '<input class="item_num" name="member" type="hidden" value="' + memberList[i].no + '">' + '</span>';
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
	
	$("#calendarBtn").click(function(){
		
	    $.ajax({
	        type:"POST",
	        url:"${pageContext.servletContext.contextPath}/card/cardmember",
	        data: {pjtNo: pjtNo},
	        success:function(data, status, xhr)
	        {
	        	
	        	console.log(data)
				if(data !==0){
					
					let memberList = data; 
					let list="";
					$("#member2").empty();
					for(let i = 0; i < memberList.length; i++){
						
						var insertSpan="";
						insertSpan += '<span class="item_text on">' + memberList[i].name 
						+ '<i id="delBtn" class="fas fa-times-circle"></i>' 
			        	+ '<input class="item_num" name="memberList" type="hidden" value="' + memberList[i].no + '">' + '</span>';
						count++;
						$("#member2").append(insertSpan);
					}
				} 
	        	
	        
	    },
	        error:function(data){
				console.log(error);
			}
	      });
	});
	
	var progress = "";
	$(".insert_card").click(function() {
		$("#brdremove").remove();
		var btnplace = $(this).closest(".kanbanboard").find(".boardNo").val();
		var form = $("#card_insert");
		var html = '<input type="hidden" id="brdremove" name="brdNo" value="'+btnplace +'">'
		form.append(html);
		
		$("#workBtn").click(function() {
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
	});
	
	var type = "";
	$("#progressSet").click(function() {
		
		$("#request").click(function() {
			type = 1;
		})
		
		$("#calendarBtn").click(function() {
			type = 2;
		})
	});
	
	function emailNull(value){
		if(value === null) return true;
		if(typeof value === 'string' && value === '') return true;
		if(typeof value === 'undefined') return true;
		return false;
	}
	
	$(document).on('click','.item_text.onTask',function(){
		
		var $t = $(this).siblings();
		
		$t.remove();
		count--;
	});
	$(document).on('click','.item_text.on',function(){
		
		var $t = $(this);
		
		$t.remove();
		count--;
	});
</script>
</html>