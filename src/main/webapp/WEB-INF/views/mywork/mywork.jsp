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
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/mywork.css">
	

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<!-- 폰트어썸 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
	
	<!-- 구글 차트 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	
	<title>Short Cut</title>

	<script type="text/javascript">
	var request = ${fn:length(requestScope.cardProgress1List) };
	var doing = ${fn:length(requestScope.cardProgress2List) };
	var done = ${fn:length(requestScope.cardProgress3List) };
	var wait = ${fn:length(requestScope.cardProgress4List) };
	console.log(request);
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['요청 중',     request],
          ['진행 중',      doing],
          ['완료',  done],
          ['보류', wait]
          
        ]);

        var options = {
          title: '내 업무 그래프',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="mywork_area">
		<div class="mywork_header_list">
			<div class="row">
				<a class="header_list on" href="${ pageContext.servletContext.contextPath }/mywork/mywork">My work</a>
				<a class="header_list" href="${ pageContext.servletContext.contextPath }/mywork/client">Client</a>
			</div>
		</div>
		<div class="chart_area">			
			<div class="chart">
				<div id="donutchart" style="width: 1000px; height: 600px;"></div>
			</div>			
		</div>
		<div class="container schedule_area">
			<div class="sch_title">
				Schedule
			</div>
			<div class="schedule_line"></div>
			<div class="schedule_item">
				<div class="row">
					<div class="item_title">
						미팅
					</div>
					<div class="item_type1">
						<div class="item_name">
							기간
						</div>
						<div class="item_content"></div>
					</div>
					<div class="item_type2">
						<div class="item_name">
							제목
						</div>
						<div class="item_content"></div>
					</div>
				</div>
				<div class="row">
					<div class="item_title">
						할일
					</div>
					<div class="item_type1">
						<div class="item_name">
							기간
						</div>
						<div class="item_content"></div>
					</div>
					<div class="item_type2">
						<div class="item_name">
							제목
						</div>
						<div class="item_content"></div>
					</div>
				</div>
			</div>

			<div class="sch_title">
				My work
			</div>
			<div class="schedule_line"></div>
			<div class="schedule_item">
				<div class="row">
					<div class="item_title">
						요청
					</div>
					<div class="item_type3">
						<div class="item_name">
							기간
						</div>
						<div class="item_content">
						<c:forEach var="req_cardList" items="${ requestScope.cardProgress1List }">
							<c:out value="${ req_cardList.tkStartDate }"/> <br>
						</c:forEach>
						</div>
					</div>
					<div class="item_type4">
						<div class="item_name">
							완료
						</div>
						<div class="item_content"></div>
					</div>
					<div class="item_type5">
						<div class="item_name">
							제목
						</div>
						<div class="item_content"></div>
					</div>
					<div class="item_type6">
						<div class="item_content">1 2 3</div>
					</div>
				</div>
				<div class="row doing">
					<div class="item_title">
						진행중
					</div>
					<div class="item_type3 ">
						<div class="item_name">
							기간
						</div>
						<div id="doingstart" class="item_content">
						<c:forEach var="req_cardList" items="${ requestScope.cardProgress2List }">
							<span><c:out value="${ req_cardList.tkStartDate }"/></span> <br>
						</c:forEach> 
						</div>
					</div>
					
					<div class="item_type4">
						<div class="item_name">
							완료
						</div>
						<div class="item_content">
						<c:forEach var="req_cardList" items="${ requestScope.cardProgress2List }">
							<span><c:out value="${ req_cardList.tkEndDate }"/></span> <br>
						</c:forEach> 
						</div>
					</div>
					<div class="item_type5">
						<div class="item_name">
							제목
						</div>
						<div class="item_content">
						<c:forEach var="req_cardList" items="${ requestScope.cardProgress2List }">
							<span><c:out value="${ req_cardList.crdName }"/></span> <br>
						</c:forEach> 						
						</div>
					</div>
					<div class="item_type6">
						<div class="item_pagenavi">
						
						
						<c:choose>
							<c:when test="${ empty requestScope.searchValue }">
								<button id="startPage"><<</button>
								<c:if test="${ requestScope.pageInfo.pageNo <= 1 }">
									<button disabled><</button>
								</c:if>
								<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
									<button id="prevPage"><</button>
								</c:if>
								
								<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
									<c:if test="${ requestScope.pageInfo.pageNo eq p }">
										<button disabled><c:out value="${ p }"/></button>
									</c:if>
									<c:if test="${ requestScope.pageInfo.pageNo ne p }">
										<button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
									</c:if>
								</c:forEach>
								
								<c:if test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
									<button disabled>></button>
								</c:if>
								<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
									<button id="nextPage">></button>
								</c:if>
								
								<button id="maxPage">>></button>
								
							</c:when>
							<c:otherwise>
								<button id="searchStartPage"><<</button>
								<c:if test="${ requestScope.pageInfo.pageNo <= 1 }">
									<button disabled><</button>
								</c:if>
								<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
									<button id="searchPrevPage"><</button>
								</c:if>
								
								<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
									<c:if test="${ requestScope.pageInfo.pageNo eq p }">
										<button disabled><c:out value="${ p }"/></button>
									</c:if>
									<c:if test="${ requestScope.pageInfo.pageNo ne p }">
										<button onclick="searchPageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
									</c:if>
								</c:forEach>
								
								<c:if test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
									<button disabled>></button>
								</c:if>
								<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
									<button id="searchNextPage">></button>
								</c:if>
								<button id="searchMaxPage">>></button>
							</c:otherwise>
						</c:choose>
						
						
						</div>
					</div>
				</div>
				
				<script type="text/javascript">
				//const link = "${ pageContext.servletContext.contextPath }/board/list";
				//const searchLink = "${ pageContext.servletContext.contextPath}/board/search";
				const token = $("meta[name='_csrf']").attr("content");
				const header = $("meta[name='_csrf_header']").attr("content");
				$(document).ajaxSend(function(e, xhr, options) {
				    xhr.setRequestHeader(header, token);
				});
				
				var doingPage = 1; 
				/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
				function gettoDate(data){
					var tag = document
					var date = new Date(data);
					var year = date.getFullYear();
					var month = ("0" + (1+ date.getMonth())).slice(-2);
					var day = ("0" + date.getDate()).slice(-2);
					console.log("asdfasdfasdf")
					return year+ "-" + month + "-" + day;
				}
				/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
				function pagenation($memNo,slect,page){
					
					
					console.log("test");
					slect.empty();
					$.ajax({
						url: "requestPaging",
						method: "post",
						data: {"currentPage": page,
							   "memNo": $memNo
						      },
						success: function(data, status, xhr) {
						
							 for(var i = 0; i < slect.length; i++){
								 for( var j=0; j < slect.length; j++){
									 if( i == 0){
										$(slect[i]).append(gettoDate(data[j].tkStartDate)+'<br>');
									 }
									 if( i == 1){
										 $(slect[i]).append(gettoDate(data[j].tkEndDate)+'<br>');
									 }
									 if( i == 2){
										 $(slect[i]).append((data[j].crdName)+'<br>');
									 }
							 	}								
							 }
							 
						},
						error: function(xhr, status, data){
							console.log(data);
						}
					})	
				}
				
				
				/*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
				if(document.getElementById("startPage")) {
					
					const $startPage = document.getElementById("startPage");
					const $memNo = ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.no};
					var slect = $(this).closest('.row').find("[class*='_content']");
					var page = 1;
					console.log("testtest");
					$startPage.onclick= pagenation;
					console.log("testtesttest")
				}
				
				/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
				if(document.getElementById("prevPage")) {
					const $prevPage = document.getElementById("prevPage");
					$prevPage.onclick = function() {
						//location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo - 1}";
					}
				}
				
				if(document.getElementById("nextPage")) {
					const $nextPage = document.getElementById("nextPage");
					$nextPage.onclick = function() {
						//location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo + 1}";
					}
				}
				
				if(document.getElementById("maxPage")) {
					const $maxPage = document.getElementById("maxPage");
					$maxPage.onclick = function() {
						//location.href = link + "?currentPage=${ requestScope.pageInfo.maxPage }";
					}
				}
				
				function pageButtonAction(text) {
					//location.href = link + "?currentPage=" + text;
				}
				
				function searchPageButtonAction(text) {
					//location.href = searchLink + "?currentPage=" + text + "&searchCondition=${ requestScope.searchCondition }&searchValue=${ requestScope.searchValue }";
				}
				
				</script>
				<div class="row">
					<div class="item_title">
						완료
					</div>
					<div class="item_type3">
						<div class="item_name">
							기간
						</div>
						<div class="item_content"></div>
					</div>
					<div class="item_type4">
						<div class="item_name">
							완료
						</div>
						<div class="item_content"></div>
					</div>
					<div class="item_type5">
						<div class="item_name">
							제목
						</div>
						<div class="item_content"></div>
					</div>
				</div>
				<div class="row">
					<div class="item_title">
						보류
					</div>
					<div class="item_type3">
						<div class="item_name">
							기간
						</div>
						<div class="item_content"></div>
					</div>
					<div class="item_type4">
						<div class="item_name">
							완료
						</div>
						<div class="item_content"></div>
					</div>
					<div class="item_type5">
						<div class="item_name">
							제목
						</div>
						<div class="item_content"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

	function pageMove(pg){
		$.ajax({
			type	: "POST",
			url	    : "",
			data	: {	
				'page'		: pg,
				'perPgLine' 	: perPgLine
			},
				dataType: 'JSON',
			success : function(result) {
				page = pg;
				//update board fromd data
				updatePaging("pageMove", page, allRowCnt, perPgLine, 3);
			},
			error : function(e) {
			console.log(e);
			}
		});
	}

</script>
	
</body>
</html>