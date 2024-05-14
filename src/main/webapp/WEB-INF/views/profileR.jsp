<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html style="width:840px">
<head>
	<title>profile</title>
<style>
	@import url("https://fonts.googleapis.com/css2?family=Jua&display=swap");
	p{
		display: inline-block;
		position: absolute;
		font-size: 30px;
		margin-left: 20px
	}
	html,body{
		font-family: '돋움';
	}
	@keyframes boo{
		from {font-size:500%;color:blue;}
		to {font-size:1000%;color:green;}
	}
	.profile_pic {
	  width: 250px;
	  height: 500px;
	  object-fit: cover;
	}
</style>
</head>
<body style="width:840px">
<img src="resources/images/${p_dto.p_img}" class="profile_pic"></img>
<p><span style="color:#298FA6;font-size: 45px;font-weight: bolder">${p_dto.p_id}</span><br><br>${p_dto.p_content}</p>
</body>
</html>