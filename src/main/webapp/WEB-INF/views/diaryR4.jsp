<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diary_right</title>
    <style>
        body{
            width:843px;
            display:flex;
            align-items: center;
            flex-direction: column;
        }
        #calendar{
            width:90%;
            
            margin-top:2%;
            border:2px solid #A6A6A6;
            border-radius: 5px;
        }
        #plan{
            width:90%;
            height:50px;
            display: flex;
            align-items: center;
        }
        #diary{
            width:90%;
            display:flex;
            align-items: center;
            justify-content: center;
            border:2px solid #A6A6A6;
            border-radius: 5px;
            margin-bottom: 3%;
        }
        #content{
            padding-top: 3%;
            width:90%;
            height:90%;
        }
        span{
            font-size:18px;
            color:#298FA6;
            font-weight: bolder;
        }
        #essay{
            font-size:20px;
            margin-top:3%;
            margin-bottom: 5%;
        }
        .comment{
            background-color:#EAEAEA;
            padding-left:1%;
            padding-top:1%;
            margin-bottom:1%;
            flex-direction: column;
        }
        
        #change{
            position: relative;
            left:470px;
            background-color: white;
            border-radius: 5px;
        }
        .newContent{
            padding-left:5%;
        }
        .title{
            padding-left:9%;
        }
        .title>textarea{
            margin-left: 5%;
        }
        a {
        text-decoration: none; /* 밑줄 제거 */
        color: black; /* 색상 변경 */
   		 }
   		 a:hover {
		    color: #000; /* 마우스를 올렸을 때 링크 색상 */
		}
		.myTable {
	    border: none; /* 테이블의 border를 제거합니다 */
	    border-collapse: collapse; /* 셀 간의 간격을 제거합니다 */
		}
    </style>
    <script>
        const writecmt=(num)=>{
            const a = document.querySelector(`#comt${num}`);
			const list = document.querySelector(`#cmtlist${num}`);
            const plus=document.createElement('p');
			plus.innerHTML='익명인 : ' + a.value;
            list.appendChild(plus);
        }
        var cnt=3;
        function newDiarywrite(){
            var title=document.getElementById("diarytitle").value;
            var content=document.getElementById("diarycontent").value;
            var back=document.getElementById("body");
            var after=document.getElementById("diary");
            var newDiary=document.createElement("div");
            newDiary.setAttribute('id','diary')
            newDiary.innerHTML=`
            <div id="content">
            <span>${title}</span>
            <div id="essay">
                ${content}
            </div>
            <hr style="border-bottom:1px dashed #A6A6A6; border-top:none;">
            <div id="setting">
                <text style="font-size:22px; color:#A6A6A6">공개설정 : 전체공개</text>
            </div>
            <hr style="color:#EAEAEA">
            <div id="comment${cnt}">
                <div id="write">
                    <text>댓글 입력 : </text>
                    <input id="comt${cnt}" type="text" name="cmt">
                    <button onclick="writecmt(${cnt})">등록</button>
                </div>
                <div id="cmtlist${cnt}">
                
                </div>
            </div>
        </div>
            `
            //newDiary.innerHTML=title;
            back.insertBefore(newDiary,after);
            cnt++;
        }
    </script>
</head>
<body id="body">
	<div id="plan" style="display: flex; justify-content: space-between; align-items: center;" >
    	<div>
    		<text style="color:#7a7a7a; font-size:18px;">일정</text> <br>
        	<text style="color:#A6A6A6">일정/기념일이 없습니다.</text>
    	</div>
        
        <a href="insert.do" style="border: 2px solid #A6A6A6;">글쓰기</a>
    </div>

    <table width="800"  border=1   cellspacing="0" class="myTable">
		    <tr align="center">
	  	 <td colspan="6">
	  	 <!-- 이전 -->
	  	 <c:choose>
		    <c:when test="${startpage>10}">
		        <a href="diary_R4.do?idx=${startpage - 10 }">[이전]</a>
		    </c:when>
		    <c:otherwise>
		        <!-- 아무것도 하지 않음 -->
		    </c:otherwise>
		</c:choose>
	  	  
	  	 <c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
	  	 	<c:choose>
	  	 		<c:when test="${i==pageNum}">
	  	 			<font style='color:red;font-size:14pt;'> [${i}] </font>
	  	 		</c:when>
	  	 		<c:otherwise>
	  	 			<a href="diary_R4.do?idx=${i}">[${i}]</a>
	  	 		</c:otherwise>
	  	 	</c:choose>
	  	 </c:forEach>
	  	 
	  	  <!-- 다음 -->
	  	  <c:choose>
		    <c:when test="${endpage < pagecount}">
		        <a href="diary_R4.do?idx=${startpage + 10}">[다음]</a>
		    </c:when>
		    <c:otherwise>
		        <!-- 아무것도 하지 않음 -->
		    </c:otherwise>
		</c:choose>
	     </td>
	   </tr>   
	</table>

</body>
</html>