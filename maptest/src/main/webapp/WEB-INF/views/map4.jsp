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
<a href = "main">main</a><br/>
<a href = "markerclusterer">markerclusterer</a>
 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b6b7355eb56122be94594a5e40e5fd&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b6b7355eb56122be94594a5e40e5fd"></script>
<div class="container">
	<h3>Map</h3>
	<hr/>
<!-- 	<form action="mapmain" method="POST" id="frm">
		<div class="input-group mb-3 input-group-sm">	input과 도움말을 묶는 클래스, input-group-sm/lg 도움말 사이즈
			<div class="input-group-prepend">	도움말 위치 표시 클래스
				<span class="input-group-text">제목</span> 도움말 내용 표시 클래스
			</div>
			<input type="text" class="form-control" placeholder="title" id="title" name="title"/>
		</div>
		<div class="input-group mb-3 input-group-sm">	input과 도움말을 묶는 클래스, input-group-sm/lg 도움말 사이즈
			<div class="input-group-prepend">	도움말 위치 표시 클래스
				<span class="input-group-text">내용</span> 도움말 내용 표시 클래스
			</div>
			<textarea class="form-control" placeholder="content" rows="10" cols="30" id="content" name="content" style="height : 350px;"></textarea>
		</div>
		<input type="text" id="placeName" name="placeName" value="" style="width:400px">
		input 추가,삭제
		<div id="pre_set">
	    	<input type="text" id="latitude" name="latitude" value="" style="width:400px">
	    	<input type="text" id="longitude" name="longitude" value="" style="width:400px">
	    	<input type="button" value="삭제" onclick="remove_item(this)">
		</div>
		<div id="field"></div>
		<input type="button" value=" 추가 " onclick="add_item()">			
		<button type="submit" id="submit" class="btn btn-primary" style="float: right;">입력</button>
	</form><br/> -->


	<div>
    총 갯수 : <span id="showIndex"></span> / 5
	</div>
	<button type="button" id="insertButton" style="font-size: larger">추가</button>
    <span id="readInputs" style="font-size: larger">저장</span>
    <form id="frm">
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

//latitude, longitude, placeName 값이 들어갈 input창 생성

$(document).ready(function (){
    var testForm = $("#frm")
    var index = 0    	
     $("#insertButton").on("click", function (){
         if(index == 5){
            alert("5개 까지만 됩니다.")
            return false;
        }
        
        var newDiv = document.createElement("div")
        newDiv.setAttribute("class", "newDiv")
        newDiv.setAttribute("name", "index")
                   
        var newInput1 = document.createElement("input")
        newInput1.setAttribute("id", "latitude"+index)
        newInput1.setAttribute("type", "text")
        newInput1.setAttribute("value", " ")
        var newInput2 = document.createElement("input")
        newInput2.setAttribute("id", "longitude"+index)
        newInput2.setAttribute("type", "text")
        newInput2.setAttribute("value", " ")
        var newInput3 = document.createElement("input")
        newInput3.setAttribute("id", "placeName"+index)
        newInput3.setAttribute("type", "text")
        newInput3.setAttribute("value", " ")      
        
        var removeInput = document.createElement("span")
        removeInput.setAttribute("class", "removeInput")
        removeInput.textContent = "지우자"
		
        
        	
        newDiv.append(newInput1)
		newDiv.append(newInput2)
        newDiv.append(newInput3)            
        newDiv.append(removeInput)
        testForm.append(newDiv)
        			
        index+=1
        console.log(newDiv);
        $("#showIndex").text(index)
    }) 
	
    $(document).on("click", ".removeInput", function () {
        $(this).parent(".newDiv").remove()
        resetIndex()
    })

    function resetIndex(){
        index = 0
        testForm.children('div').each(function (){
            var target = $(this).children(index)
            target.attr("id", "latitude"+index)
            target.attr("id", "longitude"+index)
            target.attr("id", "placeName"+index)
            index+=1
        })
        $("#showIndex").text(index)
    }

 $("#insertButton").trigger("click")
 $("#showIndex").text(index)       	
});

/* var idx = document.getElementsByName(index).length;
for(var i=0; i<idx.length; i++){
	if(idx[i].sourceIndex==obj.sourceIndex){
		var j=i;
	}
}
console.log(idx); */


$(document).ready(function(){
	$('#submit').click(function(event){
		event.preventDefault(); //원래 form의 기능인 submit를 ajax로 처리
		var data = $("#frm").serialize()
		/* 		var frm = $('frm');
		var idx = $("div[name='index']").length;
		console.log(idx);
		for(i=0; i < idx.length; i++){
		latitude = $('#latitude'+i).val();
		longitude = $('#longitude'+i).val();
		placeName = $('#placeName'+i).val();		
		}
 		console.log(latitude);
		console.log(longitude);
		console.log(placeName);
		// 선택한 값을 json 형태 자료로 생성
		var json = {
				latitude : latitude,
				longitude : longitude,
				placeName : placeName,
		};	 */	
		$.ajax({
			type : 'post',
			url : 'insertMap',
			contentType : 'application/json; charset=UTF-8',
			data : $("#frm").serialize(),
			dataType : 'json',
			success : function(data){			
			},
			error : function(){
				console.log('오류');
			}			
		});
	});
});



// ajax로 json 객체를 controller로 보내서 db 추가

/* $(document).ready(function(){
	$('#submit').click(function(event){
		event.preventDefault(); //원래 form의 기능인 submit를 ajax로 처리
		
		var frm = $('frm');
		var latitude = $('#latitude'+index).val();
		var longitude = $('#longitude'+index).val();
		var placeName = $('#placeName'+index).val();
		console.log(latitude);
		// 선택한 값을 json 형태 자료로 생성
		var json = {
				latitude : latitude,
				longitude : longitude,
				placeName : placeName,
		};
		
		// ajax로 json 객체를 controller로 보내서 db 추가
		$.ajax({
			type : 'post',
			url : 'insertMap',
			contentType : 'application/json; charset=UTF-8',
			data : JSON.stringify(json),
			success : function(data){			
			},
			error : function(){
				console.log('오류');
			}
		});
	});
}); */




/* $(document).ready(function(){
	$('#submit').click(function(event){
		event.preventDefault(); //원래 form의 기능인 submit를 ajax로 처리
		
		var frm = $('frm');
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
			success : function(data){			
			},
			error : function(){
				console.log('오류');
			}
		});
	});
}); */

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
	/* console.log(places); */

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), //새로운 빈 DocumentFragment 를 생성합니다. DocumentFragment 인터페이스는 부모가 없는 아주 작은 document 객체를 나타냅니다. 
    bounds = new kakao.maps.LatLngBounds(), //LatLngBounds - WGS84 좌표계에서 사각영역 정보를 표현하는 객체를 생성한다.
    										//WGS84 좌표계는 지심 좌표계인데 이것은 지구 타원체의 중심을 원점으로 하고 X, Y ,Z 방향의 축을 따라 좌표를 결정
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), //LatLng - WGS84 좌표 정보를 가지고 있는 객체를 생성한다.
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
              

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition); //extend() - 다수의 객체를 하나의 객체로 합치는 merge기능을 수행

        // 마커와 검색결과 항목에 click 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        (function(marker, title) {
        	//addListener(target, type, handler) - 다음 지도 API 객체에 이벤트를 등록한다. 
        	//target : 이벤트를 지원하는 다음 지도 API 객체, type : 이벤트 이름, handler : 이벤트를 처리할 함수
            kakao.maps.event.addListener(marker, 'click', function() { 
            	displayInfowindow(marker, title);            	
            });
        	                     
            itemEl.onclick =  function () {
                displayInfowindow(marker, title);                
            }; 
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl); //appendChild() - 새로운 노드를 해당 노드의 자식 노드 리스트(child node list)의 맨 마지막에 추가        
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0; //scrollTop - 현재 스크롤의 위치값

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds); //setBounds() - 주어진 영역이 화면 안에 전부 나타날 수 있도록 지도의 중심 좌표와 확대 수준을 설정한다.
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
    while (paginationEl.hasChildNodes()) { //Node.hasChildNodes() - 현재 노드(Node)에게 자식노드(child nodes)가 있는지를 Boolean 값으로 반환
        paginationEl.removeChild (paginationEl.lastChild); //removeChild() - DOM에서 자식 노드를 제거하고 제거된 노드를 반환
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





//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명을 표시합니다

//input에 insert하기 위한 index번호 생성
var index = 0
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
  
	$('#latitude'+index).val(marker.getPosition().getLat());
    $('#longitude'+index).val(marker.getPosition().getLng());
    $('#placeName'+index).val(title);
    index += 1 //index 번호 장소 선택 마다 1씩증가

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

	

</script>
</body>
</html>