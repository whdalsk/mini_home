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
		box-sizing: border-box;
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
    
	box-shadow: 1px 1px 1px px rgb(225, 230, 252);
	background: #edf0f8;
  }
    
  table {
  	text-align:center;
  	margin:10px auto;
  	border-spacing: 5px;
  }  
  table > tr {
  	padding-left:72px;
  	padding-right:10px;
  }

  .title{
    margin-top:10px;
    margin-bottom:5px;
    margin-left:72px;
    margin-right:30px;
  }
  .newFile{
    margin-top:5px;
    margin-bottom:5px;	
    margin-left:72px;
    margin-right:30px;
  }
  .newContent{
  	margin-top:5px;
    margin-bottom:10px;
    margin-left:72px;
  }
  input.insertBtn {
  	float:right;
	font-weight:bold;
	color: rgb(0, 0, 0);
	background-color: rgb(238, 238, 238);
	border-color: rgb(3, 1, 3);
	width: 100;
	height: 30;
  }

  .page{
  	width: 300px;
  	margin: 0 auto;
  	text-align: center;
  }
  .page a{
  	font-weight: bold;
  }
  .p_name{
  	display: none;
  }
</style>
<script type="text/javascript">
	function insertBtn() {
		var title = document.getElementById("diarytitle").value;
		var file = document.getElementById("upload_f").value;
		var content = document.getElementById("diarycontent").value;
		
		if(title==null || title==""){
			alert("제목을 입력해주세요");
			return;
		}//end
		if(file==null || file==""){
			alert("파일을 첨부해주세요");
			return;
		}//end
		if(content==null || content==""){
			alert("내용을 입력해주세요");
			return;
		}//end
		document.photoForm.submit();
	}//end
	
	function photoDeleteCheck() {
		return confirm("게시물을 삭제하시겠습니까?");
	}//end
	
	function readURL(input) {
   	  if (input.files && input.files[0]) {
   	    var reader = new FileReader();
   	    reader.onload = function(e) {
   	      document.getElementById('preview').src = e.target.result;
   	    };
   	    reader.readAsDataURL(input.files[0]);
   	  } else {
   	    document.getElementById('preview').src = "";
   	  }
   	}//end
</script>
</head>
<body>
	<br>
	<section>
		<div style="margin-bottom: 20px;">
			<a href="photoAlbumInsert.do" style="border: 2px solid #A6A6A6; float: right; color: black;">글쓰기</a>
		</div>
		<div style="clear: right;"></div>
		<c:forEach var="mp" items="${MP}">
		<div class="pic"> 
			<div class="picInfo"> <!--사진 제목-->
				<p class="inToblock" style="position: relative; left: 40%; top: 1%;">${mp.p_title}</p>
			</div>
			
			<div class="picWho"> <!--사진 정보-->
				<span>${mp.p_name}</span>
				<span style="position: relative; left: 69%"><fmt:formatDate value="${mp.p_wdate}" pattern="yyyy-MM-dd hh:mm"/>   스크랩: 0</span>
			</div>

			<div> <!--사진-->
				<!-- <img src="resources/images/1.jpg"> -->
				<img src ='${pageContext.request.contextPath}/resources/upload/${mp.p_img}' width=550 height=350 border=0> 
			</div>
			
			<div>
				<p class="inToblock" style="position: relative; left: 40%; top: 1%;">${mp.p_content}</p>
			</div>

			<div> <!--공개/비공개-->
				<hr style="border-style: dotted; border-color: #EAEAEA; margin: 2%">
				<p style="margin-left: 2%; color: #A3A3A3;">공개 설정 : 비공개</p>
				<hr style="border-style: dotted; border-color: #EAEAEA; margin: 2%">
			</div>

			<div class="everyBtn" style="margin-left: 2%"> <!--수정 등 버튼-->
				<span>메인등록</span>
				<span>|</span>
				<span>😊인물태그</span>
				<span>|</span>
				<span>스티커</span>

				<span style="margin-left: 45%">
					<span><a href="photoUpdate.do?p_code=${mp.p_code}&p_title=${mp.p_title}&p_img=${mp.p_img}&p_content=${mp.p_content}">수정</a></span>
					<span>|</span>
					<span>이동</span>
					<span>|</span>
					<span><a href="photoDelete.do?idx=${mp.p_code}" onclick="return photoDeleteCheck()">삭제</a></span>
					<span>|</span>
					<span>보내기</span>
				</span>
			</div>

			<!--댓글-->
			<c:import url="http://localhost:9090/mini/photoAlbumReply.do">
				<c:param name="idx" value="${mp.p_code}"></c:param>
			</c:import>

		</div>
		</c:forEach>
		
		<div class="page">
			<!-- Previous -->
			<c:if test="${startpage>1}">
				<a href="photoAlbumR.do?keyfield=${skey}&keyword=${sval}&idx=${startpage-1}" style='font-size: 14px;'>[이전]</a>
			</c:if>
			
			<!-- Page Number -->
			<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
			 	<c:choose>
			 		<c:when test="${i==pageNUM}"><font style='color: red; font-weight: bold;'>[${i}]</font></c:when> 
			 		<c:otherwise><a href="photoAlbumR.do?idx=${i}">[${i}]</a></c:otherwise>
			 	</c:choose>
			</c:forEach>
			
			<!-- Next -->
			<c:if test="${endpage<pagecount}">
				<a href="photoAlbumR.do?keyfield=${skey}&keyword=${sval}&idx=${startpage+10}" style='font-size: 14px;'>[다음]</a>
			</c:if>
		</div>
		
	</section>

</body>
</html>
