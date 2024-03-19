<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<%
	// 1. session 영역 안에 저장된 데이터 꺼내오기
	MemberVO mvo = (MemberVO) session.getAttribute("profile");
	%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> <a href="index.html"
			class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a> <nav>

		<c:if test="${profile != null}">
			<c:if test="${profile.userId == 'nknoh7' }">
				<a href="SelectTodoAll.do">Todolist관리</a>
				<a href="SelectAll.do">회원관리</a>
				<a href="Logout.do">로그아웃</a>
			</c:if>
			<c:if test="${profile.userId != 'nknoh7' }">
				<a href="SelectTodoAll.do">Todolist관리</a>
				<a href="goupdate.do">개인정보 수정</a>
				<a href="Logout.do">로그아웃</a>
			</c:if>
		</c:if> <c:if test="${profile == null }">
			<a href="#menu">로그인</a>
			<!-- 로그인 후 Logout.jsp로 이동할 수 있는'로그아웃'링크와 '개인정보수정'링크를 출력하시오. -->
		</c:if> </nav> </header>

		<!-- Menu -->
		<nav id="menu">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form action="Login.do" method="post">
				<li><input type="text" placeholder="userId을 입력하세요" name="userId"></li>
				<li><input type="password" placeholder="PW를 입력하세요" name="pw"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>회원가입</h5></li>
			<!-- 전송해야하는 데이터에 name값을 달아줄 때, DB table의 column명과 일치시키는 습관을 들이자!! -->
			<form action="Join.do" method="post">
				<li><input type="text" placeholder="이름을 입력하세요" name="userName"></li>
				<li><input type="text" placeholder="ID를 입력하세요" name="userId"></li>
				<li><input type="password" placeholder="PW를 입력하세요" name="pw"></li>
				<li><input type="text" placeholder="집주소를 입력하세요" name="address"></li>
				<li><input type="text" placeholder="이미지를 넣어주세요" name="userImg"></li>
				<li><input type="text" placeholder="이메일을 입력하세요" name="email"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
		</ul>
		</nav>
		<!-- Banner -->
		<section id="banner" class="major">
		<div class="inner">
			<header class="major"> <%
 if (mvo != null) {
 %>
			<h1><%=mvo.getuserId()%>님 환영합니다.
			</h1>

			<%
			} else {
			%>
			<h1>로그인 해주세요.</h1>
			<!-- 로그인 후 로그인 한 사용자의 세션아이디로 바꾸시오.
									 ex)smart님 환영합니다 --> <%
 }
 %> </header>
			<div class="content">
				<p>
					아래는 지금까지 배운 웹 기술들입니다.<br>
				</p>
				<ul class="actions">
					<li><a href="#one" class="button next scrolly">확인하기</a></li>
				</ul>
			</div>
		</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles"> <article> <span
				class="image"> <img src="images/pic01.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">HTML</a>
			</h3>
			<p>홈페이지를 만드는 기초 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic02.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">CSS</a>
			</h3>
			<p>HTML을 디자인해주는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic03.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Servlet/JSP</a>
			</h3>
			<p>Java를 기본으로 한 웹 프로그래밍 언어/스크립트 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic04.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">JavaScript</a>
			</h3>
			<p>HTML에 기본적인 로직을 정의할 수 있는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic05.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">MVC</a>
			</h3>
			<p>웹 프로젝트 중 가장 많이 사용하는 디자인패턴</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic06.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Web Project</a>
			</h3>
			<p>여러분의 최종프로젝트에 웹 기술을 활용하세요!</p>
			</header> </article> </section>
			<!-- Two -->
			<section id="two">
			<div class="inner">
				<header class="major">
				<h2>나에게 온 메세지 확인하기</h2>
				</header>
				<p></p>
				<ul class="actions">
					<li>로그인을 하세요.</li>
					<li><a href="#" class="button next scrolly">전체삭제하기</a></li>
				</ul>
			</div>
			</section>

		</div>

		<!-- Contact -->
		<section id="contact">
		<div class="inner">
			<section>
			<form action="userIdCheck.do">
				<div class="field half first">
					<label for="name">Name</label> <input type="text" id="name"
						placeholder="보내는 사람 이름" />
				</div>
				<div class="field half">
					<label for="userId">userId</label> <input type="text" id="userId"
						placeholder="보낼 사람 이메일" /> <span id="check"></span>

				</div>

				<div class="field">
					<label for="message">Message</label>
					<textarea id="message" rows="6"></textarea>
				</div>
				<ul class="actions">
					<li><input type="submit" value="Send Message" class="special" /></li>
					<li><input type="reset" value="Clear" /></li>
				</ul>
			</form>
			</section>

			<section class="split"> <section>
			<div class="contact-method">
				<span class="icon alt fa-envelope"></span>
				<h3>userId</h3>
				<a href="#">${profile.userId}</a>
				<!-- 로그인 한 사용자의 이메일을 출력하시오 -->

			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-phone"></span>
				<h3>Address</h3>
				<span>${profile.address}</span>
				<!-- 로그인 한 사용자의 전화번호를 출력하시오 -->
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-home"></span>
				<h3>Address</h3>
				<span>${profile.address}</span>
				<!-- 로그인 한 사용자의 집주소를 출력하시오 -->
			</div>
			</section> </section>
		</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		// 1. id값이 userId인 태그를 DOM 형식으로 가져와서 키보드 입력에 대한 이벤트 등록
		$("#userId").on("keyup", function() {
			// 2. id값이 userId태그 안에 들어있는 데이터 꺼내와서 객체 형태로 생성
			let userId = {
				"userId" : $("#userId").val()
			};
			// 3. 비동기통신을 사용해서 userId 확인 기능
			$.ajax({
				// url 지정
				url : "userIdCheck.do",
				// 보내줄 데이터 지정
				data : userId,
				// 성공했을 때 실행할 함수
				success : (res) => {
					console.log("전송완료",res);
					// $("#check").empty();
					if(res != "null"){	
						$("#check").html("<li>일치하는 데이터입니다.</li>");
						$("#check").css("color","green");
						// $("#check").append("<li style='color:green'>일치하는 데이터입니다.</li>");
					}else{
						$("#check").html("<li>일치하지않는 데이터입니다.</li>");
						$("#check").css("color","red");
						// $("#check").append("<li style='color:red'>일치하지않는 데이터입니다.</li>");
					//prepend append
				}},
				// 실패했을 때 실행할 함수
				error :() => {
					console.log("전송실패");
				}
			})
		})
	</script>

</body>
</html>

