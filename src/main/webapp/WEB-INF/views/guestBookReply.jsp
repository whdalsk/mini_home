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
    .gr_code{
    	display: none;
    }
    .parent2{
    	margin-bottom: 15px;
    }
</style>
</head>
<body>
	<div class="writeComment">
		<c:forEach var="mgr" items="${MGR}">
			<div id="parent2">${mgr.gr_writer} : ${mgr.gr_content}</div>
		</c:forEach>
		
		<div class="guestReply">
			<form action="guestBookReplyInsert.do">
				<textarea id="a2" class="commentText" name="gr_content" rows="10" cols="33" ></textarea>
				<button type="submit" style="position:relative; bottom: 28px; left: 20px;width: 60px; height: 60px" onclick="">확인</button>
				<input type="text" name="gr_code" class="gr_code" value="${idx}">
			</form>
		</div>
	</div>

</body>
</html>
