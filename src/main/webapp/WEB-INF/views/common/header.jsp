<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
	<!-- 알람 -->
	<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.username" var="nick"/>
	<script>
		var wsUri = "ws://127.0.0.01:8001/shortcut/count";
		
		function send_message() {
			websocket = new WebSocket(wsUri);
			websocket.onopen = function(evt) {
				onOpen(evt);
			}
			
			websocket.onmessage = function(evt) {
				onMessage(evt);
			}
			
			websocket.onerror = function(evt) {
				onError(evt);
			}
		}
		
		function onOpen(evt) {
			websocket.send("${nick}");
		}
		
		function onMessage(evt) {
			$("#count").append(evt.data);
		}
		
		function onError(Evt) {
			
		}
		
		$(document).ready(function() {
			send_message();
			console.log("시작!");
		})
	</script>
	</security:authorize>
</head>
<body>
	<div class="top_area">
	<div class="row">
		<div class="top_logo_area">
			<a class="top_logo_detail" href="${ pageContext.servletContext.contextPath }/main">
				<img class="logo_detail" src="${ pageContext.servletContext.contextPath }/resources/img/logo1.png">
				<span class="logo_text">Short Cut</span>	
			</a>			
		</div>
		<div class="top_menu_area">			
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/mypage/mypage">
				<i class="fas fa-cog"></i>
			</a>
			<a class="menu_list">
				<i class="far fa-bell" id="allAlarmBtn"></i>
			</a>	
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/messenger/messenger">
				<i class="far fa-envelope"></i>	
			</a>
			<c:choose>
				<c:when test="${!empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
					<a class="menu_list" data-toggle="modal" data-target="#member_logout">로그아웃</a>
					<a class="menu_list">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username} 님이 로그인 되었습니다.</a>	
				</c:when>
				
				<c:otherwise>
					<a class="menu_list" data-toggle="modal" data-target="#member_regist">회원가입</a>
					<a class="menu_list" data-toggle="modal" data-target="#member_login">로그인</a>
				</c:otherwise>
			</c:choose>
			<input type="text" id="ABC" style="display: none;" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}">
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/board/project_board/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}">프로젝트</a>
			<a class="menu_list" href="${ pageContext.servletContext.contextPath }/mywork/mywork">내업무</a>
			<a class="menu_list" href="#">한국어</a>
			<a class="menu_list">${requestScope.loginFailMsg}</a>
			
		</div>
	</div>
</div>

<c:choose>
	<c:when test="${!empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
		<div>
			
			<!-- <button id="allAlarmBtn">AlARM</button> -->
			<div class="alarmArea on">
				<div class="btn-group btn-group-justified">
					<span><button class="btn btn-default" id="generalAlarmBtn" type="button">Alarm</button></span>
					<span><button class="btn btn-default" id="githubAlarmBtn" type="button">Github Commit</button></span>
				</div>
				<hr>
				<div class="generalAlarmArea">
					<br>
					<h4>Alarm</h4>
					<span id="count" class=""></span>
				</div>
				<div class="githubAlarmArea">
					<c:if test="${ empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.gitUrl }">
					<form action="${ pageContext.servletContext.contextPath }/alarm/github/regist" method="POST">										
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
						<input name="memNo" type="text" id="memNo" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}" style="display: none;">
						<input name="githubInfo" style="width: 100%;" type="text" id="githubInfo" placeholder="깃허브 주소">
						<br><br>
						<input class="btn btn-default" style="width: 100%;" type="submit" value="등록">
					</form>
					</c:if> 
					<c:if test="${ !empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.gitUrl }">
						<div id="githubUrlArea" class="ghu1 main"></div>
						<div id="githubUrlArea" class="ghu2 main"></div>
						<div class="ghu3"></div>
						<br>
						<button class="btn btn-default" id="modifyGitUrl" type="button" onclick="modifyGitUrlBtn();" style="width: 100%">수정</button>
					</c:if>
					<br>
					<br>
					<table>
						<thead>
							<tr>
								<th><h4 align="center" style="font-weight: bold;">Github Issues</h4></th>
							</tr>
							<tr style="height: 10px;"></tr>
						</thead>
						<tbody id=githubArea>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
			<script>
				function modifyGitUrlBtn() {
					
					const token = $("meta[name='_csrf']").attr("content");
					const header = $("meta[name='_csrf_header']").attr("content");
					
					$(".ghu3").empty();
					
					$("#modifyGitUrl").remove();
					
					$(".ghu3").append('<br>');
					$(".ghu3").append('<form id="gitForm" method="POST">');
					$("#gitForm").append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>');
					$("#gitForm").append('<input name="memNo" type="text" id="memNo" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no}" style="display: none;">');
					$("#gitForm").append('<input type="text" class="im" name="modifyUrl" value="${ sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.gitUrl }" style="margin: 3px; width: 100%; font-size: 15px;">');
					$("#gitForm").append('<button id="rModifyGitUrl" class="btn btn-default" type="button" style="margin: 3px; width: 100%; background-color: white;">등록</button>');
					$("#gitForm").append('<button id="dModifyGitUrl" class="btn btn-default" type="button" style="margin: 3px; width: 100%; background-color: white;">삭제</button>');
					$("#gitForm").append('<br>');
					$("#gitForm").append('<br>');
					$("#gitForm").append('<button class="btn btn-default" type="button" style="margin: 3px; width: 100%; background-color: white;" onclick="cancelGitBtn();">취소</button>');
					$("#gitForm").append('<hr>');
					$("#gitForm").append('</form>');
				}
				
				function cancelGitBtn() {
	
					$(".ghu3").empty();
					
					$(".ghu3").append('<br>');
					$(".ghu3").append('<button class="btn btn-default" id="modifyGitUrl" type="button" onclick="modifyGitUrlBtn();" style="width: 100%">수정</button>');
					
				}
			</script>
			<script>
				$(function() {
					
		            const flashMessage = '${ requestScope.flashMessage }';
		            if(flashMessage != null && flashMessage !== '') {
		            	
		                alert(flashMessage);
		                
		            	$.ajax({
		            		url : "${pageContext.servletContext.contextPath}/session/expire",
		            		method : "GET",
		            		success : function(data, status, xhr) {
		            			console.log(data);
		            		},
		            		error : function(xhr, status, error) {
		            			console.log(error);
		            		}
		            	});
		            	
		            	location.reload();
		            }
					
					$(document).on("click","#rModifyGitUrl", function() {
						const $gitForm = document.getElementById("gitForm");
						$gitForm.action = "${pageContext.servletContext.contextPath}/alarm/github/modify";
						$gitForm.submit(); 
					});
					
					$(document).on("click", "#dModifyGitUrl", function() {
						const $gitForm = document.getElementById("gitForm");
						$gitForm.action = "${pageContext.servletContext.contextPath}/alarm/github/remove";
						$gitForm.submit(); 
					});
					
					
					/* const githubArea = document.getElementById("githubArea");
					
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
						
					}); */
					
					$("#allAlarmBtn").click(function(){
						
						$(".alarmArea").toggleClass("on");
						$(".githubAlarmArea").hide();
						$(".generalAlarmArea").show();
					})
					
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
						
						var ghu1 = $(".ghu1");
						var ghu2 = $(".ghu2");
						var ghuInfo1 = "Id : " + gitId;
						var ghuInfo2 = "Project : " + gitIdProject;
						
						ghu1.text("");
						ghu2.text("");
						
						ghu1.text(ghuInfo1);
						ghu2.text(ghuInfo2);
						
						let today = new Date();
						
						let year = today.getFullYear();
						let month = "" + (today.getMonth() + 1);
						let beforMonth = "" + (today.getMonth() + 1 - 3);
						let date = "" + today.getDate();
						let day = today.getDay();
						
						if(month.length == 1) {
							month = "0" + month;
						}
						if(beforMonth.length == 1) {
							beforMonth = "0" + beforMonth;
						}
						if(date.length == 1) {
							date = "0" + date;
						}
						
						//var url = "https://api.github.com/search/issues?q=author:" + gitId + " repo:" + gitId + "/" + gitIdProject;
						var url = "https://api.github.com/search/commits?q=repo:" + gitId + "/" + gitIdProject + " author-date:" + year + "-" + beforMonth + "-" + date +
								".." + year + "-" + month + "-" + date;
						//var url = "https://api.github.com/search/commits?q=repo:" + "freecodecamp" + "/" + "freecodecamp" + " author-date:" + year + "-" + beforMonth + "-" + date +
						//		".." + year + "-" + month + "-" + date;
						//var url = "https://api.github.com/search/commits?q=repo:freecodecamp/freecodecamp author-date:2021-02-01..2021-03-31";
						//var url="https://api.github.com/search/commits?q=repo:Gingmin/semi-project author-date:2021-02-01..2021-03-31";
						console.log(url);
						getCommits(url);
					});
					
					async function getCommits(url) {
						clear();
						const headers = {
								"Accept": "application/vnd.github.cloak-preview"
								
						} 
						const response = await fetch(url, {
							"method" : "GET",
							"headers" : headers
						});
						
						const link = response.headers.get("link");
						const links = link.split(",");
						const urls = links.map(a=> {
							return {
								url: a.split(";")[0].replace(">", "").replace("<", ""),
								title: a.split(";")[1]
							}
						});
						const result = await response.json();
						
						let count = 0;
						
						result.items.forEach(i=>{
							count++;
							/* console.log(i); */
							const img = document.createElement("img");
							if(null != i.author && null != i.author.avatar_url) {
								img.src = i.author.avatar_url;
							} else {
								img.setAttribute("src", "${pageContext.servletContext.contextPath}/resources/img/randompeople.png")
							}
							img.style.width = "32px";
							img.style.height = "32px";
							const anchor = document.createElement("a");
							if(null != i.author && null != i.html_url) {
								anchor.href = i.html_url;
							}
							anchor.textContent = i.commit.message.substr(0, 70) + "...";
							githubArea.appendChild(img); 
							githubArea.appendChild(anchor);
							githubArea.appendChild(document.createElement("br"));
							githubArea.appendChild(document.createElement("hr"));
						});
						
						console.log("count : " + count);
						
						urls.forEach(u => {
							
							const btn = document.createElement("button");
							btn.setAttribute('class', "gitPagingBtn");
							let buttonStr = u.title.substring(6);
							btn.textContent = buttonStr.substring(0, buttonStr.lastIndexOf("\""));
							btn.addEventListener("click", e=> getCommits(u.url));
							githubArea.appendChild(btn);
							
						});
					}
					
					function clear() {
						while(githubArea.firstChild)
							githubArea.removeChild(githubArea.firstChild);
					}
				});
			</script>
					   <%-- async function getIssues() {
						
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
						const headers = {
								"Accept": "application/vnd.github.cloak-preview"
								
						} 
						const url = "https://api.github.com/search/issues?q=author:" + gitId + " repo:" + gitId + "/" + gitIdProject;
						const response = await fetch(url);
						
						const link = response.headers.get("link");
						const links = link.split(",");
						const urls = links.map(a=> {
							return {
								url: a.split(";")[0].replace(">", "").replace("<", ""),
								title: a.split(";")[1]
							}
						});
						
						const result = await response.json();
						
						result.items.forEach(i=>{
							const img = document.createElement("img");
							img.src = i.author.avatar_url;
							img.style.width = "32px";
							img.style.height = "32px";
							const anchor = document.createElement("a");
							anchor.href = i.html_url;
							anchor.textContent = i.title.substr(0, 120) + "...";
							githubArea.appendChild(anchor);
							githubArea.appendChild(document.createElement("br"));
						});
						
						urls.forEach(u => {
							
							const btn = document.createElement("button");
							btn.textContent = u.title;
							btn.addEventListener("click", e=> getIssues(u.url));
							githubArea.appendChild(btn);
							
						});
					}  --%>
					
	</c:when>
	
</c:choose>

</body>
</html>