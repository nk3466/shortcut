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
				<div id="timeline" style="height: 500px;  /* display: none; */"></div>
			</div>
			
			<div id="divResult">
			
			</div>
			
			<div id="cityData" data-toggle="modal" data-target="#myModal"></div>
			
			<input type="text" id="please1" value="Sprint1">
			<input type="text" id="please2" value="cccc">
			<input type="text" id="please3" value="1620054000000">
			<input type="text" id="please4" value="1622300400000">

		</div>
	</div>
	
	<input type="text" value="3" name="flag" id="flag">
	
	<div class="modal fade" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">Modal Heading</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          Modal body..
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	
	<script>
		const $project1 = document.getElementById("project1");
		const $timeline = document.getElementById("timeline");
		const $divResult = document.getElementById("divResult");
		
		$project1.addEventListener("click", getProject, true);
		
		function getProject() {
			/* $timeline.style.display = "block";  */ 
			
			location.href="${ pageContext.servletContext.contextPath}/mywork/client/projectInfo/2";
			
			/* 페이징처리느낌으로 가서 아작스 안써도...  */
			/* $.ajax({
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
			}); */
			
		}
	</script>
	
	<script type="text/javascript">
      google.charts.load('current', {'packages':['timeline']});
      google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
        var container = document.getElementById('timeline');
        var chart = new google.visualization.Timeline(container);
        var dataTable = new google.visualization.DataTable();
        
        const please3 = document.getElementById("please3").value;
        
		const year1 = "2021";
		
		const month1 = "5";
		const day1 = "4";
		
		const month2 = "5";
		const day2 = "30";
		
		const month3 = "6";
		const day3 = "4";
		
		const month4 = "7";
		const day4 = "30";
        
        dataTable.addColumn({ type: 'string', id: 'projectName' });
        dataTable.addColumn({ type: 'string', id: 'name' });
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });
        dataTable.addRows([
          [ $("#please1").val(), $("#please2").val(), new Date(year1, month1, day1),  new Date(year1, month2, day2) ] ,
          [ 'Sprint2',    "a",  new Date(year1, month1, day1),  new Date(year1, month3, day3) ],
          [ 'Sprint2',    "DSADAS",  new Date(year1, month1, day1),  new Date(year1, month3, day3) ],
          [ 'Sprint3',    "GRSGESW",  new Date(year1, month1, day1),  new Date(year1, month2, day2) ],
          [ 'Sprint4', "aEEEEE",  new Date(year1, month2, day2),  new Date(year1, month4, day4) ]]);

        var options = {
        	      timeline: { 
        	    	  colorByRowLabel: true/* ,
        	    	  groupByRowLabel: false */
        	    	  }
        	    };
        /* 첫 번째 텍스트 선택시 이벤트 */
        /* google.visualization.events.addListener(chart, 'ready', function() {
        	var rowLabels = container.getElementsByTagName('text');
        	Array.prototype.forEach.call(rowLabels, function(label) {
        		
         		if(label.getAttribute('text-anchor') === 'end') {
        			label.addEventListener("click", displayDetails, false);
        		}
         		if(label.getAttribute('text-anchor') === 'end') {
         	        label.setAttribute('fill', '#000000');
        		}  
        	});
        }); */
        
        /* 타임라인 선택시 이벤트 */
        google.visualization.events.addListener(chart, 'select', function() {
        	selection = chart.getSelection();
        	  if (selection.length > 0) {
        		  displayDetails();
        	    /* console.log(dataTable.getValue(selection[0].row, 0)); */
        	  }
        });
        
        function displayDetails(sender) {
        	
        	/* sender.preventDefault(); */
        	
            $("#myModal").modal();
        	
        	/* document.getElementById('cityData').innerHTML = 'city data for' + sender.target.innerHTML; */
        }
          
     	    chart.draw(dataTable, options);
        }
      </script>
      <script>
      
/*       function getData() {
			return new Promise(function(resolve, reject) {
				$.get('gitTest2', function(response) {
					if(response) {
						resolve(response);
					}
					reject(new Error("Request is failed"));
				});
			});
		}
      
      
      function clickEvent(dataTable) {
    	  
    	  return new Promise(function(resolve, reject) {
    		  
	 	      console.log(dataTable);
/* 		      const $df = dataTable.fg;
		      console.log($df);
		      
		      for(let index in $df) {
		    	    console.log($df[index]);
		    	    console.log($df[index].c[1].v);
		    	    
		    	    $df[index].c[1].v.onmouseover("click", function() { 
			      	alert(index);
			      });
		      }
		      resolve(response);
		      reject(new Error("Request is failed"));
    	  });
    	  
      } */
  </script>
</body>
</html>