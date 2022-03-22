<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b6b7355eb56122be94594a5e40e5fd&libraries=clusterer"></script>
<script>
$(document).ready(function() {
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 14 // 지도의 확대 레벨 
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
		url : "selectcontent" ,
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
				var markerPosition  = new kakao.maps.LatLng(data[i].latitude, data[i].longitude); // 데이터에서 좌표 값을 가지고 마커를 표시
				var marker = new kakao.maps.Marker({  //반복문에서 생성하는 marker 객체를 markers에 추가
		            map: map, // 마커를 표시할 지도
		            position: markerPosition // 마커를 표시할 위치
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
</body>
</html>