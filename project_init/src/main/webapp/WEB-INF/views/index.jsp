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
<link rel="stylesheet" type="text/css" href="css/includes/header.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/includes/footer.css" />
<title>Insert title here</title>
</head>
<body>

<%@ include file="includes/header.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b6b7355eb56122be94594a5e40e5fd&libraries=clusterer"></script>
<section class="container">
		<div class="main-body-top d-flex justify-content-between mb-3">
			<div class="map border rounded p-2" id="map"></div>
			<!-- 맵 생성 -->
			<div class="right ml-2">
				<div class="user-info border rounded mb-2 p-1">
					<div class="user-info-top d-flex">
						<s:authorize access="isAnonymous()">
							<div class="profile-img">
								<i class="user-info-icon fa-regular fa-circle-user"></i>
							</div>

							<div class="nickname">
								<p class="h5">Nickname</p>
							</div>

							<button type="button" class="logx-btn btn btn-primary btn-sm">login</button>
						</s:authorize>

						<s:authorize access="isAuthenticated()">
							<div class="profile-img">
								<i class="user-info-icon fa-regular fa-circle-user"></i>
							</div>

							<div class="nickname">
								<p class="h5">Nickname</p>
							</div>

							<button type="button" class="logx-btn btn btn-danger btn-sm">logout</button>
						</s:authorize>
					</div>
				</div>
				<div class="map-filter border rounded p-1">
					<i class="map-filter-icon fa-solid fa-list-check"></i>
					<form id="frm" name="frm" action="insertFilter" method="post">
						<div class="form-group"> 
							<select class="main-filter" name="value1">
								<!-- <option>Select Filter</option> -->
								<option value="category">장소</option>
								<option value="address">지역</option>
								<option value="transportation">이동수단</option>
								<option value="theme">테마</option>
							</select><br/> 
							<select class="sub-filter" name="value2">
								<!-- <option>-------------</option> -->
								<option value="AT4">관광명소</option>
								<option value="AD5">숙박</option>
								<option value="FD6">음식점</option>
								<option value="CE7">카페</option>
								<option value="HP8">병원</option>
								<option value="PM9">약국</option>
								<option value="MT1">대형마트</option>
								<option value="CS2">편의점</option>
								<option value="PS3">어린이집, 유치원</option>
								<option value="SC4">학교</option>
								<option value="AC5">학원</option>
								<option value="PK6">주차장</option>
								<option value="OL7">주유소, 충전소</option>
								<option value="SW8">지하철역</option>
								<option value="BK9">은행</option>
								<option value="CT1">문화시설</option>
								<option value="AG2">중개업소</option>
								<option value="PO3">공공기관</option>
							</select>
						</div>
						<button type="submit" id="submit" class="btn btn-success" style="float: right;">Filter</button>
					</form>
				</div>										
			</div>
		</div>

		<div class="main-body-bottom mb-3">
		<div class="recommand recommand-1 mb-2">
			<div class="recommand-icon text-danger d-flex justify-content-between">
				<i class="btn1 fa-solid fa-location-arrow"></i>
				<a href="search" class="text-danger">
					<i class="btn2 fa-regular fa-circle-right"></i>
				</a>
			</div>
			
			<div class="posts d-flex justify-content-between mt-2">
				<c:forEach begin="1" end="4" var="i">
					<div class="post mr-2">
						<div class="post-top border rounded"></div>
						<div class="post-bottom border"></div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="recommand recommand-2 mb-2">
			<div class="recommand-icon text-primary d-flex justify-content-between">
				<i class="btn1 fa-solid fa-users"></i>
				<a href="search" class="text-primary">
					<i class="btn2 fa-regular fa-circle-right"></i>
				</a>
			</div>
			
			<div class="posts d-flex justify-content-between mt-2">
				<c:forEach begin="1" end="4" var="i">
					<div class="post mr-2">
						<div class="post-top border rounded"></div>
						<div class="post-bottom border"></div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="recommand recommand-3 mb-2">
			<div class="recommand-icon text-success d-flex justify-content-between">
				<i class="btn1 fa-solid fa-font-awesome"></i>
				<a href="search" class="text-success">
					<i class="btn2 fa-regular fa-circle-right"></i>
				</a>
			</div>
			
			<div class="posts d-flex justify-content-between mt-2">			
				<c:forEach begin="1" end="4" var="i">
					<div class="post mr-2">
						<div class="post-top border rounded"></div>
						<div class="post-bottom border"></div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="recommand recommand-4 mb-2">
			<div class="recommand-icon text-warning d-flex justify-content-between">
				<i class="btn1 fa-solid fa-trophy"></i>
				<a href="search" class="text-warning">
					<i class="btn2 fa-regular fa-circle-right"></i>
				</a>
			</div>
			
			<div class="posts d-flex justify-content-between mt-2">			
				<c:forEach begin="1" end="4" var="i">
					<div class="post mr-2">
						<div class="post-top border rounded"></div>
						<div class="post-bottom border"></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>	
</section>

<%@ include file="includes/login_modal.jsp" %>
<%@ include file="includes/post_details.jsp" %>
<%@ include file="includes/footer.jsp" %>


<script>

//메인 필터객체 생성
var mainFilter = document.querySelector('.main-filter');

//메인 필터 객체에 변화가 생겼을 때 이벤트가 실행될 수 있는 onchange이벤트 생성
mainFilter.onchange = function(){
	var subFilter = document.querySelector('.sub-filter');
	var mainOption = mainFilter.options[mainFilter.selectedIndex].innerText;

var subOption = {
	/* place : ['관광명소', '숙박', '음식점', '카페', '병원', '약국', '대형마트', '편의점', '어린이집, 유치원', '학교', '학원', '주차장', '주유소, 충전소', '지하철역', '은행', '문화시설', '공공기관'], */
	address : ['서울', '부산', '제주', '경기', '인천', '강원', '경상', '전라', '충청'],
	transportation : ['도보', '자가용', '고속/시외/시내버스', '지하철', '자전거', '택시', '전세/관광버스', '차량대여/렌트', '오토바이', '전동킥보드', '비행기', '선박', '기타'],
	theme : ['방문', '데이트', '가족여행', '친구들과', '맛집탐방', '비즈니스', '소개팅', '미용', '운동', '문화생활', '여가생활']
}

	switch(mainOption){
		 case '장소' : 
			var subOption = subOption.place;
			break; 
		case '지역' : 
			var subOption = subOption.address;
			break;
		case '이동수단' : 
			var subOption = subOption.transportation;
			break;
		case '테마' : 
			var subOption = subOption.theme;
			break;
	}
	
	subFilter.options.length = 0;
	
	for(var i=0; i < subOption.length; i++){
		var option = document.createElement('option');
		option.innerText = subOption[i];
		subFilter.append(option);
	}
}


$(document).ready(function() {
	$('.post').click(function() {
		console.log($(this).text());
		$('#modalBtn').trigger('click');
	})
});
$(document).ready(function() {
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.1372611294738, 128.09319902660602), // 지도의 중심좌표 
        level : 13 // 지도의 확대 레벨 
    });
    
    
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true, // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
        calculator: [10, 20, 30], // 클러스터의 크기 구분 값(10개, 20개, 30개 마다 다르게), 각 사이값마다 설정된 text나 style이 적용된다
        styles: [{ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
            width : '30px', height : '30px',
            background: 'rgba(51, 204, 255, .8)',
            borderRadius: '15px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '31px'
        },
        {
            width : '40px', height : '40px',
            background: 'rgba(255, 153, 0, .8)',
            borderRadius: '20px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '41px'
        },
        {
            width : '50px', height : '50px',
            background: 'rgba(255, 51, 204, .8)',
            borderRadius: '25px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '51px'
        },
        {
            width : '60px', height : '60px',
            background: 'rgba(255, 80, 80, .8)',
            borderRadius: '30px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '61px'
        }
    	]
    });
    
    // 데이터를 가져오기 위해 ajax를 사용
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
   	$.ajax({
		url : "selectPlanList" ,
		type : "POST",
		beforeSend: function(xhr){
 		   	var token = $("meta[name='_csrf']").attr('content');
 			var header = $("meta[name='_csrf_header']").attr('content');
		        xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			console.log(data);
		   	var markers =[]; // markers를 배열로 선언
			for (var i = 0; i < data.length; i++ ) {
				var marker = new kakao.maps.Marker({  //반복문에서 생성하는 marker 객체를 markers에 추가
		            map: map, // 마커를 표시할 지도
		            position: new kakao.maps.LatLng(data[i].latitude, data[i].longitude) // 마커를 표시할 위치
		        })				
								
				markers.push(marker);
			 }		
			clusterer.addMarkers(markers); // 클러스터러에 마커들을 추가
							
		},
		error : function(data) {
			console.log(data);
			alert('오류');
		}
	});
     
	$('#submit').click(function(e){
		e.preventDefault();
		var value1 = $('.main-filter').val();
		var value2 = $('.sub-filter').val();
		console.log(value1 + "," + value2);
		$.ajax({
			url : 'filter',
			type: 'post',
			data: {'value1' : value1, 'value2' : value2},
			beforeSend: function(xhr){
	 		   	var token = $("meta[name='_csrf']").attr('content');
	 			var header = $("meta[name='_csrf_header']").attr('content');
			        xhr.setRequestHeader(header, token);
			},
			success: function(data) {
				setMarkers(null);
			},
			error: function(data) {
				
			}
		})
		
	})
	
  
    
	// 마커 클러스터러에 클릭이벤트를 등록합니다
	// 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
	// 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
	kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
		
		// 현재 지도 레벨에서 1레벨 확대한 레벨
	    var level = map.getLevel()-1;
		
	 	// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	    map.setLevel(level, {anchor: cluster.getCenter()});
	});
	
});   
</script>

</body>
</html>
