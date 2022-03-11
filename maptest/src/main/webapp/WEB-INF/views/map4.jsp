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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

</style>
</head>
<body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b6b7355eb56122be94594a5e40e5fd&libraries=services"></script>

<div class="container">
	<h3>Map</h3>
	<hr/>
	<form action="mapmain" method="POST" id="frm">
		<div class="input-group mb-3 input-group-sm">	<!-- input과 도움말을 묶는 클래스, input-group-sm/lg 도움말 사이즈 -->
			<div class="input-group-prepend">	<!-- 도움말 위치 표시 클래스 -->
				<span class="input-group-text">제목</span> <!-- 도움말 내용 표시 클래스 -->
			</div>
			<input type="text" class="form-control" placeholder="title" id="title" name="title"/>
		</div>
		<div class="input-group mb-3 input-group-sm">	<!-- input과 도움말을 묶는 클래스, input-group-sm/lg 도움말 사이즈 -->
			<div class="input-group-prepend">	<!-- 도움말 위치 표시 클래스 -->
				<span class="input-group-text">내용</span> <!-- 도움말 내용 표시 클래스 -->
			</div>
			<textarea class="form-control" placeholder="content" rows="10" cols="30" name="content" style="height : 350px;"></textarea>
		</div>
		<input type="text" id="placeName" name="placeName" value="" style="width:400px"><br/>
		<input type="text" id="placeName2" name="placeName2" value="" style="width:400px"><br/>
		<input type="text" id="latitude" name="latitude" value="" style="width:400px"><br/>
		<input type="text" id="longitude" name="longitude" value="" style="width:400px">
		<button type="submit" id="submit" class="btn btn-primary" style="float: right;">입력</button>
	</form>

	<div class="map_wrap">
    	<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    	<div id="menu_wrap" class="bg_white">
        	<div class="option">
            	<div>
                	<form onsubmit="searchPlaces(); return false;">
                    	키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    	<button type="submit">검색하기</button> 
                	</form>
            	</div>
        	</div>
        	<hr>
        	<ul id="placesList"></ul>
        	<div id="pagination"></div>
    	</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$('#submit').click(function(event){
		event.preventDefault(); //원래 form의 기능인 submit를 ajax로 처리
		
		var frm = $('#frm');
		var title = $('#title').val();
		var content = $('#content').val();
		var latitude = $('#latitude').val();
		var longitude = $('#longitude').val();
		var placeName = $('#placeName').val();
		var placeName2 = $('#placeName2').val();
	
		// 선택한 값을 json 형태 자료로 생성
		var json = {
				title : title,
				content : content,
				latitude : latitude,
				longitude : longitude,
				placeName : placeName,
				placeName2 : placeName2
		};
		
		// ajax로 json 객체를 controller로 보내서 db 추가
		$.ajax({
			type : 'post',
			url : 'insertMap',
			contentType : 'application/json; charset=UTF-8',
			data : JSON.stringify(json),
			success : function(data){	//모달창을 이용하여 가입결과를 출력
				console.log(data);			
			},
			error : function(){
				console.log('오류');
			}
		});
	});
});

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder(); 
 
//지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
              

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
/*             kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
             */
            kakao.maps.event.addListener(marker, 'click', function() {
            	displayInfowindow(marker, title);
            });
                     
            itemEl.onclick =  function () {
                displayInfowindow(marker, title);
            }; 

/*             itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            }; */
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}


// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

 	// 클릭한 위도, 경도 정보를 가져옵니다
    var latlng = marker.latLng;
	$('#latitude').val(marker.getPosition().getLat());
    $('#longitude').val(marker.getPosition().getLng());
    
    

    
/* 			$("#btn1").on('click', function(){
				alert("좌표 전송");
				$.ajax({
					url : "home",
					type : "post",
					data :{
						latitude : $('#latitude').val(),
						longitude : $('#longitude').val(),
					},
					contentType : "application/json; charset=utf-8;",
					dataType : "json",
					success : function(data){
						alert('성공');
					},
					error : function(){
						alert("장소를 다시 선택해 주세요.");
					}
				});
			});  */
    
   
    infowindow.setContent(content);
    infowindow.open(map, marker);
}


 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

 
 
/* kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	// 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 

    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
 	$(document).ready(function(){
 		$("#btn1").on('click', function(){
 			var form = {
 				latitude : $('#latitude').val(marker.getPosition().getLat());
 				longitude : $('#longitude').val(marker.getPosition().getLng());
 			};
 			$.ajax({
 				url : "write",
 				type : "POST",
 				data : JSON.stringify(form),
 				contentType : "application/json; charset=utf-8;",
 				dataType : "json"
 				success : function(data){
 					var lat = data.latitude;
 					var lon = data.longitude;
 					$('#latitude').text(lat);
 					$('#longitude').text(lon);
 				},
 				error : function(){
 					alert("장소를 다시 선택해 주세요.");
 				}
 			});
 		});
 	}); */
/*     $('#latitude').val(latlng.getLat());
    $('#longitude').val(latlng.getLng()); */
    
 	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
/*     searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr" style="width:250px">' +
                            '<span class="title">주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 인포윈도우에 클릭한 위치에 대한 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            
         	$(document).ready(function(){
         		$("#btn1").on('click', function(){
         			var form = {
         				placeName : $('#placeName').val(marker.getPosition().getLat());
         				placeName2 : $('#placeName2').val(marker.getPosition().getLng());
         			};
         			$.ajax({
         				url : "write",
         				type : "POST",
         				data : JSON.stringify(form),
         				contentType : "application/json; charset=utf-8;",
         				dataType : "json"
         				success : function(data){
         					var pla = data.latitude;
         					var pla2 = data.longitude;
         					$('#placeName').text(pla);
         					$('#placeName2').text(pla2);
         				},
         				error : function(){
         					alert("장소를 다시 선택해 주세요.");
         				}
         			});
         		});
         	}); */
/*             $('#placeName').val(result[0].road_address.address_name);
            $('#placeName2').val(result[0].address.address_name); */
/*         }   
    });
}); */


/* function searchAddrFromCoords(coords, callback) {
    // 좌표로 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
} */


</script>
</body>
</html>