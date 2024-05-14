<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>home_right</title>
	<style>
		body{
			flex-direction: column;
			width:830px;
		}
		#updated{
			width:96%;
			margin-left:2%;
			height:150px;
			flex-direction: row;
			display:table;
		}
		#miniroom{
			width:92%;
			margin-left:2%;
			height:400px;
			padding-left:4%;
			margin-bottom:7%;
		}
		#friendsSay{
			width:92%;
			margin-left:2%;
			height:200px;
			padding-left:4%;
		}
		#lists{
			width:47%;
			height:100%;
			flex-direction: row;
			padding-left:4%;
			display:table-cell;
		}
		#figures{
			width:47%;
			height:100%;
			flex-direction: row;
			padding-left:2%;
			display:table-cell;
		}
		#title{
			color:#298FA6;
			font-weight: bolder;
			font-size:20px;
		}
		#photo{
			color:white;
			font-size:15px;
			background-color: #D92525;
			border-radius:5px;
		}
		#diary{
			color:white;
			font-size:15px;
			background-color:#000f96;
			border-radius: 5px;
		}
		span{
			font-size:17px;
		}
		img{
			width:100%;
			height:100%;
		}
		#inputdiv{
			width:96%;
			height:50px;
			display:flex;
			align-items: center;
			justify-content: center;
			background-color:#dadada;
			border: 1px solid #A6A6A6;
			border-radius: 2px;
		}
		#showdiv{
			width:96%;
			height:100px;
		}
		form{
			width: 560px;
		}
		input{
			width:500px;
		}
		ul{
			padding:0;
		}
		li{
			list-style-position: inside;
			border-bottom:1px solid #A6A6A6;
			margin-bottom: 2%;
			padding-bottom: 1%;
		}
	</style>
	<script type="text/javascript">
		function ilchonBtn() {
			var content = document.getElementById("onelinesay").value;
			if(content==null || content==""){
				alert("내용을 입력해주세요.");
				return;
			}
			document.ilchonForm.submit();
		}//end
	</script>
</head>
<body>
	<text id="title" style="padding-left:6%">Updated news</text>
	<div id="updated">
		
		<div id="lists">
			<div style="background-color:#A6A6A6; width:90%; height:1px; margin:5px 0px 5px 0px"></div>
			<span id="photo">사진첩</span>
			<span>[스크랩] 나라는 사람은</span><br>
			<span id="diary">다이어리</span>
			<span>김예리가 올린 다이어리</span><br>
			<span id="diary">다이어리</span>
			<span>김예리가 올린 다이어리</span><br>
			<span id="photo">사진첩</span>
			<span>변영화가 올린 사진</span>
		</div>
		<div id="figures">
			<div style="background-color:#A6A6A6; width:90%; height:1px; margin:5px 0px 5px 0px;"></div>
			<span>다이어리</span>
			<span style="padding-left:2%">2/64</span>
			<span>사진첩</span>
			<span style="padding-left:2%">2/343</span><br>
			<div style="background-color:#A6A6A6; width:90%; height:1px; margin:5px 0px 5px 0px;"></div>
			<span>방명록</span>
			<span style="padding-left:2%">0/126</span>
			<div style="background-color:#A6A6A6; width:90%; height:1px; margin:5px 0px 5px 0px;"></div>
		</div>
	</div>
	<div id="miniroom">
		<text id="title">Miniroom</text>
		<div style="border:2px solid #A6A6A6;width:96%; height:100%;">
		<!-- <img src="resources/images/미니룸.jpg"> -->
		<img src="resources/images/${dto.h_room_img}">
		</div>
	</div>
	
	<!-- 일촌평 -->
	<div id="friendsSay">
		<text id="title">What friends say</text>
		<div style="background-color:#A6A6A6; width:96%; height:1px; margin:5px 0px 5px 0px;"></div>
		<div id="inputdiv">
			<text id="title" style="padding:0 3% 0 1%">Friends say</text>
			<form name="ilchonForm" action="ilchonInsert.do">
				<input id="onelinesay" type="text" name="i_content">
				<button style="margin-left:2%" onclick="ilchonBtn()">확인</button>
			</form>
			
		</div>
		<div id="showdiv">
			<ul id="sayList">
				<c:forEach var="mi" items="${MI}">
					<li>${mi.i_content}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>