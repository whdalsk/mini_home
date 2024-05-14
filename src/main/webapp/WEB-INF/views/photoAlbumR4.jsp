<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>

<script>
	
	const clickBtnComment = (num) => {

			const inputText = document.querySelector(`#commentText${num}`)
			const text = document.createElement('p')
			const parent = document.querySelector(`#comment${num}`)

			const addSpace = document.querySelector('#picToPicSpace')
			const space = document.createElement('div')

			if (inputText.value === '') {
				return
			}

			text.textContent = '익명인 : ' + inputText.value
			space.innerHTML = '<br><br>'

			parent.appendChild(text)
			addSpace.appendChild(space)

		}
</script>

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


</style>



</head>
<body>
	<br>
	<section>
		<div id="picDiv1" class="pic"> <!--사진 시작-->

			<div class="picInfo"> <!--사진 제목-->

				<p class="inToblock" style="position: relative; left: 40%; top: 1%;"> [스크랩] 나라는 사람은</p>

				<button type="button" style="position: relative; left: 67%; top: 1%;">
					주소복사
				</button>

			</div>

			<div class="picWho"> <!--사진 정보-->
				<span>변영화</span>
				<span style="position: relative; left: 69%">2021.02.02 01:27   스크랩: 0</span>
			</div>

			<div> <!--사진-->
				<img src="resources/images/pic6.jpg">
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
					<span>수정</span>
					<span>|</span>
					<span>이동</span>
					<span>|</span>
					<span>삭제</span>
					<span>|</span>
					<span>보내기</span>
				</span>
			</div>

			<div id="comment1" class="comment" style="padding: 1%"> <!--댓글-->
				<p>김예리 : 징쨔..짜증나~옹니 네이트온행!!</p>
				<p>부정빈 : 퍼가요~❤</p>
			</div>

			<div> <!--댓글 등록-->
				<form style="text-align: center;">
					댓글 <input id="commentText1" type=“text” size=“1000” value="">
					<button type="button"  onclick="clickBtnComment(1)">저장</button>
				</form>
			</div>

		</div> <!--사진 끝-->

		<!--------------------------------------------------------->
		<div id="picToPicSpace">
			
		</div>

		<div id="2" class="pic"> <!--사진 시작-->

			<div class="picInfo"> <!--사진 제목-->
				<p class="inToblock" style="position: relative; left: 40%; top: 1%;"> [스크랩] 나라는 사람은</p>
			</div>

			<div class="picWho"> <!--사진 정보-->
				<span>변영화</span>
				<span style="position: relative; left: 69%">2021.02.02 01:27   스크랩: 0</span>
			</div>

			<div> <!--사진-->
				<img src="resources/images/pic4.jpg">
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
					<span>수정</span>
					<span>|</span>
					<span>이동</span>
					<span>|</span>
					<span>삭제</span>
					<span>|</span>
					<span>보내기</span>
				</span>
			</div>

			<div id="comment2"class="comment" style="padding: 1%"> <!--댓글-->
				<p>김예리 : 퍼가요~❤</p>
				<p>부정빈 : 퍼가요~❤</p>
			</div>

			<div> <!--댓글 등록-->
				<form style="text-align: center;">
					댓글 <input id="commentText2" type=“text” size=“1000” value=" ">
					<button type="button" onclick="clickBtnComment(2)">저장</button>
				</form>
			</div>

		</div> <!--사진 끝-->





	</section>



</body>
</html>
