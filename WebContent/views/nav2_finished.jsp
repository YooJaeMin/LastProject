<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<link href='//fonts.googleapis.com/css?family=Coming Soon'
	rel='stylesheet'>
</head>
<style>
#nav_body {
	font-family: 'Coming Soon';
	font-size: 20px;
}
</style>


<div id="nav_body" data-spy="scroll" data-toggle=".navbar" data-offset="50">

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			
			<ul class="nav navbar-nav">
				<li><a href="/"><span style="color: #ffd700;"><b>Spoon
								Compass</b></span></a></li>
				<li class="active">
					<a href="#home" data-toggle="tooltip" data-placement="bottom"title="홈">
					<b>HOME</b></a></li>
				<li><a href="#about" data-toggle="tooltip" data-placement="bottom"title="스푼컴파스 소개">
					<b>ABOUT</b></a></li>
				<li><a href="#contact" data-toggle="tooltip" data-placement="bottom" title="연락하기"><b>CONTACT</b></a>
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>MORE</b>
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/spoon_board/listAll" data-toggle="tooltip" data-placement="bottom"title="공지사항"><b>NOTICE</b></a></li>
						<li><a href="#" data-toggle="tooltip" data-placement="bottom"title="자주묻는 질문들"><b>FAQ</b></a></li>
						<li><a href="#" data-toggle="tooltip" data-placement="bottom"title="질문하기"><b>QnA</b></a></li>
					</ul>
				</li> 
				
				<c:if test="${sessionScope.auth ne  null }">
					<li><a href="#"><b>My List</b></a></li>
				</c:if>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="pull-right" data-toggle="tooltip" data-placement="bottom" title="로그인">
					<a class="glyphicon glyphicon-log-in"
					data-toggle="modal" data-target="#myModal"> 
					<c:if test="${sessionScope.auth ne  null }">
							<li><a href="/Mypage/info"><b>${sessionScope.auth_id}</b></a></li>
						</c:if>
				</a></li>

				<!-- Trigger the modal with a button -->
				<!-- Modal -->

			</ul>
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<ul class="nav nav-tabs">
							<!-- header 사이즈 -->
							<li class="active"><a data-toggle="tab" href="#login">LOG
									IN</a></li>
							<li><a data-toggle="tab" href="#member">회원가입</a></li>
						</ul>

						<!--tab contents -->
						<div class="tab-content">
							<!-- tab1 contents -->
							<div id="login" class="tab-pane fade in active">
								<div class="modal-body">


									<form role="form" method="post">
										<div class="form-group">
											<label for="id"><span
												class="glyphicon glyphicon-user"></span> 이메일로 로그인하기</label> <input
												type="text" class="form-control" id="id1"
												placeholder="이메일 주소">
										</div>
										<div class="form-group">
											<label for="pw"><span
												class="glyphicon glyphicon-eye-open"></span> 비밀번호</label> <input
												type="password" class="form-control" id="pw1"
												placeholder="비밀번호">

											<div class="checkbox">
												<label><input type="checkbox" value="" checked>로그인상태
													유지 </label> <a href="#" class="pull-right">비밀번호찾기</a>
											</div>

										</div>

										<div align="center">
											<button type="submit" id="member_id_login"
												class="btn btn-warning btn-block">
												<span class="glyphicon glyphicon-off"></span>로그인
											</button>
										</div>
										<br>
									</form>
									<button id="naver_id_login" type="submit"
										style="background: none; border: 0px;"></button>
									<p>아직 회원이 아니신가요? 지금 회원가입을 하시면 맛있는 프리미엄 기능이 제공됩니다.</p>
								</div>
							</div>

							<!-- 회원가입 tab -->
							<div id="member" class="tab-pane fade">
								<div class="modal-body">
									<form role="form">
										<div class="form-group">
											<!--  이메일로 가입하기  -->
											<label for="id"><span
												class="glyphicon glyphicon-user"></span>이메일로 가입하기</label> <input
												type="text" class="form-control" id="id2" name="id"
												placeholder="이메일 주소"><br /> <input type="text"
												class="form-control" id="name2" name="name"
												placeholder="이름(별명)"><br> <input
												type="password" class="form-control" id="pw2" name="pw"
												placeholder="비밀번호">
										</div>

										<p>
											가입과 함께 Spoon Compass의 <a href=policy_service.jsp
												class="underline">서비스약관</a>과 <a href="/WEB-INF/views/policy_privacy.jsp"
												class="underline">개인정보수집이용</a>에 동의하시게 됩니다.
										</p>
									</form>
									<div align="center">
										<button type="submit" class="btn btn-warning btn-block"
											id="join_btn">가입하기</button>
									</div>
								</div>

							</div>



							<div class="modal-footer">
								<button type="submit"
									class="btn btn-danger btn-default pull-left"
									data-dismiss="modal">
									<span class="glyphicon glyphicon-remove"></span> 취소
								</button>

							</div>
						</div>

					</div>
				</div>

			</div>

		</div>
	</nav>



</div>


<script>
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>

<!-- 네이버아디디로로그인 초기화 Script -->
<!-- naverLogn  -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("tsbCd7wyhckg0AQ8seVR",
			"http://192.168.10.21/"); //돌아오는 url 
	var state = naver_id_login.getUniqState();

	naver_id_login.setButton("green", 3, 40);
	//	naver_id_login.setDomain("http://192.168.10.26:8080/dddd/loginTest.jsp");		
	//service URL >> 여기서 로그인 서이스 제공 후 "돌아오는 URL로"  
	//로그인 하는쪽과 콜백하는 쪽이 다른경우 설정 (여기서는 없어도 됨)
	naver_id_login.setState(state);
	//	naver_id_login.setPopup();			// popup이 없으면 해당화면 내에서 콜백 유알엘로 
	//있으면 callback url인 팝업창이 띄어짐 
	naver_id_login.init_naver_id_login();
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->
<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<!-- // 네이버아이디로로그인 초기화 Script -->
<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		var email = naver_id_login.getProfileData('email'); //네이버 로그인 가입자의 유일키 id
		var nick = naver_id_login.getProfileData('nickname'); //네이버 로그인 가입자의 닉네임
		var age = naver_id_login.getProfileData('age');//구간으로 나옴 20-29 || 30-39
		var gender = naver_id_login.getProfileData('gender');//M||F로 나옴
		var birth = naver_id_login.getProfileData('birthday'); //단, 월-일까지만 나옴 임의로 년도는 2017년 정도를 붙여서 넣어놔야 할듯
		var profile = naver_id_login.getProfileData('profile_image'); //프로필 이미지가 저장된 src 출력됨
		console.log(email);

		$.ajax({
			"url" : "/join/naverJoin?",
			"method" : "post",
			"data" : {
				"email" : email,
				"nick" : nick,
				"age" : age,
				"gender" : gender,
				"birth" : birth,
				"profile" : profile
			}

		}).done(function(rst) {
			console.log(rst);
			var printRst = '';
			if (rst == 'yes') {
				printRst = '<h4 class="modal-title">회원가입에 성공하였습니다.</h4>';
			} else if (rst == 'chOk') {
				printRst = '<h4 class="modal-title">로그인에 성공하였습니다.</h4>';
			} else {
				printRst = '<h4 class="modal-title">로그인에 실패하였습니다.</h4>';
			}
			window.alert(printRst);
		});

	}

	$("#join_btn").click(function() {
		var id = $('#id2').val();
		var pw = $('#pw2').val();
		console.log(id);
		console.log(pw);
		var name = $('#name2').val();
		$.ajax({
			"url" : "/join/memberJoin?",
			"method" : "post",
			"data" : {
				"id" : id,
				"pw" : pw,
				"name" : name
			}
		}).done(function(rst) {
			var printRst = '';
			if (rst == 'succed') {
				printRst = '<h4 class="modal-title">회원가입에 성공하였습니다</h4>';
			} else {
				printRst = '<h4 class="modal-title">회원가입에 실패하였습니다.</h4>';
			}
			window.alert(printRst);
		});

	});

	$("#member_id_login").click(function() {
		var id = $('#id1').val();
		var pw = $('#pw1').val();
		console.log(id);
		console.log(pw);
		$.ajax({
			"url" : "/join/memberCheck?",
			"method" : "post",
			"data" : {
				"id" : id,
				"pw" : pw,
			}
		}).done(function(rst) {
			var printRst = '';
			console.log(rst);
			if (rst == 'succed') {
				printRst = '<h4 class="modal-title">로그인에 성공하였습니다</h4>';
			} else {
				printRst = '<h4 class="modal-title">로그인에 실패하였습니다.</h4>';
			}
			window.alert(printRst);
		});
	});

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	naver_id_login.setStateStore();
	console.log(+naver_id_login.getLocalStorageItemSafely());

	var inner_profileParams = {};
</script>
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->



