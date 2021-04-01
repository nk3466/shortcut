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

	<script type="text/javascript">
      google.charts.load('current', {'packages':['timeline']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var container = document.getElementById('timeline');
        var chart = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();

        dataTable.addColumn({ type: 'string', id: 'President' });
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
        dataTable.addRows([
          [ 'Washington', new Date(1789, 3, 30), new Date(1797, 2, 4) ],
          [ 'Adams',      new Date(1797, 2, 4),  new Date(1801, 2, 4) ],
          [ 'Adams',      new Date(1797, 2, 4),  new Date(1801, 2, 4) ],
          [ 'Adams',      new Date(1797, 2, 4),  new Date(1801, 2, 4) ],
          [ 'Jefferson',  new Date(1801, 2, 4),  new Date(1809, 2, 4) ]]);

        chart.draw(dataTable);
      }
    </script>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="mywork_area">
		<div class="mywork_header_list">
			<div class="row">
				<a class="header_list" href="http://kordzor.cafe24.com/final/mywork.html">My work</a>
				<a class="header_list on" href="http://kordzor.cafe24.com/final/client.html">Client</a>
			</div>
		</div>
		<div class="myproject_area">
			<div class="myproject">
				My Project
			</div>
			<div class="client_line"></div>
			<div class="select_project">
				<div class="row">
					<div class="project_list">
						<a class="list_detail">
							<img class="img_detail" src="./img/board_icon.png">
						</a>
						<div class="board_text" >
							The joeun	
						</div>					
					</div>
					<div class="project_list">
						<a class="list_detail">
							<img class="img_detail" src="./img/board_icon.png">
						</a>
						<div class="board_text" >
							The joeun	
						</div>					
					</div>
					<div class="project_list">
						<a class="list_detail">
							<img class="img_detail" src="./img/board_icon.png">
						</a>
						<div class="board_text" >
							The joeun	
						</div>					
					</div>
					<div class="project_list">
						<a class="list_detail">
							<img class="img_detail" src="./img/board_icon.png">
						</a>
						<div class="board_text" >
							The joeun	
						</div>					
					</div>
					<div class="project_list">
						<a class="list_detail">
							<img class="img_detail" src="./img/board_icon.png">
						</a>
						<div class="board_text" >
							The joeun	
						</div>					
					</div>
					<div class="project_list">
						<a class="list_detail">
							<img class="img_detail" src="./img/board_icon.png">
						</a>
						<div class="board_text" >
							The joeun	
						</div>					
					</div>
				</div>
			</div>

			<div class="timeline_area">
				<div id="timeline" style="height: 500px;"></div>
			</div>
			
		</div>
	</div>
</body>
</html>