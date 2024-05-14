<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<style>
	body{ /*container*/
           width:843px;
           display: flex;
           align-items: center;
           flex-direction: column; /*위에서 아래*/
       }

       textarea {
       	resize: none;
       	/*height: 160px;*/
       }

       textarea:focus {
       	outline: none; /*눌렀을 때 굵어지는 거 없앰*/
       }

       .inputText {
       	border: 1px solid #AAABAD;
       	width: 580px;
       	height: 160px;
       }

	.guest {
		width: 800px;
	}

	.topBtn {
		width: 800px;
		height: 20px;
		margin-top: 1%;
	}

	#writing {
		width: 800px;
		height: 220px;
		background-color: #EBEBEB;
		border-top: 1px solid #AAABAD;
		border-bottom: 1px solid #AAABAD;
	}

	.guestBookImg {
		width: 165px;
		height: 165px;
	}

	#writingImgAndText {
		position: relative;
		top : 8%;
		left: 3%;
	}

	.writed {
		width: 800px;
		height: 500px;
	}

	.writedInfo {
		width: 800px;
		height: 20px;
		background-color: #EBEBEB;
		border-top: 1px solid #AAABAD;
		margin-top: 7%;

		padding: 2% 0;
	}

	.writedImgAndText {
		width: 800px;
		height: 200px;
		padding: 3%;
	}

	.writeComment {
		width: 765px;
		/*height: 70px;*/
		background-color: #EBEBEB;

		padding: 2% 2%;
	}

	.writedText {
		border: 0px;
		width: 580px;
		height: 160px;
	}

	.commentText {
		border: 1px solid #AAABAD;
		height: 60px;
		width: 650px;
		margin-left: 3%
	}
	.page{
    	width: 300px;
    	margin: 0 auto;
    	text-align: center;
    }
    .page a{
    	font-weight: bold;
    }
    .g_name{
    	display: none;
    }
    #spaceOf{
    	margin-bottom: 40px;
    }
</style>
<script type="text/javascript">
	function insertBtn() {
		var content = document.getElementById("innerGuest").value;
		
		if(content==null || content==""){
			alert("내용을 입력해주세요");
			return;
		}//end
		document.guestBookForm.submit();
	}//end

	function guestDeleteCheck() {
		return confirm("게시물을 삭제하시겠습니까?");
	}//end
</script>
</head>
<body id="body">
	
	<div id="writeNode">
		<!--1. 상단 버튼-->
		<div class="topBtn" style="margin-bottom: 2%">
			<button type="button" style="position: relative; float: right;">방명록관리</button>
			<button type="button" style="position: relative; float: right; margin-right: 1%">글꼴설정</button>
		</div>
		<br>
		<!--2. 방명록 쓰는 칸-->
		<div id="writing">
			<form name="guestBookForm" action="guestInsert.do">
				<div id="writingImgAndText">
					<img class="guestBookImg" src="resources/images/guestBook.png">
					<input type="text" name="g_name" class="g_name" value="${cyw}">
					<textarea id="innerGuest" class="inputText" name="g_content" rows="10" cols="33" ></textarea>
				</div>
				<br>
				<button type="button" style="position: relative; float: right; margin-right: 3%" onclick="insertBtn()">확인</button>
			</form>
		</div>
	</div>
		
	<!-- 방명록 리스트 -->
	<c:forEach var="mg" items="${MG}">
	<div id="b2" class="writed">
		<div class="writedInfo"> <!--쓴 사람 정보-->
			<span style="margin-left: 2%"> No.${mg.rn}</span>
			<span style="margin-left: 2%; color: #15336F">${mg.g_name}</span>
			<img src="resources/images/home.png" style="width: 16px;height: 16px; margin-left: 1px;">
			<span style="margin-left: 10px; color: #AAABAD" >(<fmt:formatDate value="${mg.g_wdate}" pattern="yyyy.MM.dd hh:mm"/>)</span>
			
			<span style="float: right; margin-left: 5px; margin-right: 5px">신고</span>
			<span style="float: right; margin-left: 5px;">|</span>
			<span style="float: right; margin-left: 5px;"><a href="guestDelete.do?idx=${mg.g_code}" onclick="return guestDeleteCheck()">삭제</a></span>
			<span style="float: right; margin-left: 5px;">|</span>
			<span style="float: right;">비밀로 하기</span>
		</div>

		<div class="writedImgAndText"> <!--쓴 내용--> 
			<img class="guestBookImg" src="resources/images/profile2.png">
			<textarea class="writedText" name="writedText" rows="10" cols="33" readonly>${mg.g_content}</textarea>
		</div>
		
		<!--댓글-->
		<c:import url="http://localhost:9090/mini/guestBookReply.do">
			<c:param name="idx" value="${mg.g_code}"></c:param>
		</c:import>
		
	</div>
	</c:forEach>
	<!-- 방명록 리스트 끝 -->	
	<div id="spaceOf"></div>
	
	<div class="page">
		<!-- Previous -->
		<c:if test="${startpage>1}">
			<a href="guestBookR.do?keyfield=${skey}&keyword=${sval}&idx=${startpage-1}" style='font-size: 14px;'>[이전]</a>
		</c:if>
		
		<!-- Page Number -->
		<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
		 	<c:choose>
		 		<c:when test="${i==pageNUM}"><font style='color: red; font-weight: bold;'>[${i}]</font></c:when> 
		 		<c:otherwise><a href="guestBookR.do?idx=${i}">[${i}]</a></c:otherwise>
		 	</c:choose>
		</c:forEach>
		
		<!-- Next -->
		<c:if test="${endpage<pagecount}">
			<a href="guestBookR.do?keyfield=${skey}&keyword=${sval}&idx=${startpage+10}" style='font-size: 14px;'>[다음]</a>
		</c:if>
	</div>
</body>
</html>
