<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- css -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- js -->
<script src="resources/js/script.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	const hypenTel = (target) => {
		target.value = target.value
		  .replace(/[^0-9]/g, '')
		  .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}//end
</script>
<title>cyworld membership</title>
</head>
<body>
    <div class="wrap">
        <header id="header">
            <div class="svcwrap">
                <div class="go-main">
                    <a href="index.jsp">싸이월드 메인가기</a>
                </div>
                <ul class="more_svc">
                    <li class="main_list_item"><a href="login.do">로그인</a></li>
                    <li class="main_list_item"><a href="#">메일</a></li>
                    <li class="main_list_item"><a href="#">뉴스</a></li>
                    <li class="main_list_item"><a href="#">판</a></li>
                    <li class="main_list_item"><a href="#">TV</a></li>
                    <li class="main_list_item"><a href="#">톡톡</a></li>
                    <li class="main_list_item"><a href="#">툰앤북</a></li>
                    <li class="main_list_item"><a href="#">게임</a></li>
                    <li class="main_list_item"><a href="#">쇼핑</a></li>
                    <li class="main_list_item"><a href="#">더보기 +</a></li>
                </ul>
            </div>
            <div class="gnbwrap">
                <ul class="menu-list">
                    <li><a href="index.jsp" class="menu-list-item">
                        <img src="resources/img/img-cyworld_logo.png" alt="" width="250" height="80">
                    </a></li>
                    <li class="menu-list-item"><a href="main.do">미니홈피</a></li>
                    <li class="menu-list-item"><a href="#">도토리</a></li>
                    <li class="menu-list-item"><a href="#">기프티콘</a></li>
                    <li class="menu-list-item"><a href="#">내PC제어</a></li>
                    <li class="menu-list-item"><a href="#">부가서비스</a></li>
                </ul>
                <ul class="outlink">
                    <li class="outlink_item"><a href="#">공지사항</a></li>
                    <li class="outlink_item"><a href="#">고객센터</a></li>
                </ul>
            </div>
        </header>
              <!--이상 공통부문 삭제 금지-->
    </div>
        <body>
            <div class="wrap">
              <main>
                <div>
                  <h1><a href="signUp.do">싸이월드 회원가입</a></h1>
                  <form action="loginIdCommit.do">
                    <fieldset>
                        <label for="user_name" class="screen_out">이름</label>
                        <input
                          id="user_name"
                          type="text"
                          name="m_name"
                          placeholder="홍길동"
                        />
                      <label for="user_phone" class="screen_out">연락처</label>
                      <input
                        id="user_phone"
                        type="text"
                        name="m_phone"
                        placeholder="숫자로만 입력해주세요(01012345678)"
                        oninput="hypenTel(this)"
                        maxlength="13"
                      />
                      <input type="submit" value="찾기" />
                    </fieldset>
                    <ul>
                        <li><a href="signUp.do">회원가입</a></li>
                        <li><a href="loginPwd.do">비밀번호 찾기</a></li>
                      </ul>
                  </form>
                </div>
              </main>
              <br>
              <br>
              <br>

              <!--이하 공통부문 삭제 금지-->
              <footer>
                <div class="footer">
                    <div class="ftlink">
                        <a href="#">서비스약관</a>
                        <a href="#">개인정보처리방침</a>
                        <a href="#">청소년보호정책</a>
                        <a href="#">광고문의</a>
                        <a href="#">고객센터</a>
                    </div>
                    <div class="copyright">Copyright © Cyworld Communications All right reserved</div>
                </div>
            </footer>
            </div>
          </body>
        </html>
</body>
</html>
