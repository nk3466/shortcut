<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<a class="menu_list" href="#">
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
						
						result.items.forEach(i=>{
							const img = document.createElement("img");
							img.src = i.author.avatar_url;
							img.style.width = "32px";
							img.style.height = "32px";
							const anchor = document.createElement("a");
							anchor.href = i.html_url;
							anchor.textContent = i.commit.message.substr(0, 120) + "...";
							githubArea.appendChild(img); 
							githubArea.appendChild(anchor);
							githubArea.appendChild(document.createElement("br"));
						});
						
						urls.forEach(u => {
							
							const btn = document.createElement("button");
							btn.textContent = u.title;
							btn.addEventListener("click", e=> getCommits(u.url));
							githubArea.appendChild(btn);
							
						});
					}
					
					/* async function getIssues() {
						
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
					} */
					
					function clear() {
						while(githubArea.firstChild)
							githubArea.removeChild(githubArea.firstChild);
					}
				});
			</script>
	</c:when>
	
</c:choose>

</body>
</html>