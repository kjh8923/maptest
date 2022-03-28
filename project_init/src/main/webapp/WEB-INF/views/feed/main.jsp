<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/b4e02812b5.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/feed/fc/main.js"></script>
<script src="js/feed/fc/locales/ko.js"></script>
<script src="js/feed/feed_calendar.js"></script>
<link href="css/feed/fc/main.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/feed/main_custom.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<title>Insert title here</title>

</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<section class="container mb-5">
	<div class="body-container">
		<div id="feed-header" class="d-flex justify-content-around">
			<div id="profile-left" class="p-3 mb-5 bg-body"></div>
			<div id="profile-img" class="p-3 mb-5 bg-body">
				<i class="profile-img fa-regular fa-circle-user"></i>
			</div>
			<div id="profile-right" class="p-3 mb-5 bg-body"></div>
		</div>
		
		<ul class="nav nav-tabs feed-tabs row mx-0">
			<li class='nav-item col-3 active' data-tab=''>
				<a href="" class="nav-link mb-1">
					<i class="fa-regular fa-calendar-check"></i>
				</a>
			</li>
			
			<li class='nav-item col-3' data-tab=''>
				<a href="" class="nav-link mb-1">
					<i class="fa-solid fa-map-location-dot"></i>
				</a>
			</li>
			
			<li class='nav-item col-3' data-tab=''>
				<a href="" class="nav-link mb-1">
					<i class="fa-solid fa-images"></i>
				</a>
			</li>
			
			<li class='nav-item col-3' data-tab=''>
				<a href="" class="nav-link mb-1">
					<i class="fa-solid fa-gear"></i>
				</a>
			</li>
		</ul>
		
		
		<div class="d-flex justify-content-between mt-5" id="main-body">
			<!-- create plan form -->
			<div class="border rounded p-3">
				<form action="plan" id="frm" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<div class="form-group">
						<label for="planName">일정 이름</label>
						<input type="text" name="planName" id="planName" class="form-control" required/>
					</div>
					
					<div class="form-group">
						<label for="startDate">시작 일자</label>
						<input type="text" name="startDate" id="startDate" class="form-control bg-light" required readonly/>
					</div>
					
					<div class="form-group">
						<label for="endDate">종료 일자</label>
						<input type="text" name="endDate" id="endDate" class="form-control bg-light" required readonly/>
					</div>
					
					<div class="form-group">
						<label for="eventColor">블럭 색상</label>
						<select class="custom-select my-1 mr-sm-2 " id="eventColor" name="eventColor">
							<option value="#007bff" selected>Blue</option>
							<option value="#6610f2">Indigo</option>
							<option value="#6f42c1">Purple</option>
							<option value="#e83e8c">Pink</option>
							<option value="#dc3545">Red</option>
							<option value="#fd7e14">Orange</option>
							<option value="#ffc107">Yellow</option>
							<option value="#28a745">Green</option>
							<option value="#20c997">Teal</option>
							<option value="#17a2b8">Cyan</option>
							<option value="#6c757d">Gray</option>
							<option value="gray-dark">Dark Gray</option>
						</select>
					</div>
					<input type="hidden" name="dateCount" id="dateCount" class="form-control"/>
					
					<div class="d-flex justify-content-end mp_btn">
						<button type="submit" class="btn btn-sm btn-primary mr-1" id="submit" >Create</button>
						<input type="reset" class="btn btn-sm btn-danger px-2" id="reset" value="Clear" />
					</div>
				</form>
			</div>
			<!-- fullcalendar div  -->
			<div id="calendar" class="container"></div>
		</div>
	</div>
	<!-- modal button -->
	<input type="hidden" id="modalBtn2" data-toggle="modal" data-target="#myModal2" value="modal" />
	
	<!-- modal 창 -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog modal-dialog-centered modal-xl d-block">
			<button type="button" id="modalCloseBtn" class="btn btn-xl btn-default text-white text-weight-bold display-1 float-right" data-dismiss="modal">&times;</button>
			<div class="modal-content">
				<div class="modal-header bg-light d-flex justify-content-start">
					<h4 id="plan-name" class="modal-title display-4 font-italic"></h4>
				</div>
				
				<div class="modal-body bg-light">
					<form action="feed/modify_plan.do" class="row" method="post" id="modify_form">
						<input type="hidden" name="planNum" id="planNum" />
						<div class="form-group col-4">
							<label for="planName">일정 이름</label>
							<input type="text" id="planName" name="planName" class="form-control"/>
						</div>
						
						<div class="form-group col-4">
							<label for="startDate">시작 일자</label>
							<input type="date" id="startDate" name="startDate" class="form-control"/>
						</div>
						
						<div class="form-group col-4">
							<label for="endDate">종료 일자</label>
							<input type="date" id="endDate" name="endDate" class="form-control"/>
						</div>
					</form>
					<div class="button-group d-flex justify-content-end mt-2">
						<button type="button" id="btn-modify" class="btn btn-sm btn-success mx-1">일정 수정</button>
						<button type="button" id="btn-delete" class="btn btn-sm btn-danger mx-1">일정 삭제</button>
						<button type="button" id="btn-detail" class="btn btn-sm btn-dark mx-1">상세 수정</button>
					</div>
					<hr />
					<h4 id="plan-day" class="display-4 font-italic" style="font-size: 30px; font-weight: 600;">day 1</h4>
					<div class="plan-details mt-2 d-flex row mx-0" style="height:500px;">
						<button type="button" class="btn btn-outline-light text-dark col-1">
							<i class="fa-solid fa-angle-left"></i>
						</button>
						
						<div id="modal_map" class="col-6 border"></div>
						<div id="modal_details" class="col-4 border"></div>
							
						<button type="button" class="btn btn-outline-light text-dark col-1">
							<i class="fa-solid fa-angle-right"></i>
						</button>			
					</div>
				</div>
				<div class="modal-footer bg-light mb-2"></div>
			</div>
		</div>
	</div>

</section>



<%@ include file="/WEB-INF/views/feed/modal1.jsp" %>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>