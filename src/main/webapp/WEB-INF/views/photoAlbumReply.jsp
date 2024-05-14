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
	
	.picInfo {
	
	}
	
	.pic {
		width: 800px;
		height: 800px;
	}
	
	.picInfo {
		background-color: #EAEAEA;
		padding: 0.03%
	}
	
	.picWho {
		margin: 0.03%;
		padding: 0.5%
	}
	
	.inToblock{
		display: inline-block;
	}
	
	img { 
		display: block;
		margin: 0px auto;
		margin-top: 2%;
	}
	
	.comment {
		background-color: #EAEAEA;
		margin: 3%
	}
	
	.everyBtn {
		color: #BC8E5E;
	}
 	#calendar{
        width:100%;
        
        margin-top:2%;
        border:2px solid #A6A6A6;
        border-radius: 5px;
    }
    
    .newContent{
        padding-left:7%;
    }
    .title{
        padding-left:9%;
    }
    .title>textarea{
        margin-left: 5%;
    }
    .pr_code{
    	display: none;
    }
</style>
</head>
<body>

	<div class="comment" style="padding: 1%"> <!--댓글-->
		<c:forEach var="mpr" items="${MPR}">
			<p>${mpr.pr_writer} : ${mpr.pr_content}</p>
		</c:forEach>
	</div>

	<div> <!--댓글 등록-->
		<form style="text-align: center;" action="photoAlbumReplyInsert.do">
			댓글 <input id="commentText1" name="pr_content" type="text" size=“1000”>
			<input type="text" class="pr_code" name="pr_code" value="${idx}">
			<button type="submit"  onclick="">저장</button>
		</form>
	</div>

</body>
</html>
