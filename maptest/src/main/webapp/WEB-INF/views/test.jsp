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
<script>
    $(document).ready(function (){

        var testForm = $("#testForm")
        var index = 0

        $("#insertButton").on("click", function (){
            if(index == 5){
                alert("5개 까지만 됩니다.")
                return false;
            }

            var newDiv = document.createElement("div")
            newDiv.setAttribute("class", "newDiv")

            var newInput = document.createElement("input")
            newInput.setAttribute("id", "newInput"+index)
            newInput.setAttribute("id", "newInput"+index)
            newInput.setAttribute("type", "text")
            newInput.setAttribute("value", newInput.id)

            var removeInput = document.createElement("span")
            removeInput.setAttribute("class", "removeInput")
            removeInput.textContent = "지우자"

            newDiv.append(newInput)
            newDiv.append(removeInput)
            testForm.append(newDiv)

            index+=1
            $("#showIndex").text(index)

        })

        $(document).on("click", ".removeInput", function () {
            $(this).parent(".newDiv").remove()
            resetIndex()
        })

        function resetIndex(){
            index = 0
            testForm.children('div').each(function (){
                var target = $(this).children(index, 'input[type=text]')
                target.attr("id", "newInput"+index)
                target.attr("value", target.attr("id"))
                index+=1
            })
            $("#showIndex").text(index)
        }

        $("#readInputs").on("click", function () {
            var result = ""
            testForm.children('div').each(function (){
                var target = $(this).children(index, 'input[type=text]')
                result+=target.attr("id")+":"+target.val()+", "
            })
            alert(result)
        })



        $("#insertButton").trigger("click")
        $("#insertButton").trigger("click")
        $("#showIndex").text(index)

    });

</script>
<div>
    총 갯수 : <span id="showIndex"></span> / 5
</div>
<body>
    <span id="insertButton" style="font-size: larger">복사하기</span>
    <span id="readInputs" style="font-size: larger">읽기</span>
    <form id="testForm">
    </form>
</body>
</html>