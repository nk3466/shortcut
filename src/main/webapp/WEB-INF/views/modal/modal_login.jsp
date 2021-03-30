<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="member_login">
		<div class="modal-dialog">
			<div id="asdf" class="modal-content login">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<div class="modal-title">Short Cut 에 오신걸 환영합니다.</div>						
				</div>
	
				<!-- Modal body -->
				<form action="${ pageContext.servletContext.contextPath }/login" method="post">
					<div class="modal-body">
						<div class="login_info">
							<input class="input_detail" type="text" name="email" placeholder="Email">	
						</div>						
						<div class="login_info">
							<input class="input_detail" type="password" name="password" placeholder="비밀번호">	
						</div>						
					</div>
	
					<!-- Modal footer -->
	
					<!-- <div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>	 -->
					<div class="login_btn_area">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
						<button class="login_btn" type="submit">Login</button>
						<!-- <a class="login_btn" href="http://kordzor.cafe24.com/final/project_board.html">Login</a> -->
					</div>
				</form>	
				<div class="modal_text_area">
					<div class="modal_text">
						<a class="modal_text_detail" href="#" data-toggle="modal" data-target="#password_find">비밀번호 찾기</a> 
					</div>
					<div class="modal_text">
						<a class="modal_text_detail" href="#" data-toggle="modal" data-target="#member_regist">회원 가입 하기</a>
					</div>
				</div>				
			</div>
		</div>
	</div>


<script type="text/javascript">
	$(function() {

		
		$(".modal_text_detail").click(function(e) {
			e.preventDefault();

			var $t = $(this);
			
			$('#member_login').modal("toggle");
		});
		
	})

</script>


</body>
</html>