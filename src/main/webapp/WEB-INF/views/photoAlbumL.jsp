<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<script>

		//클릭 된 폴더면 bold 다른 폴더로 넘어가면 다시 bold 해체 

		OBJECT_BOLD = null;　
		// 볼드체로 바뀐 객체를 기억해둘 변수.

	    function changeToBold(obj) {

	    	var objPic = document.getElementById(obj);

　　         objPic.style.fontWeight = "bold";

　    		if(OBJECT_BOLD) {　　// 이전 객체의 볼드 속성을 없앤다.
　　　 		   OBJECT_BOLD.style.fontWeight = "";
　     		}
　   		
			OBJECT_BOLD = objPic;　　// 현재 객체를 저장해 둔다.
		}


	</script>

	<style>
		header {
			width: 15%;
		}

		h3 {
			color: #8EBDC4;
		}

		ul li {
			list-style-image : url("resources/icons/folder.png");
			margin: 5px;
		}

		a {
			color : black;
			text-decoration: none;
		}

		a:active {
			
		}
	</style>

</head>
<body onload="changeToBold(1)">
	<header> <!--photo album 제목-->
		<h3>PHOTO ALBUM</h3>
		<hr>
	</header>

	<nav> <!--사진첩 폴더 목록-->
		<ul>
			<li><a href="photoAlbumR.do" target="rightIf" id="1" onclick="changeToBold(1)">좋은 시간</a>
			<li><a href="photoAlbumR2.do" target="rightIf" id="2" onclick="changeToBold(2)">좋은 사람들</a>
			<li><a href="photoAlbumR3.do" target="rightIf" id="3" onclick="changeToBold(3)">좋은 추억</a>
			<li><a href="photoAlbumR4.do" target="rightIf" id="4" onclick="changeToBold(4)">또 하나 알아간다..</a>
		</ul>
	</nav>

	<footer include-html="../다이어리/다이어리l.html"></footer>
</body>
</html>
