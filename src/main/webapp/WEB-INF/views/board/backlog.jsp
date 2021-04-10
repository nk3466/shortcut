<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				Backlog			
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
					<button class="backlog_btn_detail"  data-toggle="modal" data-target="#myModal">Create</button>	
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
					<div class="pagingArea" align="center">
						<%-- <c:when test="${ empty requestScope.searchValue }"> --%>
							<button id="startPage"><<</button>
							<c:if test="${ requestScope.pageInfo.pageNo <= 1 }">
								<button disabled><</button>
							</c:if>
							<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
								<button id="prevPage"><</button>
							</c:if>
							
							<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
								<c:if test="${ requestScope.pageInfo.pageNo eq p }">
									<button class="admBtn" disabled><c:out value="${ p }"/></button>
								</c:if>
								<c:if test="${ requestScope.pageInfo.pageNo ne p }">
									<button class="admBtn" onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
								</c:if>
							</c:forEach>
										
							<c:if test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
								<button class="admBtn" disabled>></button>
							</c:if>
							<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
								<button class="admBtn" id="nextPage">></button>
							</c:if>
							<button type="button" class="admBtn" id="maxPage">>></button>
						<%-- </c:when> --%>
					</div>
					
<button type="button" id="please">please</button>
	<script>
	const token = $("meta[name='_csrf']").attr("content");
	const header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});
		var one = 1;
		var two = "two";
		var pjtNo = ${requestScope.pjtNo};
	
		$("#please").click(function() {
			console.log("a")
			$.ajax({
				url: "${pageContext.servletContext.contextPath}/board/backlog/please",
				method: "GET",
				data: {
					one: one,
					two: two,
					pjtNo: pjtNo
				},
				success: function(data, status, xhr) {
					console.log(data);
				},
				error: function(xhr, status, error) {
					console.log(error);
				}
			});
		});
	</script>
					
					<script>
						const link = "${ pageContext.servletContext.contextPath }/board/backlog";
					
						if(document.getElementById("startPage")) {
							const $startPage = document.getElementById("startPage");
							$startPage.onclick = function() {
								location.href = link + "?currentPage=1";
							}
						}
						
						if(document.getElementById("prevPage")) {
						    const $prevPage = document.getElementById("prevPage");
						    $prevPage.onclick = function() {
						        location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo - 1}";
						    }
					    }
						    
					    if(document.getElementById("nextPage")) {
						    const $nextPage = document.getElementById("nextPage");
					        $nextPage.onclick = function() {
					            location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo + 1}";
					        }
					    }
						    
					    if(document.getElementById("maxPage")) {
						    const $maxPage = document.getElementById("maxPage");
						    $maxPage.onclick = function() {
						        location.href = link + "?currentPage=${ requestScope.pageInfo.maxPage }";
						    }
					    }
						    
						function pageButtonAction(text) {
							console.log("success");
							console.log(typeof text);
							pagingAjax();
							 /*  location.href = link + "?currentPage=" + text; */
				        }
					</script>
					<script>
					
						function pagingAjax() {
							
							var abc = "1";
							
							$.ajax({
								url : "${pageContext.servletContext.contextPath}/board/backlog/reviewPaging",
								method : "POST",
								success : function(data, status, xhr) {
									console.log(data);
									console.log(status);
									console.log(xhr);
								},
								error : function(xhr, status, error) {
									console.log(xhr);
									console.log(status);
									console.log(error);
								}
							});
						}
					
						function retrospect() {
							location.href = "${ pageContext.servletContext.contextPath }/board/backlog/retrospect";
						}
					</script>
<!-- 					<script type="text/javascript">
						$(document).ready(function() {
							boardMain.init();
						});
						
						var boardMain = {
								init : function() {
									var _this = this;
									_this.getBoardList();
								}
								,getBoardList : function(no) {
									
									var pageNo = (no || 1);
									
									$.ajax({
										url : "board/backlog",
										type : "GET",
										data : "countPerPage=" + 5 + "&pageNo=" + pageNo,
										success : function(data, status, xhr) {
											
											var item = data.finishSprintList;
											var selectHtml = [];
											var len = item.length;
											
											var page = data.pageInfo;
											var page_boardList = Paging(page.totalCount, page.limit, page.buttonAmount, pageNo, "boardList");
											
											if(len > 0) {
												$(item).each(function(i, item) {
													selectHtml.push('<tr>');
													selectHtml.push('<td><a href="#">' + item.DOCNUM + '</a></th>');
													selectHtml.push('<th class="boardTitle" id="' + item.DOCNUM + '"><a href="#">' + (item.TITLE || "제목없음"))+'</a></th>');
													selectHtml.push('<td>' + item.ADD_USR_NM + '</td>');
													selectHtml.push('<td>' + item.VIEWCONUT + '</td>');
													selectHtml.push('</tr>');
												});
											} else {
												selectHtml.push('<tr>');
												selectHtml.push('<td colspan="3">조회된 결과가 없습니다.</td>');
												selectHtml.push('</tr>');
											}
											
											$("#boardList").empty().html(selectHtml.join(''));
											
											$("#paging").empty().html(page_boardList);
										},
										error : function(xhr, status, error) {
											console.log(xhr);
											console.log(status);
											console.log(error);
										}
									});
									
								}	
						}
						
						var goPaging_boardList = function(cPage) {
							boardMain.getBoardList(cPage);
						}
						
						Paging = function(totalCount, limit, buttonAmount, pageNo, token) {
							totalCount = parseInt(totalCount);
							limit = parseInt(limit);
							buttonAmount = parseInt(buttonAmount);
							pageNo = parseInt(pageNo);
							
							var html = new Array();
							if(totalCount == 0) {
								return "";
							}
							
							var pageCnt = totalCount % limit;
							if(pageCnt == 0) {
								pageCnt = parseInt(totalCnt / limit);
							} else {
								pageCnt = parseInt(totalCnt / limit) + 1;
							}
							
							var pRCnt = parseInt(pageNo / buttonAmount);
							if(pageNo % buttonAmount == 0) {
								pRCnt = parseInt(pageNo / buttonAmount) - 1;
							}
							
							if(pageNo > buttonAmount) {
								var s2;
								if(pageNo % pageSize == 0) {
									s2 = pageNo - pageSize;
								} else {
									s2 = pageNo - pageNo % pageSize;
								}
								html.push('<a href=javascript:goPaging_' + token + '("');
								html.push(s2);
								html.push('");>"');
								html.push('< ')
								html.push('</a>');
							} else {
								html.push('<a href="#">\n'); html.push('◀ '); html.push('</a>'); } //paging Bar for(var index=pRCnt * pageSize + 1;index<(pRCnt + 1)*pageSize + 1;index++){ if(index == pageNo){ html.push('<strong>'); html.push(index); html.push('</strong>'); }else{ html.push('<a href=javascript:goPaging_' + token + '("'); html.push(index); html.push('");>'); html.push(index); html.push('</a>'); } if(index == pageCnt){ break; }else html.push(' | '); } //다음 화살표 if(pageCnt > (pRCnt + 1) * pageSize){ html.push('<a href=javascript:goPaging_' + token + '("'); html.push((pRCnt + 1)*pageSize+1); html.push('");>'); html.push(' ▶'); html.push('</a>'); }else{ html.push('<a href="#">'); html.push(' ▶'); html.push('</a>'); } return html.join("");

							}
						}
					</script> -->					
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
	<!-- 프로젝트 수정 모달 -->
<div class="modal fade" id="project_produce_Detail">
   <div class="modal-dialog">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="row detailpage">
         	<div class="left_area">
         		<div class="modal-header">
					<div class="item_detail">기존 프로젝트 이름</div>
					<input class="input_detail nk type" type="text" id="projectName" placeholder="${projectList.projectName }" readonly>            
				</div>
		         <div class="modal-header">
		         	<div class="item_detail">기존 시작 날짜 </div>
		         	<input class="input_detail nk type" type="text" placeholder="${projectList.projectStartDate } " readonly style="border : 0;"/>
		         </div>
         		<div class="modal-header">
		         	<div class="item_detail">기존 종료 날짜</div>
		         	<input class="input_detail nk type" type="text" placeholder="${projectList.projectEndDate } " readonly style="border : 0;"/>
		         </div>
		         <div class="modal-header">
		            <div class="item_detail">프로젝트 색상</div>
		        	<input class="input_detail nk type" style="background-color: ${projectList.projectColor};" id="projectColor" readonly style="border : 0;">  
		         </div> 
         	</div>
         	<div class="right_area">
				<div class="modal-header">
					<div class="item_detail">프로젝트 이름</div>
					<input class="input_detail nk type" type="text" id="projectName" placeholder="수정할 프로젝트 이름">            
				</div>
				<div class="modal-header">
					<div class="item_detail">수정 시작 날짜</div>
		            <input class="input_detail nk type" type="date" id="projectStartDate"  placeholder="${projectList.projectStartDate }">         
		         </div>
		         <div class="modal-header">
		            <div class="item_detail">수정 종료 날짜</div>
		         	<input class="input_detail nk type" type="date" id="projectEndDate">  
		         </div>
		         <div class="modal-header">
		            <div class="item_detail">수정할 프로젝트 색상</div>
		        	<input class="input_detail nk type" type="color" id="projectColor">  
		         </div> 
         	</div>
         </div>
         
                
         <!-- Modal body -->
         
         <div class="modal-body">
            <div class="row">
               <i class="fas fa-search"></i>
               <input class="input_detail1" type="text" id="email" placeholder="Add Member">
               <select class="select_detail nk" id="selectroll">
                  <option>Admin</option>
                  <option>Member</option>
                  <option>Client</option>
               </select>
               <input class="input_detail2 nk" type="button" id="addpersonButton" value="+">      
               <input class="input_detail2 nk" type="button" id="removepersonButton" value="-">      
            </div>

				<table class="select_member" id="projectMember" border="1" style="width:100%; height:30px; text-align: center">
					<thead>
					<tr>
						<th style="width:60px; align-content: center;" >인원 수</th>
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
					  <c:forEach items="${memberList}" var="member" >
					  <tr>
						<th>1</th>
						<th class="Email">${member.memberId}</th>
						<th class="roll">
						<c:choose>
							<c:when test="${ member.projectRole == 1}">Admin</c:when>
							<c:when test="${ member.projectRole == 2}">Member</c:when>
							<c:when test="${ member.projectRole == 3}">Client</c:when>
						</c:choose>
						
						</th>
						<th class="memberNo" style="display:none">${member.memberNo}</th>
						<tr>
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
		$("#removepersonButton").click(function(){
			$("#projectMember tr:last").remove();
		});
</script>
</html>