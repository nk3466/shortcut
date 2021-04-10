<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/backlog.css">
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
	<div class="backlog_area">
		<div class="backlog_header_area">
			<span class="backlog_header">
				Backlog	& Sprint		
			</span>			
		<div class="meeting_btn"  data-toggle="modal" data-target="#project_produce_Detail">Edit Project</div>
			<a class="meeting_btn" href="${ pageContext.servletContext.contextPath }/meeting/meetinglog">Meeting Log</a>
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
				
					<a href="${pageContext.servletContext.contextPath }/board/kanbanboard/${ requestScope.pjtNo }">
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
					<button class="backlog_btn_detail"  data-toggle="modal" data-target="#myModal">Create Backlog</button>	
				</label>					
			</div>
			
		</div>	


		<div class="sprint_box_area">			
			
			<div class="sprint_text_btn">
				<span class="sprint_text">Sprint Review</span>					
			</div>	
			
			<div class="sprint_box on"></div>
			
			<div class="table_area">
				<div class="table_item">
					<div class="row">
						<table style="width: 100%;">
							<thead>
								<tr>
									<th class="">No</th>
									<th class="">이름</th>
									<th class="">우선순위</th>
									<th class="">종료날짜</th>
									<th class="">데모방식</th>
									<th class="">비고</th>
									<th>리뷰 작성 / 수정</th>
									<th>기록</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(requestScope.finishSprintList) > 0 }">
										<c:forEach var="finishSprint" items="${ requestScope.finishSprintList }">
											<tr>
												<td class="">${ finishSprint.blgNo }</td>
												<td class="">${ finishSprint.blgName }</td>
												<td class="">${ finishSprint.blgPri }</td>
												<td class="">${ finishSprint.sprEndDate }</td>
												<td class="">${ finishSprint.blgDemoMemo }</td>
												<td class="">${ finishSprint.blgRefMemo }</td>
												<td><button class="btn_detail_retro" onclick="retrospect();">리뷰 작성</button></td>
												<td><button class="btn_detail_retro">기록</button></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="8">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>

					<script>
						function retrospect() {
							location.href = "${ pageContext.servletContext.contextPath }/board/backlog/retrospect";
						}
					</script>
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
					<div class="row nk3">
						<div class="backlog_info">
							
							<div class="info_item">
								<div class="info_detail">이름</div>
								<input class="input_detail" type="text" name="">
							</div>
							<div class="info_item">
								<div class="info_detail">중요도</div>
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
	<!-- 프로젝트 수정 모달 -->
<div class="modal fade" id="project_produce_Detail">
   <div class="modal-dialog">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="row detailpage">
         	<div class="left_area">
         		<div class="modal-header">
					<div class="item_detail">프로젝트 이름</div>
					<input class="input_detail nk type" type="text" id="projectName" placeholder="${projectList.projectName }" readonly>            
				</div>
		         <div class="modal-header">
		         	<div class="item_detail">시작 날짜 </div>
		         	<input class="input_detail nk type" type="text" id="projectStartDate" placeholder="${projectList.projectStartDate } " readonly style="border : 0;"/>
		         </div>
         		<div class="modal-header">
		         	<div class="item_detail">종료 날짜</div>
		         	<input class="input_detail nk type" type="text" id="projectEndDate" placeholder="${projectList.projectEndDate } " readonly style="border : 0;"/>
		         </div>
		         <div class="modal-header">
		            <div class="item_detail">프로젝트 색상</div>
		        	<input class="input_detail nk type" style="background-color: ${projectList.projectColor};" id="projectColor" readonly style="border : 0;">  
		         </div> 
         	</div>
         	<div class="right_area">
				<div class="modal-header">
					<div class="item_detail">프로젝트 이름</div>
					<input class="input_detail nk type" type="text" id="projectNameEdit" placeholder="수정할 프로젝트 이름">            
				</div>
				<div class="modal-header">
					<div class="item_detail">수정 시작 날짜</div>
		            <input class="input_detail nk type" type="date" id="projectStartDateEdit"  placeholder="${projectList.projectStartDate }">         
		         </div>
		         <div class="modal-header">
		            <div class="item_detail">수정 종료 날짜</div>
		         	<input class="input_detail nk type" type="date" id="projectEndDateEdit">  
		         </div>
		         <div class="modal-header">
		            <div class="item_detail">수정할 프로젝트 색상</div>
		        	<input class="input_detail nk type" type="color" id="projectColorEdit">  
		         </div> 
         	</div>
         </div>
         
                
         <!-- Modal body -->
         
         <div class="modal-body">
            <div class="row">
               <i class="fas fa-search"></i>
               <input class="input_detail1" type="text" id="emailEdit" placeholder="Add Member" style="width:66%;">
               <select class="select_detail nk" id="selectrollEdit">
                  <option>Admin</option>
                  <option>Member</option>
                  <option>Client</option>
               </select>
               <input class="input_detail2 nk" type="button" id="addpersonButtonEdit" value="+">      
               <input class="input_detail2 nk" type="button" id="removepersonButtonEdit" value="-">      
            </div>

				<table class="select_member" id="projectMember" border="1" style="width:100%; height:30px; text-align: center">
					<thead>
					<tr>
						<th style="width:60px; align-content: center;" >번호</th>
						<th>이메일</th>
						<th style="width:100px;">권한</th>
						<th style="width:100px; display:none">회원번호</th>
					</tr>
					<tr>
						<th>1</th>
						<th  class="Email">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</th>
						<th class="roll">Admin</th>
						<th class="memberNo" style="display:none">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}</th>
					</tr>
					</thead>
					<tbody  id="dynamicTbody">
					<c:if test="${ !empty requestScope.memberList }">
					  <c:forEach items="${memberList}" var="member" varStatus="st">
					  <tr>
					  <c:set var="countMember" value="${ st.count +1}"  />	<!-- st가 1부터 시작하여 1을 더하여 출력 -->
						<th>${countMember }</th>
						<th class="Email">${member.memberId}</th>
						<th class="roll">
						<c:choose>
							<c:when test="${ member.projectRole == 1}">Admin</c:when>
							<c:when test="${ member.projectRole == 2}">Member</c:when>
							<c:when test="${ member.projectRole == 3}">Client</c:when>
						</c:choose>
						
						</th>
						<th class="memberNo" style="display:none">${member.memberNo}</th>
						</tr>
						</c:forEach>
					</c:if> 
					</tbody>
				</table>
         </div>
            
         
         <div class="modal_btn_area">
            <button class="btn_detail" id="editProject">Edit Project</button>
            <button class="btn_detail" id="removeProject">Remove Project</button>
         </div>            
      </div>
   </div>
</div>
</body>
<script>
		/* 시큐리티 권한  */
		const token = $("meta[name='_csrf']").attr("content");
		const header = $("meta[name='_csrf_header']").attr("content");
		
		$(document).ajaxSend(function(e, xhr, options) {
		    xhr.setRequestHeader(header, token);
		});
		var start = ${projectList.projectStartDate };
		var End = ${projectList.projectEndDate };
		
		//인원삭제 버튼 클릭
		$("#removepersonButtonEdit").click(function(){
			$("#dynamicTbody tr:last").remove();
		});
		
		/* 이메일 null 체크 */
		function vali(value){
		    if (value === null) return true; 
		    if (typeof value === 'string' && value === '') return true;
		    if (typeof value === 'undefined') return true;
		    return false;
		}
		var idcount = 1;
		/* 인원추가 */
		$("#addpersonButtonEdit").click(function(){
			
			var email = $("#emailEdit").val();			//입력한 이메일
			
				if(!vali($("#emailEdit").val())){
					/* 아이디 중복 체크 */
					$.ajax({
						url:"${pageContext.servletContext.contextPath}/board/projectidDupCheckEdit",
						type:"post",
						data:{email :email},
						success:function(data){
							console.log(data);
							/* 아이디가 있을 때 */
							if(data !== 0){
								var addMember = $("#projectMember tr:last");
								var insertTr="";
								 insertTr += '<tr id="addpersionList_' + (idcount++) +'">';
								 insertTr += '<td class="num">'+  (idcount) + '</td>';
								 insertTr += '<td class="Email">'+	document.getElementById("emailEdit").value + '</td>';
								 insertTr += '<td class="roll">'+	document.getElementById("selectrollEdit").value + '</td>';
								 insertTr += '<td class="memberNo" style="display:none">' + data + '</td>';
								 insertTr += '</tr>';
								 $("#dynamicTbody").append(insertTr);
								 $("#emailEdit").val('');	//입력 후 input  비워주기
							}else{
							alert("가입된 이메일주소가 아닙니다. 확인 해주세요~");
							 $("#emailEdit").val('');
							}
							
						}, error:function(data){
						}
					});
					
			}else{
				alert("이메일을 입력해주세요");
			}
				});
		
		/* 프로젝트 수정 버튼 클릭 */
		$("#editProject").click(function(){ 
			function makeTag(name, value){
				var hiddenTag = document.createElement('input');
				hiddenTag.setAttribute("type", "hidden")
				hiddenTag.setAttribute("name", name)
				hiddenTag.setAttribute("value", value)
				return hiddenTag
			}
			
		   var memberNo = ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no};
		   console.log(memberNo);
			const projectMemberList = document.getElementById('dynamicTbody').innerHTML;
			var $form = $('<form></form>');
		   var projectName = document.getElementById("projectNameEdit").value;
		   var projectStartDate = document.getElementById("projectStartDateEdit").value;
		   var projectEndDate = document.getElementById("projectEndDateEdit").value.defaultValue = "2999-12-31";
		   var projectColor = document.getElementById("projectColorEdit").value;
		   console.log("projectName : " + projectName);
		   console.log("projectStartDate : " + projectStartDate);
		   console.log("projectEndDate : " + projectEndDate);
		   console.log("projectColor : " + projectColor);
		   
		  		   	
		   var nk1 = $('form[name=projectMemberList]').serializeArray();
		   var projectMaker = $("#projectMember").find(".memberNo").eq(0).text();
		    for(let i = 0; i < idcount; i++){
			   memberId = $("#projectMember").find(".Email").eq(i).text();
			   console.log("Email : " + memberId);
			   projectRole = $("#projectMember").find(".roll").eq(i).text().trim();
			   memberNo = $("#projectMember").find(".memberNo").eq(i).text();
			   if(projectRole === 'Admin'){
				   projectRole = 1;
			   }else if(projectRole === 'Member'){
				   projectRole = 2;
			   }else if(projectRole === 'Client'){
				   projectRole = 3;
			   }
			   console.log("roll : " + projectRole);
			   
			   nk1.push({ name : "memberNo", value : memberNo}, 
						{ name : "projectRole",value : projectRole}
						);
				
			   $form.append(makeTag(memberId, memberId));
			   $form.append(makeTag(projectRole, projectRole));
		   } 
		   
		   console.table("얍 " + nk1);
		   
		   $.ajax({
			   url :"${pageContext.servletContext.contextPath}/board/backlog/project_edit",
			   type : "post",
			   data :  {
				   nk1 : nk1,
				   memberNo : projectMaker,
				   projectName : projectName,
				   projectStartDate : projectStartDate,
				   projectEndDate : projectEndDate,
				   projectColor : projectColor
				    },
			
			   success : function(data, textStatus, xhr) {
				   alert("프로젝트 수정이 완료되었습니다.");
					location.href = "${pageContext.servletContext.contextPath}/board/backlog/" + ${ requestScope.pjtNo };
			   },
				error : function(xhr, status, error) {
					console.log(error);
					alert("프로젝트 수정이 취소되었습니다.");
					location.href = "${pageContext.servletContext.contextPath}/board/backlog";
				}
		   });
		})
		</script>
		<script>
		var memberNo = ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no};
		var projectStartDate = "${projectList.projectStartDate }";
		var projectEndDate = "${projectList.projectEndDate }";
		var projectName = "${projectList.projectName }";
		var projectColor = "${projectList.projectColor }";
				   
		/* 프로젝트 삭제 버튼 클릭시 */
		$("#removeProject").click(function(){
			   if(confirm("정말 삭제하시겠습니까 ?") == true){
			var pjtNo = ${ requestScope.pjtNo };
					$.ajax({
						url:"${pageContext.servletContext.contextPath}/board/projectRemove",
						type:"post",
						data:{
							pjtNo :pjtNo,
							projectName : projectName,
							projectStartDate : projectStartDate,
							projectEndDate : projectEndDate,
							projectColor : projectColor
						},
						success:function(data, textStatus, xhr) {
						     alert("프로젝트가 삭제되었습니다");
						     location.href = "${pageContext.servletContext.contextPath}/board/project_board/" + memberNo;
						}, error:function(xhr, status, error){
						     location.href = "${pageContext.servletContext.contextPath}/board/backlog"+ ${ requestScope.pjtNo };
							
						}
					});
					
			   }
			    else{
			        return ;
			    }
					
			});
</script>
</html>