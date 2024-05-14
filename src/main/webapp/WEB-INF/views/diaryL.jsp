<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diary_left</title>
    <style>
        .body{
            width:316px;
        }
        li{
            list-style-image: url("../../icons/folder.png");
        }
        a{
            text-decoration: none;
            color:black;
        }
        #content{
            display:none;
        }
    </style>
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
</head>
<body>
    <div class="body">
        <h3 style="color:#298FA6">
            DIARY
        </h3>
        <hr>
        <ul class="nav">
            <li><a id="1" onclick="toggle();changeToBold(1)" href="diaryR.do" target=rightIf>내 다이어리</a></li>
            <ul id="content">
                <li><a id="2" href="diary_R2.do" target=rightIf onclick="changeToBold(2)">일기장</a></li>
                <li><a id="3" href="diary_R3.do" target=rightIf onclick="changeToBold(3)">끄적끄적</a></li>
            </ul>
            <li><a id="4" href="diary_R4.do" target=rightIf onclick="changeToBold(4)">교환일ㄱi..</a></li>
        </ul>
    </div>
</body>
</html>