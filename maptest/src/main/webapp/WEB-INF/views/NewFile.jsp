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
</head>
<body>

	<form id="frm">
	</form>
	<button type="button" id="btn" value="btn"></button>
</body>

<script>
$(document).ready(function(){
	$("#btn").click(function(){
		function getInput(){
			var ip = document.getElementById('frm'),
			ipStr = '<input type="text id="latitude'+(index+1)+'" name="latitude" value=""/>' +
					'<input type="text id="longitude'+(index+1)+'" name="longitude" value=""/>' +
					'<input type="text id="placeName'+(index+1)+'" name="placeName" value=""/>';
			if(title != null){
				var index = 1
		        $('#latitude'+index).val(marker.getPosition().getLat());
				$('#longitude'+index).val(marker.getPosition().getLng());           
				$('#placeName'+index).val(title)
				index += 1
			}else{
				alter(장소를 다시 선택해주세요.);
			}
			
			ip.innerHTML = ipStr
		}
	});
});
</script>
</html>