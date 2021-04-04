<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/mywork.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/client.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<!-- 폰트어썸 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
	
	<!-- 구글 차트 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<title>Short Cut</title>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="mywork_area">
		<div class="mywork_header_list">
			<div class="row">
				<a class="header_list" href="${ pageContext.servletContext.contextPath }/mywork/mywork">My work</a>
				<a class="header_list on" href="${ pageContext.servletContext.contextPath }/mywork/client">Client</a>
			</div>
		</div>
		<div class="myproject_area">
			<div class="myproject">
				My Project
			</div>
			<div class="client_line"></div>
			<div class="select_project">
				<div class="row">
					<c:forEach var="i" items="${ requestScope.testList }">
						<div class="project_list">
							<a class="list_detail" id="project1">
								<img class="img_detail" src="${ pageContext.servletContext.contextPath }/resources/img/board_icon.png">
							</a>
							<div class="board_text" >
								<c:out value="${ i }"/>	
							</div>					
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="timeline_area">
				<div id="timeline" style="height: 500px; /* display: none; */"></div>
			</div>

			<div id="divResult">
			
			</div>
			
			<input type="text" id="please1" value="tttt">
			<input type="text" id="please2" value="cccc">
			<input type="text" id="please3" value="1620054000000">
			<input type="text" id="please4" value="1622300400000">

		</div>
	</div>
	
	<script>
		const $project1 = document.getElementById("project1");
		const $timeline = document.getElementById("timeline");
		const $divResult = document.getElementById("divResult");
		
		$project1.addEventListener("click", getProject, true);
		
		function getProject() {
			/* $timeline.style.display = "inline"; */
			
			$.ajax({
				url: "projectInfo",
				method: "GET",
				success: function(data, status, xhr) {

					$divResult.html = "";
					
					for(let index in data) {
							
						const anchor1 = document.createElement("P");
						anchor1.innerHTML = data[index].projectName;
						const anchor2 = document.createElement("P");
						anchor2.innerHTML = data[index].content;
						const anchor3 = document.createElement("p");
						anchor3.innerHTML = data[index].startDate;
						const anchor4 = document.createElement("p");
						anchor4.innerHTML = data[index].endDate;
						
						$divResult.appendChild(anchor1);
						$divResult.appendChild(anchor2);
						$divResult.appendChild(anchor3);
						$divResult.appendChild(anchor4);
					}
				},
				error: function(xhr, status, error) {
					console.log(error);
				}
			});
			
		}
	</script>
	
	<script type="text/javascript">
      google.charts.load('current', {'packages':['timeline']});
      google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
        var container = document.getElementById('timeline');
        var chart = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();

        dataTable.addColumn({ type: 'string', id: 'President' });
        dataTable.addColumn({ type: 'string', id: 'name' });
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
        dataTable.addRows([
          [ $("#please1").val(), $("#please2").val(), new Date(1620054000000),  new Date(1622300400000) ]]);/* , */
/*           [ 'Adams',    "a",  new Date(1797, 2, 4),  new Date(1801, 2, 4) ],
          [ 'Adams',    "a",  new Date(1797, 2, 4),  new Date(1801, 2, 4) ],
          [ 'Adams',    "a",  new Date(1797, 2, 4),  new Date(1801, 2, 4) ],
          [ 'Jefferson', "a",  new Date(1801, 2, 4),  new Date(1809, 2, 4) ]]); */

        var options = {
        	      timeline: { colorByRowLabel: true },
        	      backgroundColor: '#ffd'
        	    };
        
        chart.draw(dataTable);
      }
    </script>
</body>
</html>