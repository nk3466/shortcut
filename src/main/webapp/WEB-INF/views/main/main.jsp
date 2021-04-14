<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- 파비콘 -->
<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/img/logo1.png" type="image/x-icon">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
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
	<div class="main_content">
		<div class="row">
			<div class="main_text_area">
				<div class="main_text1">
					Work on big ideas, 
				</div>
				<div class="main_text1">
					without the busywork
				</div>
				
				<c:choose>
					<c:when test="${!empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
						<div>
							<br>
							<h1>알람</h1>
							<br>
							<button id="allAlarmBtn">AlARM</button>
							<div class="alarmArea">
								<button id="generalAlarmBtn" type="button">알람</button>
								<button id="githubAlarmBtn" type="button">깃허브</button>
								<div class="generalAlarmArea">
									alarm
								</div>
								<div class="githubAlarmArea">
									<c:if test="${ empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.gitUrl }">
									<form action="${ pageContext.servletContext.contextPath }/alarm/github/regist" method="POST">										
										<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
										<input name="memNo" type="text" id="memNo" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}" style="display: none;">
										<input name="githubInfo" type="text" id="githubInfo" placeholder="깃허브 주소">
										<input type="submit" value="등록">
									</form>
									</c:if> 
									<c:if test="${ !empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.gitUrl }">
										<p id="githubUrlArea">"${ sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.gitUrl }"</p>
									</c:if>
									<table>
										<thead>
											<tr>
												<th>Github Issues</th>
											</tr>
										</thead>
										<tbody id=githubArea>
											
										</tbody>
									</table>
									<div id="pagingArea"></div>
								</div>
							</div>
						</div>
							<script>
								$(function() {
									
									const githubArea = document.getElementById("githubArea");
									
									$(".generalAlarmArea").hide();
									$(".githubAlarmArea").hide();
									$("#generalAlarmBtn").hide();
									$("#githubAlarmBtn").hide();
									let flag = false;
									
									$("#allAlarmBtn").click(function() {
										
										if(!flag) {
											flag = true;
											$(".generalAlarmArea").show();
											$(".githubAlarmArea").hide();
											$("#generalAlarmBtn").show();
											$("#githubAlarmBtn").show();
										} else if(flag) {
											flag = false;
											$(".generalAlarmArea").hide();
											$(".githubAlarmArea").hide();
											$("#generalAlarmBtn").hide();
											$("#githubAlarmBtn").hide();
										}
										
									});
									
									$("#generalAlarmBtn").click(function() {
										$(".generalAlarmArea").show();
										$(".githubAlarmArea").hide();
									});
									
									$("#githubAlarmBtn").click(function() {
										$(".githubAlarmArea").show();
										$(".generalAlarmArea").hide();
										
										var memNo = ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no};
										console.log(memNo);
										var $githubArea = document.getElementById("githubArea");
										let $githubUrlArea = document.getElementById("githubUrlArea");
										
										getIssues();
									});
									
									async function getIssues() {
										
										var gitInfo = "${ sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.gitUrl }";
										var gitInfoArray = gitInfo.split("https://github.com/");
										var gitDetailInfo = gitInfoArray[1].split("/");
										console.table(gitInfoArray);
										console.log(gitInfoArray[1]);
										console.table(gitDetailInfo);
										console.log(gitDetailInfo[0]);
										console.log(gitDetailInfo[1]);
										var gitId = gitDetailInfo[0];
										var gitIdProject = gitDetailInfo[1];
										
										clear();
										const url = "https://api.github.com/search/issues?q=author:" + gitId + " repo:" + gitId + "/" + gitIdProject;
										const response = await fetch(url);
										const result = await response.json();
										
										result.items.forEach(i=>{
											
											const anchor = document.createElement("a");
											anchor.href = i.html_url;
											anchor.textContent = i.title;
											githubArea.appendChild(anchor);
											githubArea.appendChild(document.createElement("br"));
										});
									}
									
									function clear() {
										while(githubArea.firstChild)
											githubArea.removeChild(githubArea.firstChild);
									}
								});
							</script>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<div class="main_line"></div>
				<div class="main_text2">
					From the small stuff to the big picture, ShortCut organizes work so teams know what to do, why it matters, and how to get it done.
				</div>
			</div>
			<div class="main_img_area">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="img_detail" src="./resources/img/mainimg1.png">
						</div>
						<div class="carousel-item">
							<img class="img_detail" src="./resources/img/mainimg2.png">
						</div>
						<div class="carousel-item">
							<img class="img_detail" src="./resources/img/mainimg3.png">
						</div>
					</div>
				</div>		
			</div>				
		</div>
	</div>
	<script>
		const message = '${ requestScope.message }';
		if(message != null && message !== '') {
			alert(message);
		}
	</script>
	
	<!-- 모달  -->
	
	<jsp:include page="../modal/modal_login.jsp"></jsp:include>
	<jsp:include page="../modal/modal_logout.jsp"></jsp:include>
	<jsp:include page="../modal/modal_password_find.jsp"></jsp:include>
	<jsp:include page="../modal/modal_password_reconfirm.jsp"></jsp:include>
	<jsp:include page="../modal/modal_password_reset.jsp"></jsp:include>
	<jsp:include page="../modal/modal_password_resetcomplete.jsp"></jsp:include>
	<jsp:include page="../modal/modal_regist.jsp"></jsp:include>
</body>
</html>