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
		<form name="photoForm" method="post" enctype="multipart/form-data" action="photoInsert.do">
			<div id="calendar">
			<table>
				<tr class="title">
					<td width=64px>
	          			<text style="font-size:15px;font-weight: bolder;">제 목  </text>
					</td>
					<td>
	          			<textarea id="diarytitle" name="p_title" rows="1" cols="70" minlength="1"></textarea>
					</td>
				</tr>
				<tr class="newFile">
					<td>
	        			<text style="font-weight: bolder;font-size: 15px;;">파 일  </text>
					</td>
					<td style="text-align:left">
	          			<input type="file" class="insertFile" name="upload_f" id="upload_f" accept="image/*" onchange="readURL(this);">
					</td>
				</tr>
				<tr width=400px height=200px>
					<td></td>
					<td>
						<img id="preview" src ='resources/images/login.png' width="400px" height="300px"/>					
					</td>
				</tr>
				<tr class="newContent">
					<td style="vertical-align: top;">
	          			<text style="font-weight: bolder;font-size: 15px;;">내 용  </text>
					</td>
					<td>
	          			<textarea id="diarycontent" name="p_content" rows="5" cols="70"></textarea>
	          			<br>
	          			<input type="button" class="insertBtn" value="등록하기" onclick="insertBtn()">
					</td>
				</tr>

        <input type="text" name="p_name" class="p_name" value="${cyw}">
     	</table>
    	</div>	<!-- #calendar END -->
   	</form>
	</section>

</body>
</html>
