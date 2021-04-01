<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/index.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/retrospect.css">

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
	<div class="retrospect_area">
		<div class="retrospect_header">
			<div class="header_text1">
				00 프로젝트
			</div>
			<div class="header_text2">
				00 스프린트
			</div>	
		</div>
		<div class="time_area">
			<div class="row">
				<div class="time_item">
					<div class="start_time">
						시작 시간 
						<input type="time" name="">
					</div>
				</div>
				<div class="time_item">
					<div class="end_time">
						종료 시간 
						<input type="time" name="">
					</div>
				</div>
			</div>
		</div>
		<div class="retrospect_content">
			<table>
				<tr>
					<th></th>
					<th>만족스러웠던 점</th>
					<th>깨달았거나 배웠던 점</th>
					<th>놓쳤거나 부족 햇던 점</th>
				</tr>
				<tr>
					<td>정민서</td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
				</tr>
				<tr>
					<td>정민서</td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
				</tr>
				<tr>
					<td>정민서</td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
				</tr>
				<tr>
					<td>정민서</td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
				</tr>
				<tr>
					<td>정민서</td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
					<td><textarea class="text_detail"></textarea></td>
				</tr>
			</table>
			<div class="save_btn">
				<button class="btn_detail">저장</button>
			</div>
		</div>
	</div>
</body>
</html>