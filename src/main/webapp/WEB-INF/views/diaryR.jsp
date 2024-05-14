<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diary_right</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script>  
    const pagename = $(location).attr('pathname').split("/").pop().split(".")[0];
    let cnt = 0;   
	console.log(pagename);
</script>
	
    <style>
        body {
            width: 843px;
            display: flex;
            align-items: center;
            flex-direction: column;
        }

        #calendar {
            width: 90%;

            margin-top: 2%;
            border: 2px solid #A6A6A6;
            border-radius: 5px;
        }

        #plan {
            width: 90%;
            height: 50px;
            display: flex;
            align-items: center;
        }

        .diary {
            width: 90%;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid #A6A6A6;
            border-radius: 5px;
            margin-bottom: 3%;
        }

        #content {
            padding-top: 3%;
            width: 90%;
            height: 90%;
        }

        span {
            font-size: 18px;
            color: #298FA6;
            font-weight: bolder;
        }

        #essay {
            font-size: 20px;
            margin-top: 3%;
            margin-bottom: 5%;
        }

        .comment {
            background-color: #EAEAEA;
            padding-left: 1%;
            padding-top: 1%;
            margin-bottom: 1%;
            flex-direction: column;
        }

        #change {
            position: relative;
            left: 470px;
            background-color: white;
            border-radius: 5px;
        }

        .newContent {
            padding-left: 5%;
        }

        .title {
            padding-left: 9%;
        }

        .title>textarea {
            margin-left: 5%;
        }
        .container{
            width: 100%;
            padding-left: 80px;
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
	
</head>

<body>     
    <div id="plan" style="display: flex; justify-content: space-between; align-items: center;" >
    	<div>
    		<text style="color:#7a7a7a; font-size:18px;">일정</text> <br>
        	<text style="color:#A6A6A6">일정/기념일이 없습니다.</text>
    	</div>
        
        <a href="insert.do" style="border: 2px solid #A6A6A6;">글쓰기</a>
    </div>
    
    <div class="container">
        <c:forEach var="dir" items="${LG}">
    
    	<div class="diary" id="diary${dir.d_code}">
            <div id="content">
                <span>${dir.d_title}</span>
                <div id="essay">
                    ${dir.d_content}
                </div>
                <hr style="border-bottom:1px dashed #A6A6A6; border-top:none;">
                <div id="setting" style="display: flex; justify-content: space-between; align-items: center;">
				    <div>
				        <text style="font-size:22px; color:#A6A6A6">공개설정 : 전체공개</text>
				    </div>
				    <div class="modify ">
				        <a href="update_diary.do?d_code=${dir.d_code}&title=${dir.d_title}&content=${dir.d_content}">수정</a>
				        <a href="del_diary.do?d_code=${dir.d_code}">삭제</a>
				    </div>
				</div>
                <hr style="color:#EAEAEA">
                <div id="comment${dir.d_code}" class="comment">
                    <form class="write" action="writecmt.do" method="get">
                        <text>댓글 입력 : </text>
                        <input id="comt${dir.d_code}" type="text" name="cmt">
                        <input class="name" type="text" name="name" value="${cyw}" readonly="readonly"> <!-- value는 세션의 정보 사용 -->
                        <input class="code" type="number" name="code" value="${dir.d_code}" readonly="readonly">
                        <button type="submit">등록</button>
                        
                    </form>
                    <div id="cmtlist${dir.d_code }">
                    </div>
                </div>
            </div>
        </div>
     <script type="text/javascript">
     	console.log(++cnt);
     </script>
    </c:forEach>	
    </div>
    <table width="800"  border=1   cellspacing="0" class="myTable">
		    <tr align="center">
	  	 <td colspan="6">
	  	 <!-- 이전 -->
	  	 <c:choose>
		    <c:when test="${startpage>10}">
		        <a href="diaryR.do?idx=${startpage - 10 }">[이전]</a>
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
	  	 			<a href="diaryR.do?idx=${i}">[${i}]</a>
	  	 		</c:otherwise>
	  	 	</c:choose>
	  	 </c:forEach>
	  	 
	  	  <!-- 다음 -->
	  	  <c:choose>
		    <c:when test="${endpage < pagecount}">
		        <a href="diaryR.do?idx=${startpage + 10}">[다음]</a>
		    </c:when>
		    <c:otherwise>
		        <!-- 아무것도 하지 않음 -->
		    </c:otherwise>
		</c:choose>
	     </td>
	   </tr>   
	</table>
</body>
<script type="text/javascript">

let reply_list = [];
<c:forEach var="blist" items="${reply}" varStatus="status">
reply_list.push({num:"${blist.dr_num}",
		   writer:"${blist.dr_writer}",
		   content:"${blist.dr_content}",
		   code:"${blist.dr_code}"});
</c:forEach>

// console.log(list[0]['code']);
//<c:forEach var="item" items="${reply}">
//    var a = `<p>\${item.dr_writer} : \${item.dr_content} </p>
//    			<hr>`;
//    $(`#cmtlist\${item.dr_code}`).append(a);
//</c:forEach>

$(document).ready(function() {
	
	reply_list.forEach(function(arr) {
		const list = $(`#cmtlist\${arr['code']}`);
	    const plus = `<p>\${arr['writer']} : \${arr['content']} </p>
	    				<hr>`;
	    list.append(plus);  
	});
    //setTimeout(function() {
       // $('.name').each(function(index) {
       //     var input = $(this);
     //       setTimeout(function() {
      //          input.hide();
     //       }, (index + 1) * 1000); // 각 input 요소는 1초의 간격으로 숨겨집니다.
   //     });
  //  }, 1000);
     $('.write').each(function(event) {
         //해당 form 요소 내에서 .name 클래스를 가진 input 요소의 값을 확인
        var nameValue = $(this).find('.name').val();
         //값이 빈 문자열 또는 null이면
        if (nameValue === "" || nameValue === null) {
             //해당 form 요소 숨기기
            $(this).hide();
        }
    });
     
  //  $('.name').each(function(index) {
  //       $(this).delay(1 * index).fadeOut(); // 각 input 요소는 1초의 간격으로 숨겨집니다.
    	//$('.name').fadeOut();
   // });
   // $('.code').each(function(index) {
   //     $(this).delay(1 * index).fadeOut(); // 각 input 요소는 1초의 간격으로 숨겨집니다.
   	//$('.name').fadeOut();
  // });
});

const writecmt = (num) => {
    let a = $(`#comt\${num}`);
    const list = $(`#cmtlist\${num}`);
    const plus = `<p>익명인 : \${a.val()} </p>`;

	

    a.val('');
    list.append(plus);
}



function deldir(code){
	
	$("#diary" + code).attr("style", "display: none;"); //
	
	
	
}


const updir = (button) =>{
	//let parentDiv = $(button).closest('.diary');
    
	let title = parentDiv.find('#content span');
    let content = parentDiv.find('#content #essay');
    
    //let titleInput = $('<input>').attr({
    //    type: 'text',
    //    id: 'titleInput',
    //    value: title.text() // 현재 타이틀 텍스트를 기본값으로 설정합니다.
    //});
    
    //let contentTextarea = $('<textarea>').attr({
    //    id: 'contentTextarea',
    //    rows: '5', // 원하는 행 수로 조정합니다.
    //    cols: '50' // 원하는 열 수로 조정합니다.
    //}).text(content.text());
    
    //title.replaceWith(titleInput);
    //content.replaceWith(contentTextarea);
    
    
    // console.log("Title: ", title);
    // console.log("Content: ", content);
    
}
function newDiarywrite() {
    let title = $("#diarytitle").val();
    let content = $("#diarycontent").val();
	// console.log(title);
	// console.log(content);
    // let formData = new FormData();
    //formData.append("title", title);
    //formData.append("content", content);

    //fetch('/insert_diary', { method: "POST", body: formData, }).then((res) => res.json()).then((data) => {
	//
    //});
	
	cnt++;
    html_text = `
        <div id="diary\${cnt}" class="diary">
            <div id="content">
                <span>\${title}</span>
            <div id="essay">
                \${content} 
            </div>
            <hr style="border-bottom:1px dashed #A6A6A6; border-top:none;">
            <div id="setting">
                <text style="font-size:22px; color:#A6A6A6">공개설정 : 전체공개</text>
            </div>
            <hr style="color:#EAEAEA">
            <div id="comment\${cnt}" class="comment">
                <div id="write">
                    <text>댓글 입력 : </text>
                    <input id="comt\${cnt}" type="text" name="cmt">
                    <button onclick="writecmt(\${cnt})">등록</button>
                </div>
                <div id="cmtlist\${cnt}">

                </div>
            </div>
        </div>
    </div>`;

    //newDiary.innerHTML=title;
    $('.container').append(html_text);
    // let formData = new FormData();
    // formData.append("title", title);
    // formData.append("content", content);
    // formData.append("pagename", pagename);
    // fetch('/reply_save', { method: "POST", body: formData, }).then((res) => res.json()).then((data) => {

    // });
    
}
</script>
<style>
.name, .code{
	display: none;
	}
</style>
</html>