<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>cyworld main</title>
</head>
<body>
    <div class="wrap">
        <header id="header">
            <div class="svcwrap">
                <div class="go-main">
                    <a href="index.jsp">싸이월드 메인가기</a>
                </div>
                <ul class="more_svc">
               		<!-- 로그아웃 표시 추가 완료 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
               		<c:if test="${cyw == null}">	<!-- 로그인X 상태 -->
						<li class="main_list_item"><a href="login.do">로그인</a></li>	
					</c:if>
					
					<c:if test="${cyw != null}">	<!-- 로그인 상태 -->
						<li class="main_list_item"><a href="logout.do">로그아웃</a></li>	
					</c:if>
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
                    <li>
                    	<a href="index.jsp" class="menu-list-item">
                        	<img src="resources/img/img-cyworld_logo.png" alt="" width="250" height="80">
                    	</a>
                    </li>
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

        <div class="main-container">
            <section class="section page1">
                <div class="contents">
                    <div class="txtbox">
                        <h3 class="tit">함께하는 일이 쉬워진다<br>
                            싸이월드
                        </h3>
                        <div class="subtit">
                            편리함은 기본, 새로운 모습으로 변신한
                            <br>
                            미니홈피를 만나보세요.
                        </div>
                        <div class="downlink">
                            <a href="#">
                                <img src="resources/img/btn-windows.png" alt="">
                            </a>
                            <a href="#">
                                <img src="resources/img/btn-mac.png" alt="">
                            </a>
                            <a href="#">
                                <img src="resources/img/btn-google.png" alt="">
                            </a>
                            <a href="#">
                                <img src="resources/img/btn-appstore.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="imgbox">
                        <div class="imgcnt">
                            <div>
                                <img src="resources/img/img-cyworld_open_3.png" width="1000" height="600" alt="">
                            </div>
                            <div>
                                <img src="resources/img/img-cyworld_open_2.png" width="1000" height="600" alt="">
                            </div>
                            <div>
                                <img src="resources/img/img-cyworld_open_1.png" width="1000" height="600" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section page2">
                <div class="contents">
                    <div class="bx-slider">
                        <div class="bx-slider-item">
                            <div class="bx-imgbox">
                                <img src="resources/img/img-cyworld_ilchon.png" width="350" height="600" alt="">
                            </div>
                            <divn class="bx-txtbox">
                                <br>
                                <div class="bx-subtit">
                                    국내 통신을 대체하는 연락수단의 1순위
                                </div>
                                <h3 class="bx-tit">
                                    오래전 멀리 이사가거나 이민가서 갑자기 연락이 끊긴 친구들을 찾을 수 있는 기회
                                    <br>
                                    가깝진 않지만 바빠서 서로 연락이 힘든 친구들끼리의 간편한 커뮤니티 
                                </h3>
                                <div class="bx-disc">
                                    빠르고 간편한 일촌맺기
                                    <br>
                                    개인정보와 게시물을 안전하게 보호하고 나의 친구들에게만 알려주고 싶은 것이 있는 사람들의
                                    <br>
                                    필수적인 과정
                                </div>
                            </div>
                        </div>
    
                        <div class="bx-slider-item">
    
                        </div>

                    </div>

                </div>
            </section>
            <section class="section page3">
                <div class="contents">
                    <div class="pcsvc-txtbox">
                        <h3>
                            일상생활의 소통공간,
                            <br>
                            국내 최고의 커뮤니티
                        </h3>
                        <div class="pcsvc-subtit">
                            내 친구인지 확인할 수 있는 프로필, 매일 일상을 공유할 수 있는 다이어리
                            <br>
                            새로운 음악이 나오면 공유할 수 있는 쥬크박스, 나의 개성을 뽐낼 수 있는 공간 미니룸
                            <br>
                            소중한 추억을 저장할 수 있는 사진첩, 중요한 정보를 공유할 수 있는 게시판
                            <br>
                            연락이 잘 되지 않는 친구에게 안부를 물을 수 있는 방명록, 즐겨찾는 사이트를 저장할 수 있는 즐겨찾기
                            <br>
                            사진 도용과 불펌 금지를 위하여 권한을 설정할 수 있는 관리 페이지까지
                        </div>
                    </div>
                    <div class="pcsvc-imgbox">
                        <img src="resources/img/img-cyworld_tap.png" width="254" height="800" alt="">
                    </div>
                </div>
            </section>

            <section class="section page4">
                <div class="contents">
                    <div class="prj-txtbox">
                        <h3>
                            미니홈피 외 즐겨찾는 사이트
                            <br>
                            싸이클럽(cyclub), 네이트판(natepan), 네이트온(nateon)
                        </h3>
                    </div>
                    <ul class="prjwrap">
                        <li>
                            <img src="resources/img/img-cyworld_club.png" alt="">
                            <div class="prjtit">
                                전국단위의 친목
                                <br>
                                간편한 접근성
                            </div>
                            <div class="prjsubtit">
                                연령별, 취미별, 주제별로 모임을 만들 수 있고,
                                <br>
                                가입이 허용된 멤버들끼리 활동할 수 있어요.
                            </div>
                        </li>
                        <li>
                            <img src="resources/img/img-cyworld_natepan.png" alt="">
                            <div class="prjtit">
                                우리들의 고민상담
                            </div>
                            <div class="prjsubtit">
                                가까운 친구들에게는 말하지 못하는
                                <br>
                                가족에게도 오픈할 수 없는 일들
                                <br>
                                여러 사람들의 생각과 의견이 궁금할 때
                                <br>
                                빠르고 쉽게 답을 찾을 수 있어요.
                            </div>
                        </li>
                        <li>
                            <img src="resources/img/img-cyworld_nateon.png" alt="">
                            <div class="prjtit">
                                내 친구목록을 한 눈에
                            </div>
                            <div class="prjsubtit">
                                간단한 대화를 주고받는 쪽지 기능과,
                                <br>
                                실시간 대화기능이 있어요.
                                <br>
                                동시에 여러사람과 소통해야 할 때
                                <br>
                                신속하게 연락할 수 있어요.
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
            <!--<section class="section page5">
                <div class="contents">
                </div>
            </section>-->
            <section class="section page6">
                <div class="contents">
                    <div class="with-txtbox">
                        <h3>
                            내가 있는 어떤 곳이라도, 싸이월드와 함께
                        </h3>
                        <div class="with-subtit">
                            최근에 주고 받은 기록을 언제든 확인할 수 있어요.
                        </div>
                    </div>
                    <ul class="downloadlist">
                        <li>
                            <div class="downtit">PC 다운로드</div>
                            <a href="#">Windows</a>
                            <a href="#">Mac OS</a>
                            
                        </li>
                        <li>
                            <div class="downtit">APP 다운로드</div>
                            <a href="#">Android</a>
                            <a href="#">iOS</a>
                            
                        </li>
                        <li>
                            <div class="downtit">웹 메신저</div>
                            <a href="#" class="go">바로 실행하기</a>
                            
                        </li>
                    </ul>
                </div>
            </section>
        </div>

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