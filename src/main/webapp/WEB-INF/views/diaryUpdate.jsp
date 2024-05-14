<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta charset="UTF-8">
	<title>diary_update</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</head>
<style>	 
    .mypost {
        width: 95%;
        max-width: 500px;
        margin: 100px auto 20px auto;
	    box-shadow: 1px 1px 1px px rgb(225, 230, 252);
		background: #edf0f8;
        padding: 20px;
    }
    .mypost>button {
        margin-top: 15px;
	    
    }
    form{
    	margin-top: 200px;
    }
	button.upload {
		color: rgb(0, 0, 0);
		background-color: rgb(238, 238, 238);
		border-color: rgb(3, 1, 3);
		width: 225;
		height: 50;
	}
	button.rewrite {
		color: rgb(0, 0, 0);
		background-color: rgb(234, 233, 235);
		border-color: rgb(4, 2, 10);
		width: 225;
		height: 50;
	}
	#title{
		width: 100%;	
	}
	#content{
		width: 100%;
		resize: none;
	}
	#code{
		display: none;
	}
</style>
<body>
	<form class="mypost" id="diaryForm" action="update_diary_commit.do">
		 <div align="center" class="h4">
			 <h4>my diary's</h4>
		 </div>
		 <br>
	     <div class="title">
			 <label>제목</label>
	         <input type="text" id="title" name="title" placeholder="제목을 입력하세요." value="${title}"/>
	         <input type="text" id="code" name="code" value="${code}">
	     </div>
		 <br>
	     <div class="content">
			 <label>내용</label>
	         <textarea placeholder="내용을 입력하세요." id="content" name="content"
	             style="height: 200px">${content}</textarea>
	     </div>
	     <div>
			 <br>
	         <button type="submit" class="upload"><b>수정</b></button>
	 
	         <button type="reset" class="rewrite"><b>초기화</b></button>
	     </div>
	</form>
</body>
</html>