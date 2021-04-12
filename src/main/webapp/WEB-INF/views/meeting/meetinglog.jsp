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
         <div class="main-wrap">
            <div class="main-day"></div>
            <div class="main-date"></div>
         </div>
         <div class="todo-wrap">
            <div class="todo-title">Todo List</div>
            <button class="conference_update">올리기</button>
            <form class="input-form">
               <input type="text" placeholder="write here!!" class="input-box" />
               <button type="submit" class="input-btn clickBtn">INPUT</button>
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
                              <input class="input_detail" type="date" id="meetingDate" name="enrollDate">
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
                              
                           </div>                     
                        </div>
                        <div class="modal_line"></div>
                     <!--    <div class="row">
                           <div class="item_type type">
     			                         팀원추가
                           </div>
                           <div class="item_type">
                              <input class="input_detail" type="text" id="memberEmail" name="" placeholder="회의 참가자 추가" onclick="this.value=''">
                              <button type="button" id="memberAddBtn" class="btn_detail">Add</button>
                           </div>
                           
                        </div>
                        <div class="modal_line"></div> -->
                        <div class="row">
                           <div class="item_type type">
                              참석자
                           </div>
                           <div class="item_type" id="meetingMember">
                              
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
                     <input type="button" id="upload" class="upload_btn" value="완료">   
                  </div>                                          
               </div>
            </form>
         </div>
      </div>

   </div>
   
   <jsp:include page="../meeting/meeting_detail.jsp"></jsp:include>
   
   
</body>

<script type="text/javascript">
   $(function(){
      $(".conference_update").click(function(e){
         e.preventDefault();
         
         $("#conference").modal();
         
      })
      
      $(this).on("click",".mtinfo", function(){
    	  
	      $("#conference_detail").modal();
	      console.log('id : '+ $(this).attr('id'));
	      selectMeetingDetail($(this).attr('id'));
	      
	      
    	  
      })
      
   })
   function selectMeetingDetail(meetingNo){
	   $.ajax({
	        url:"selectMeetingDetail",
	        type:"POST",
	        data : {"meetingNo" : meetingNo},
	   		success: function(data, status, xhr){
	   			console.table(data) ;
	   			console.table(data.memberList[0].name) ;
	   			var memberListtt = data.memberList;
	   			console.log("memberListtt :" + memberListtt[0]);
	   			var appendPlace = 'meetingMemberDetailList';
	   			
	   			new insertPerson(memberListtt,appendPlace);
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
	
	console.log(enrollDateInfo);
	
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
	   				console.log( ""+ gettoDate(data[i].enrollDate));
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
      
   $(".conference_update").click(function(){
      
      console.log(pjtNo);
      $.ajax({
         url:"selectProjectMember",
         type:"POST",
         data : {"pjtNo" : pjtNo},
         
         success: function(data, status, xhr){
            console.table(data)
            if(data !==0){
               
               let memberList = data; 
               let list="";
               let meetingMember = 'meetingMember';
               new insertPerson(memberList,meetingMember);
               
               console.log(count);
            }  
         },
         error:function(data){
            console.log(data);
         }
         
      })
      
      
   });
   

   function insertPerson(memberList,appendPlace){
	   console.log("insertPersonmemberList : " + memberList.length);
	   for(let i = 0; i < memberList.length; i++){
           console.log("memberList[i].name : " + memberList[i].name);
           console.table( $("#"+appendPlace+"") );
           var insertSpan="";
           insertSpan = '<span class="item_text on">' + memberList[i].name + '<i id="delBtn" class="fas fa-times-circle"></i>' + '<input class="item_num" name="memberno' + [i] + '" type="hidden" value="' + memberList[i].no + '">' + '</span>';
           count++
           $("#"+appendPlace+"").append(insertSpan);
        }
   }
   
   $(document).on('click','.item_text.on',function(){
      
      var $t = $(this);
      
      $t.remove();
      count--;
      console.log(count);
   }) 
      
   $("#upload").click(function(){

      var enrollDate = $("#meetingDate").val();                  // input date 값
      var meetingInfo= new calculateDate(enrollDate);
                              
      
      var meetingName = $("#titleName").val();
      var meetingText = $("#meetingContent").val();
      
      
      var meetingMember = $('form[name=projectMemberList]').serializeArray();
      for(let i = 0; i < count; i++){
         memberAttend = $('#meetingMember').find(".item_num").eq(i).val();
         meetingMember.push({name : "memberAttend", value : memberAttend});
         var index = i + 1;
         console.log(memberAttend);
      }
      
      insertMeeting(pjtNo,meetingMember,enrollDate,meetingName,index,meetingText,meetingInfo);
      console.log(meetingMember);
      

   })
   
   function getInsertMeeting(){
	   
   }
   
   
   function calculateDate(enrollDate){
	      

	   	  console.log("enrollDate" + enrollDate);
	      var enrollDate1 = enrollDate.substring(0,5);               //date 값의 년도 
	      var enrollDate2 = enrollDate.substring(5,8);               //date 값의 월
	      var enrollDate3 = enrollDate.substring(8,10);               //date 값의 일
	      var enrollDate4 = enrollDate2.replace(/(^0+)/, "");            //0제외
	      var enrollDate5 = enrollDate3.replace(/(^0+)/, "");            //0제외
	      var enrollDate6 = enrollDate1 + enrollDate4 + enrollDate5;      //더하기
	      console.log("enrollDate1 : " + enrollDate1);
	      console.log("enrollDate2 : " + enrollDate2);
	      console.log("enrollDate3 : " + enrollDate3);
	      console.log("enrollDate4 : " + enrollDate4);
	      console.log("enrollDate5 : " + enrollDate5);
	      console.log("enrollDate6 : " + enrollDate6);
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
	      
	      console.log(enrollDateInfo.meetDate);
	      console.log(enrollDateInfo.EnrollDate);
	      
	      return meetinginfo;
   }
   
   
   function insertMeeting(pjtNo,meetingMember,enrollDate,meetingName,index,meetingText,meetingInfo){
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
	                "index" : index
	                },
	          success : function(data, status, xhr){
	             console.log( enrollDateInfo.EnrollDate === enrollDateInfo.meetDate);
	             drawMeeting(enrollDateInfo,meetingName,meetingInfo,meetingNo)
	             $("#conference").modal("hide");
	             
	             
	          },
	          error : function(xhr, status, error){
	             console.log(error);
	          }
	       })
   }
   
   function drawMeeting(enrollDateInfo,meetingName,calenderPlace,meetingNo){
       
       if(enrollDateInfo.EnrollDate === enrollDateInfo.meetDate){
          var insertDiv="";
          insertDiv +='<div class="mtinfo" id="'+ meetingNo +'">' + meetingName + '</div>';
          
          calenderPlace.append(insertDiv);
       }
   }
   
   
</script>




</html>