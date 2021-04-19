<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<!-- 파비콘 -->
<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/img/logo1.png" type="image/x-icon">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
   <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/meetinglog.css">

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

   

   <!-- 폰트어썸 -->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
   
   
    


   <title>Short Cut</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/data.js"></script>
</head>
<body>
   <jsp:include page="../common/header.jsp"></jsp:include>
   <header>
      <h1>
         <i class="far fa-calendar-check"></i> 
         <span>캘린더</span>
      </h1>
      <div class="calendar_title">
         <button class="prev">&#60;</button>
         <span class="current-year-month"></span>
         <button class="next">&#62;</button>
      </div>
   </header>
   <section class="content-left">
      <div class="left-main">
      	<div class="issue_collect">
      		<div class="issue_text">이슈 모아보기</div>
      		<div class="row">
      			<div class="issue_btn on">진행중</div>
      			<div class="issue_btn">완료</div>
      			
      		</div> 
      	</div>
         <div class="main-wrap">
            <div class="main-day"></div>
            <div class="main-date"></div>
         </div>
         <div class="todo-wrap">
            <div class="todo-title">Todo List</div>
            <button class="conference_update" >올리기</button>
            <form class="input-form">
               <input type="text" placeholder="write here!!" class="input-box" />
               <!-- <button type="submit" class="input-btn clickBtn">INPUT</button> -->
            </form>
            <ul class="todoList"></ul>
            <div class="showList">
               <span class="listText"></span> <span class="createDate"></span>
               <button class="closed">close</button>
            </div>
            <div class="bgblack"></div>
         </div>
      </div>
   </section>
   <section class="content-right">
      <div class="day-of-week">
         <div class="dayHeader sun">Sun</div>
         <div class="dayHeader">Mon</div>
         <div class="dayHeader">Tue</div>
         <div class="dayHeader">Wed</div>
         <div class="dayHeader">Thu</div>
         <div class="dayHeader">Fri</div>
         <div class="dayHeader sat">Sat</div>
      </div>
      <div class="calendar-body"></div>
   </section>

   <div class="modal fade" id="conference">
      <div class="modal-dialog">         
         <div class="modal-content">
            <form action="${pageContext.servletContext.contextPath}/meeting/meetinglog" method="post">
               <div class="modal-body">
                     <input type="text" value="${pjtNo}" id="pjtNo" name="pjtNo" style="display: none;">
                     <div class="conference_item">
                        <div class="row">
                           <div class="item_type type">
                      		        회의날짜
                           </div>
                           <div class="item_type">
                              <input class="input_detail" type="date" id="meetingDate" name="enrollDate" />
                           </div>
                           
                        </div>
                        <div class="modal_line"></div>
                        <div class="row">
                           <div class="item_type type">
                          	    프로젝트
                           </div>                     
                           <div class="item_text">
                              <c:out value="${requestScope.projectName}"/>   
                           </div>                     
                           <div class="item_type type1">
                  		            스프린트
                           </div>                     
                           <div class="item_text">
								<select id="sprintNumberArea"></select>
                           </div>                     
                        </div>
                        <div class="modal_line"></div>
                     
                        <div class="row">
                           <div class="item_type type">
                      		        참석자
                           </div>
                           <div class="item_type type3" id="meetingMember">
                              
                           </div>
                           
                        </div>
                        <div class="modal_line"></div>
                        <div class="row">
                           <div class="item_type type">
								 회의제목
                           </div>
                           <div class="item_type">
                              <input class="input_detail" type="text" id="titleName" name="meetingName">
                           </div>
                           
                        </div>
                        <div class="row">
                           <div class="item_type type">
                          	    회의내용
                           </div>
                           <div class="item_type type3">
                              <textarea id="meetingContent" class="textarea_detail" name="meetingText"></textarea>
                           </div>
                           
                        </div>
      
                     </div>
                  
               </div>
   
               <!-- Modal footer -->
               <div class="modal_footer">                        
                  <div class="btn_area">
                     <input name="${_csrf.parameterName}" type="hidden"  value="${_csrf.token}">
                     <input type="button" id="upload" class="upload_btn meetingBtn" value="완료">   
                  </div>                                          
               </div>
            </form>
         </div>
      </div>

   </div>
   
   <jsp:include page="../meeting/meeting_detail.jsp"></jsp:include>
   <jsp:include page="../meeting/meeting_modify.jsp"></jsp:include>
   <jsp:include page="../meeting/meeting_delete_modal.jsp"></jsp:include>
   
   
   
</body>


<script type="text/javascript">

   $(function(){
      $(".conference_update").click(function(e){
         e.preventDefault();
         
         $("#conference").modal();
         
      })
      
      $(".upload_btn.type1").click(function(){
    	  
    	  $("#conference_detail").modal("hide");
    	  $("#deleteCheck").modal("show");
      })
      
      var iddd = "";
      
      
      $(this).on("click",".mtinfo", function(e){
		e.preventDefault(); 			   	  
	      $("#conference_detail").modal();
	      iddd = $(this).attr('id');
	      console.log('id : '+ $(this).attr('id'));
	      selectMeetingDetail($(this).attr('id'));
    	  
	      
      })
      
      // 삭제 
      $(this).on("click","#deletedBtn", function(e){
    	  new deleMeeting(iddd);
      })
      
      
      /* 모달 상세페이지 수정 버튼 클릭시  */
      $("#updateBtn").click(function(e) {
			e.preventDefault();
			
			$('#conference_detail').modal("hide");
			$('#conference_modify').modal("show");
			
		    
		    new modifyMeeting(iddd)


		});
      
      /* 모달 수정 페이지 완료 버튼 클릭시  */
      $("#completeBtn").click(function(e){
    	  e.preventDefault();
    	  
    	  new modifyComplete(iddd)
    	  
      })
      
      
   })
   /* 삭제 */
   function deleMeeting(meetingNo){
	   
	   console.log("meetingNo : " + meetingNo);
 	   	$.ajax({
  	   		url : "deletedMeeting",
  	   		type : "POST",
	  	   	data : {"meetingNo" : meetingNo},
	  	   	success : function(data, status, xhr){
	  	   		console.log(data);
	  	   		
	  	   	 $("#conference_modify").modal("hide");
	  	   	 location.reload();
	  	   	},
	  	   	error : function(error){
	  	   		console.log(error)
	  	   			
	  	   		
	  	   	}
  	   	})
   }
   
   /* 수정페이지 */
   function modifyMeeting(meetingNo){
	   console.log("meetingNo 수정 : " + meetingNo);
	   
	   $.ajax({
		   url : "modifyMeeting",
		   type : "POST",
		   data : {"meetingNo" : meetingNo},
		   success : function(data, status, xhr){
			   console.table(data);
			   
			    var memberList2 = data.memberList;
	   			var meetingName2 = data.meeting.meetingName;
	   			var meetingText2= data.meeting.meetingText;
	   			var enrollDate2 = data.meeting.enrollDate; 
	   			var sprintNumber2 = data.sprintName[0].sprName;
	   			console.log("meetingTexttt :"+ meetingText2);
	   			console.log("meetingNameee :"+ meetingName2);
	   			var appendPlace = 'meetingMemberDetailList1';
	   			var appendPlace1 = 'meetingDateDetail1';	
	   			var appendPlace2 = 'meetingTitleDetail1';
	   			var appendPlace3 = 'meetingContentDetail1';
	   			var appendPlace4 = 'sprintItem1';
	   		
	   			
	   			new insertPerson(memberList2,appendPlace); 
	   			new insertDate(enrollDate2, appendPlace1);
	   			new insertMeetingName1(meetingName2,appendPlace2);
	   			new insertMeetingText1(meetingText2,appendPlace3);
	   			new insertSprintNo1(sprintNumber2,appendPlace4);
		   },
		   error : function(error){
			   console.log(error);
		   }
		   
	   })
	   
   }
   
   /* 수정 완료 버튼 클릭시  */
   function modifyComplete(meetingNo) {
	   
	   
	   var modifyTitle = $("#modifyTitle").val();
	   var modifyContent = $("#modifyContent").val();
	   
	   console.log("모디파이수정 : " + modifyTitle);
	   console.log("모디파이수정 : " + modifyContent);
	   
	   $.ajax({
		   url : "modifyComplete",
		   type : "POST",
		   data : {
			   "meetingNo" : meetingNo,
			   "modifyTitle" : modifyTitle,
			   "modifyContent" : modifyContent			   
		   		},
		   success : function(data){
			   console.log(data);
			   
			   $("#conference_detail").modal("hide");
		  	   	 location.reload();
			   
			   
		   },
		   error : function(error){
			   console.log(error);
		   }
	   })
   }
   
   
   
   /* 상세페이지 */ 
   function selectMeetingDetail(meetingNo){
	   $.ajax({
	        url:"selectMeetingDetail",
	        type:"POST",
	        data : {"meetingNo" : meetingNo},
	   		success: function(data, status, xhr){
	   			console.table(data) ;
	   			var memberListtt = data.memberList;
	   			var meetingNameee = data.meeting.meetingName;
	   			var meetingTexttt= data.meeting.meetingText;
	   			var enrollDate = data.meeting.enrollDate; 
	   			var sprintNumber1 = data.sprintName[0].sprName;
	   			console.log("sprintNumber1" + sprintNumber1)
	   			console.log("enrollDate :"+ enrollDate);
	   			console.log("meetingTexttt :"+ meetingTexttt);
	   			console.log("meetingNameee :"+ meetingNameee);
	   			var appendPlace = 'meetingMemberDetailList';
	   			var appendPlace1 = 'meetingDateDetail';	
	   			var appendPlace2 = 'meetingTitleDetail';
	   			var appendPlace3 = 'meetingContentDetail';
	   			var appendPlace4 = 'sprintItem';
	   		
	   			
	   			new insertPerson(memberListtt,appendPlace); 
	   			new insertDate(enrollDate, appendPlace1);
	   			new insertMeetingName(meetingNameee,appendPlace2);
	   			new insertMeetingText(meetingTexttt,appendPlace3);
	   			new insertSprintNo(sprintNumber1,appendPlace4);
	   		},
	   		error: function(xhr, status, data){
	   			console.log(data);
	   		}
	   })

	   
   }
</script>
<script type="text/javascript">

	var enrollDateInfo = {
		    meetDate : "",
		    EnrollDate : ""	   
	   }
	
	/* console.log(enrollDateInfo); */
	
   const token = $("meta[name='_csrf']").attr("content");
   const header = $("meta[name='_csrf_header']").attr("content");
   
   $(document).ajaxSend(function(e, xhr, options) {
       xhr.setRequestHeader(header, token);
   });
   
   
   function gettoDate(data){
	   var indexxxxx= data.indexOf(" ");
	   var dataaaa = data.substring(0,indexxxxx);
	   console.log(dataaaa);
	}
   
   var meetingNo = '';
   function drawMeeting(enrollDateInfo,meetingName,calenderPlace,meetingNo){
       
       if(enrollDateInfo.EnrollDate === enrollDateInfo.meetDate){
          var insertDiv="";
          insertDiv +='<div class="mtinfo" id="'+ meetingNo +'">' + meetingName + '</div>';
          
          calenderPlace.append(insertDiv);
       }
   }
   
   /* 미팅로그 페이지 출력시 리스트 출력  */
   $(document).ready(function(){
	   var pjtNooo = ${pjtNo};
	   $.ajax({
	        url:"selectAllmeeting",
	        type:"POST",
	        data : {"pjtNo" : pjtNooo},
	   		success: function(data, status, xhr){
	   			
	   			console.table(data) ;
	   			console.log("data.length : " + data.length);
	   			for(var i = 0 ; i < data.length; i++){
	   				/* console.log( ""+ gettoDate(data[i].enrollDate)); */
	   				var meetingInfoooo= calculateDate(data[i].enrollDate);
	   				new drawMeeting(enrollDateInfo,data[i].meetingName ,meetingInfoooo,data[i].meetingNo);
	   			}
	   			
	   		},
	   		error: function(xhr, status, data){
	   			console.log(data);
	   		}
	   })
      
   });
   
      
   var pjtNo = ${pjtNo};
   var count = 0;
   var sprintCount = 0;   
   /* 프로젝트에 참여하고 인원 리스트*/
   $(".conference_update").click(function(){
      
      /* console.log(pjtNo); */
      $.ajax({
         url:"selectProjectMember",
         type:"POST",
         data : {"pjtNo" : pjtNo},
         
         success: function(data, status, xhr){
           console.table(data)
            if(data !==0){
               
               let memberList = data.memberList; 
               let meetingMember = 'meetingMember';
               
               let sprintNumber = data.sprintNo;
               
               new insertSprintNumber(sprintNumber);
               new insertPerson(memberList,meetingMember);
               
              /*  console.log(count); */
            }  
         },
         error:function(data){
            console.log(data);
         }
         
      })
      
      
   });
   
   /* 참석자 이름 넣어주기 */
   function insertPerson(memberList,appendPlace){
	   $("#"+appendPlace+"").empty();
	   /* console.log("insertPersonmemberList : " + memberList.length); */
	   for(let i = 0; i < memberList.length; i++){
           /* console.log("memberList[i].name : " + memberList[i].name);
           console.table( $("#"+appendPlace+"") ); */
           var insertSpan="";
           insertSpan = '<span class="item_text on">' + memberList[i].name + '<i id="delBtn" class="fas fa-times-circle"></i>' + '<input class="item_num" name="memberno' + [i] + '" type="hidden" value="' + memberList[i].no + '">' + '</span>';
           count++
           $("#"+appendPlace+"").append(insertSpan);
        }
   }
   
   /* 스프린트 이름 번호 넣기 */
   function insertSprintNumber(sprintNumber){
	   $("#sprintNumberArea").empty();
	   
	   for(let i = 0; i < sprintNumber.length; i++){
		   
		   var insertOption="";
		   insertOption = '<option>' + sprintNumber[i].sprName + '<input class="sprintNono" name="sprintno' + [i] + '" type="hidden" value="' + sprintNumber[i].sprNo + '">' + '</option>';
		   sprintCount++;
		   $("#sprintNumberArea").append(insertOption);
	   }
   }
   
   /* 상세페이지 스프린트 번호 넣어주기 */
   function insertSprintNo(sprintNumber1,appendPlace){
		$("#"+appendPlace+"").empty();
	   
	   
	    var insertSprint="";
	    insertSprint = '<span>' + sprintNumber1 + '</span>'
	    $("#"+appendPlace+"").append(insertSprint);
   }
   /* 수정페이지 스프린트 번호 넣어주기 */
   function insertSprintNo1(sprintNumber2,appendPlace){
		$("#"+appendPlace+"").empty();
	   
	   
	    var insertSprint="";
	    insertSprint = '<span>' + sprintNumber2 + '</span>'
	    $("#"+appendPlace+"").append(insertSprint);
   }
   
   /* 상세페이지 날짜 넣어주기  */
   function insertDate(enrollDate, appendPlace){
	   $("#"+appendPlace+"").empty();
	   
	   
	   var insertInput="";
	   insertInput = '<span>' + enrollDate + '</span>'
	   $("#"+appendPlace+"").append(insertInput);
   }
  
   /* 상세페이지 타이틀 넣어주기 */
   function insertMeetingName(meetingNameee,appendPlace){
	   $("#"+appendPlace+"").empty();
	   
	   var insertTitle="";
	   insertTitle = '<span>' + meetingNameee + '</span>'
	   $("#"+appendPlace+"").append(insertTitle);
   }
   
   /* 상세페이지 내용 넣어주기 */
    function insertMeetingText(meetingTexttt,appendPlace){
    	$("#"+appendPlace+"").empty();
	   
	   var insertContent="";
	   insertContent = '<span>' + meetingTexttt + '</span>'
	   $("#"+appendPlace+"").append(insertContent); 
	   console.log("이거내용이야" + meetingTexttt);
   }
   
   
    
   
    /* 수정페이지 타이틀 넣어주기 */
    function insertMeetingName1(meetingName2,appendPlace){
 	   $("#"+appendPlace+"").empty();
 	   
 	   var insertTitle="";
 	   insertTitle = '<input id="modifyTitle" class="input_detail" type="text" value="' +meetingName2+ '">' 
 	   
 	   $("#"+appendPlace+"").append(insertTitle);
    }
    
    /* 수정페이지 내용 넣어주기 */
     function insertMeetingText1(meetingText2,appendPlace){
     	$("#"+appendPlace+"").empty();
 	   
 	   var insertContent="";
 	   insertContent = '<textarea id="modifyContent" class="textarea_detail">' + meetingText2 + '</textarea>'
 	   $("#"+appendPlace+"").append(insertContent); 
    }
   
   
   /* 참석자 클릭시 삭제  */
   $(document).on('click','.item_text.on',function(){
      
      var $t = $(this);
      
      $t.remove();
      count--;
      console.log(count);
   }) 
      
   /* 왼쪽 중단 올리기 버튼 클릭시 미팅 입력및 업데이트 */
   $("#upload").click(function(){

      var enrollDate = $("#meetingDate").val();                  // input date 값
      var meetingInfo= new calculateDate(enrollDate);
                 
      
      var sprintNo = $("#sprintNumberArea option:selected").find(".sprintNono").val();
      
      var meetingName = $("#titleName").val();
      var meetingText = $("#meetingContent").val();
      
      var meetingMember = $('form[name=projectMemberList]').serializeArray();
      for(let i = 0; i < count; i++){
         memberAttend = $('#meetingMember').find(".item_num").eq(i).val();
         meetingMember.push({name : "memberAttend", value : memberAttend});
         var index = i + 1;
         console.log(memberAttend);
      }
      
      insertMeeting(pjtNo,meetingMember,enrollDate,meetingName,index,meetingText,meetingInfo,sprintNo);
      console.log(meetingMember);
      

   })
   
   function getInsertMeeting(){
	   
   }
   
   
   /* 미팅 날짜와 해당날짜 id값 비교 */
   function calculateDate(enrollDate){
	      

	   	 /*  console.log("enrollDate" + enrollDate); */
	      var enrollDate1 = enrollDate.substring(0,5);               //date 값의 년도 
	      var enrollDate2 = enrollDate.substring(5,8);               //date 값의 월
	      var enrollDate3 = enrollDate.substring(8,10);               //date 값의 일
	      var enrollDate4 = enrollDate2.replace(/(^0+)/, "");            //0제외
	      var enrollDate5 = enrollDate3.replace(/(^0+)/, "");            //0제외
	      var enrollDate6 = enrollDate1 + enrollDate4 + enrollDate5;      //더하기
	     /*  console.log("enrollDate1 : " + enrollDate1);
	      console.log("enrollDate2 : " + enrollDate2);
	      console.log("enrollDate3 : " + enrollDate3);
	      console.log("enrollDate4 : " + enrollDate4);
	      console.log("enrollDate5 : " + enrollDate5);
	      console.log("enrollDate6 : " + enrollDate6); */
	      enrollDateInfo.EnrollDate = enrollDate6;
	      
	      var indexnum = parseInt(enrollDate5) - 5;                  //달력 인덱스값(정수로 파싱)
	   
	      var indexnum2 = parseInt(enrollDate5) - 1;                  //달력 뷰에 값넣기 위한 인덱스
	    
	      var meetDate = $("div[id^="+202+"]");                       //달력 div에 각각의 id값 가져오기
	      
	     // console.log(meetDate);
	      var meetDate2 = meetDate.index() + indexnum;                 //입력한 date 값과  맞추기
	      
	      var meetDate3 = meetDate.eq(meetDate2);                    //몇번째 인덱스값과 같은지 비교
	      
	      var enrollDate7 = meetDate3.attr("id");   
	      enrollDateInfo.meetDate = enrollDate7;
	      //요소 속성값 가져오기
	      var meetinginfo = meetDate.eq(indexnum2);
	      
	    /*   console.log(enrollDateInfo.meetDate);
	      console.log(enrollDateInfo.EnrollDate); */
	      
	      return meetinginfo;
   }
   
	   
   
   function insertMeeting(pjtNo,meetingMember,enrollDate,meetingName,index,meetingText,meetingInfo, sprintNo){
      $.ajax({
          url : "${pageContext.servletContext.contextPath}/meeting/meetinglog",
          type : "POST",   
          dataType : "json",
          data : {
                "pjtNo" : pjtNo,
                "meetingMember" : meetingMember,
                "enrollDate" : enrollDate,
                "meetingName" : meetingName,
                "meetingText" : meetingText,
                "index" : index,
                "sprintNo" : sprintNo
                },
          success : function(data, status, xhr){
             /* console.log( enrollDateInfo.EnrollDate === enrollDateInfo.meetDate); */
             drawMeeting(enrollDateInfo,meetingName,meetingInfo,meetingNo)	
             $("#conference").modal("hide");
             location.reload();
             
          },
          error : function(xhr, status, error){
             console.log(error);
          }
       })
   }

</script>




</html>