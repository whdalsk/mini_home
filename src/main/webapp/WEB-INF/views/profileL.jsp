<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html style="width:310px; padding-left: 10px">
<head>
	<title>hi</title>
<style>
	ul{
		list-style:none;
   		padding-left:0px;
	}
	ul img{
		width:20px;
		height:20px;
		margin-right: 10px;
	}
	h3{
		margin-top:40px;
		margin-bottom:0px;
		color:#298FA6;
	}
	#content li{
		padding-left:30px;
	}
</style>
</head>
<body style="width:310px">
<h3>Profile</h3><hr style="background-color:#298FA6;height:1px">
<ul>
	<li onclick="toggle()"><img src="resources/icons/person.png">내 소개</li>
	<ul id="content" style="display:none">
		<li style="padding-top: 10px;color:#298FA6">소개</li>
		<li>키워드</li>
		<li>히스토리</li>
	</ul>
	<hr><li><img src="resources/icons/group.png">내 인맥</li>
	<hr><li><img src="resources/icons/star.png">내 즐겨찾기</li><hr>
</ul>
<script>
	function toggle(){
            var show = document.getElementById("content");
            if (show.style.display==="block"){
                show.style.display="none";
            }
            else{
                show.style.display="block";
            }
        }
</script>
</body>
</html>