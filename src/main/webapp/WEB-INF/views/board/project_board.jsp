<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
   <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/project_board.css">
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
   <div class="project_content">
      <div class="row">
         <div class="project_text_area">
            <div class="project_text1">
               Description
            </div>
            <div class="project_line"></div>
            <div class="project_text2">
               Wankku is a front-end, Minsero is a back-end... Yakgan e run neukkim jeok in neukkim  Right?? Understand?  You know what I’m saying???  I want to sensitive mood desing for our homepage, so we need  to help us by ourselves.
               <br>
               Conclusively, I hope our prototype will be completed tomorrow.
               <br>
               See you later~   
               <br>
               <br>
               mr.choo!~~ ipsul wi e choo
            </div>               
         </div>   
         <div class="project_board_area">
            <div class="project_text1">
               Project   
            </div>
            <div class="project_line2"></div>

            <div class="row">
               <div class="board_list">
                  <a class="board_detail" href="#" data-toggle="modal" data-target="#project_produce">
                     <i class="fas fa-plus"></i>
                  </a>
                  <div class="board_text">
                     new Project   
                  </div>               
               </div>
               <div class="board_list">
                  <a class="board_detail type" href="${pageContext.servletContext.contextPath }/board/backlog">
                     <img src="${pageContext.servletContext.contextPath}/resources/img/board_icon.png" style="height:70px; width:70px;">
                  </a>
                  <div class="board_text"  data-toggle="modal" data-target="#project_modify">
                     The joeun   
                  </div>               
               </div>
               
            </div>
         </div>         
      </div>

   </div>   



<div class="modal fade" id="project_produce">
   <div class="modal-dialog">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <input class="input_detail" type="text" id="projectName" placeholder="Add Project Title">            
         </div>
         
		<div class="modal-header">
			<div>시작 날짜</div>
            <input class="input_detail nk" type="date" id="projectStartDate">         
         </div>
         
         <div class="modal-header">
            <p>종료 날짜</p>
         <input class="input_detail  nk" type="date" id="projectEndDate">  
         </div>
         
         <div class="modal-header">
            <p>프로젝트 색상</p>
         <input class="input_detail  nk1" type="color" id="projectColor">  
         </div>        
         <!-- Modal body -->
         
         <div class="modal-body">
            <div class="row">
               <i class="fas fa-search"></i>
               <input class="input_detail1" type="text" id="email" placeholder="Add Member">
               <select class="select_detail nk" id="selectroll">
                  <option>프로젝트 관리자</option>
                  <option>팀원</option>
                  <option>클라이언트</option>
               </select>
               <input class="input_detail2 nk" type="button" id="addpersonButton" value="+">      
               <input class="input_detail2 nk" type="button" id="removepersonButton" value="-">      
            </div>

				<table class="select_member" id="projectMember" border="1" style="width:100%; height:30px;">
					<thead>
					<tr>
						<th style="width:60px;">인원 수</th>
						<th>이메일</th>
						<th style="width:100px;">권한</th>
					</tr>
					</thead>
					<tbody  id="dynamicTbody">
					</tbody>
				</table>
         </div>
            
         
         <div class="modal_btn_area">
            <button class="btn_detail" id="createProject">Create Project</button>
         </div>            
      </div>
   </div>
</div>

<script>
		/* 시큐리티 권한  */
		const token = $("meta[name='_csrf']").attr("content");
		const header = $("meta[name='_csrf_header']").attr("content");
		
		$(document).ajaxSend(function(e, xhr, options) {
		    xhr.setRequestHeader(header, token);
		});

		/* 멤버 수 count */
		var idcount = 0;
		
		$("#addpersonButton").click(function(){
			if(!vali($("#email").val())){
				
			var addMember = $("#projectMember tr:last");
			var insertTr="";
			 insertTr += '<tr id="addpersionList_' + (idcount++) +'">';
			 insertTr += '<td class="num">'+  (idcount) + '</td>';
			 insertTr += '<td class="Email">'+	document.getElementById("email").value + '</td>';
			 insertTr += '<td class="roll">'+	document.getElementById("selectroll").value + '</td>';
			 insertTr += '</tr>';
			 
			 $("#dynamicTbody").append(insertTr);
			 $("#email").val('');
		}else{
			alert("이메일을 입력해주세요");
		}
			});
			
		$("#removepersonButton").click(function(){
			$("#projectMember tr:last").remove();
			idcount--;
		});
		
		/* 이메일 null 체크 */
		function vali(value){
		    if (value === null) return true; 
		    if (typeof value === 'string' && value === '') return true;
		    if (typeof value === 'undefined') return true;
		    return false;
		}
		
		/* 프로젝트 생성 버튼 클릭 */
		$("#createProject").click(function(){ 
			function makeTag(name, value){
				var hiddenTag = document.createElement('input');
				hiddenTag.setAttribute("type", "hidden")
				hiddenTag.setAttribute("name", name)
				hiddenTag.setAttribute("value", value)
		
				return hiddenTag
			}
			
			const projectMemberList = document.getElementById('dynamicTbody').innerHTML;
			
			var $form = $('<form></form>');
		   //var projectMaker = ${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}
		   var projectName = document.getElementById("projectName").value;
		   var projectStartDate = document.getElementById("projectStartDate").value;
		   var projectEndDate = document.getElementById("projectEndDate").value;
		   var projectColor = document.getElementById("projectColor").value;
		   console.log("projectName : " + projectName);
		   console.log("projectStartDate : " + projectStartDate);
		   console.log("projectEndDate : " + projectEndDate);
		   console.log("projectColor : " + projectColor);
		   
		   var nk = $('form[name=projectMemberList]').serializeArray();
		   
		  /*  nk.push({name : "projectName", value : projectName},
				   {name : "projectStartDate", value : projectStartDate},
				   {name : "projectEndDate", value : projectEndDate},
				   {name : "projectColor", value : projectColor} 
		   );*/
		   	
		   for(let i = 0; i < idcount; i++){
			   Email = $("#projectMember").find(".Email").eq(i).text();
			   console.log("Email : " + Email);
			   roll = $("#projectMember").find(".roll").eq(i).text();
			   console.log("roll : " + roll);
			   
			   nk.push({ name : "Email",	value : Email}, 
						{ name : "roll",value : roll});
				
			   $form.append(makeTag(Email, Email));
			   $form.append(makeTag(roll, roll));
		   }
		   
		   console.table(nk);
		   console.log(typeof nk);
		   
	
		   $.ajax({
			   url :"${pageContext.servletContext.contextPath}/board/project_regist",
			   type : "post",
			   data : { 
				   projectName : projectName,
				   projectStartDate : projectStartDate,
				   projectEndDate : projectEndDate,
				   projectColor : projectColor,
				   nk : nk },
			   success : function(data, textStatus, xhr) {
				   
			   },
				error : function(xhr, status, error) {
					console.log(error);
				//	location.href = "${pageContext.servletContext.contextPath}/main";
				}
		   });
		})
</script>


<div class="modal fade" id="project_modify">
   <div class="modal-dialog">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <input class="input_detail" type="text" name="name" placeholder="Add Project Title">            
         </div>
         

         <!-- Modal body -->
         
         <div class="modal-body">
            <div class="row">
               <i class="fas fa-search"></i>
               <input class="input_detail1 type" type="text" name="name" placeholder="">
               
               <input class="input_detail2" type="button" name="name" value="Add">      
            </div>

            <div class="select_member"></div>                                                            
         </div>

            
            
         
         <div class="modal_btn_area">
            <button class="btn_detail type">Revise Project</button>
            <button class="btn_detail type">Delete Project</button>
         </div>            
      </div>
   </div>
</div>
</body>
</html>