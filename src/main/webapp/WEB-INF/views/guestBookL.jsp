<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<style>
		body{
			width:316px;
			flex-direction: column;
		}
		#profile{
			display:flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
		}
		#today{
			display: flex;
			align-items: center;
			margin-top:15%;
			width:70%;
			height:35px;
			border:2px solid #A6A6A6;
			border-width: thin;
			border-radius:8px;
		}
		#photo{
			background-color: black;
			margin-top:3%;
			width:70%;
			height:250px;
			display: flex;
			text-align: center;
			justify-content: center;
		}
		#info{
			margin-top:5%;
			width:70%;
			height:160px;
			display:flex;
			justify-content: center;
			align-items: center;
			align-content: center;
		}
		#profileMenu{
			margin-top: 5%;
			display:flex;
			align-items: flex-end;
			width:70%;
			height:26px;
		}
		#psyworldInfo{
			display:flex;
			flex-direction: column;
			align-self: flex-start;
			justify-content: flex-end;
			width:70%;
			height:100px;
			margin-left:15%;
		}
	</style>
</head>
<body>
	<div id="profile">
		<div id="today">
			<text style="color:#298FA6; font-weight: bold; padding-left:3%;">TODAY IS...</text>
		</div>
		<div id="photo">
			<img src="resources/images/${dto.h_img}" width="100%">
		</div>
		<div id="info">
			<text>${dto.h_content}</text>
		</div>
		<span id="profileMenu">
			<text style="color:#298FA6">▶</text><text style="font-size:12px; font-weight: bold;">EDIT</text>
			<text style="color:#298FA6">▶</text><text style="font-size:12px; font-weight: bold;">HISTORY</text>
			<text style="padding-left:35%; color:#A6A6A6">▲</text>
			<text style="color:#A6A6A6">▼</text>
		</span>
		<hr style="width:70%">
		<div id="psyworldInfo">
			<text style="font-size:19px; color:#000f96; font-weight: bolder;">싸이월드</text>
			<text style="font-size: 12px; color:#E66E28">frontend@psyworld.com</text>
		</div>
	</div>

</body>
</html>