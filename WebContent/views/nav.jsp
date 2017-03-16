<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
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
</head>

<!-- nav (default) -->
<head>
<style>
.container {
    overflow: hidden;
    background-color: #333;
    font-family: Arial;
}

.container a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.dropdown {
    float: right;
    overflow: hidden;
}

.dropdown .dropbtn {
    cursor: pointer;
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
}

.container a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.show {
    display: block;
}
</style>
</head>

<!-- modal -->
<style>
.nav, h4, .close {
	background-color: #FFD700;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>

<li class="pull-right">
	<button class="btn" data-toggle="modal" data-target="#myModal">LOG
		IN</button>
</li>

	<!-- Trigger the modal with a button -->
	<!-- Modal -->
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
						<div class="modal-body" style="padding: 30px 45px;">
							<h1></h1>
							<form role="form" action="/join/result" method="post">
								<div class="form-group">
									<label for="id"><span class="glyphicon glyphicon-user"></span>
										이메일로 로그인하기</label> <input type="text" class="form-control" id="id"
										placeholder="이메일 주소">
								</div>
								<div class="form-group">
									<label for="pw"><span
										class="glyphicon glyphicon-eye-open"></span> 비밀번호</label> <input
										type="password" class="form-control" id="pw"
										placeholder="비밀번호">

									<div class="checkbox">
										<label><input type="checkbox" value="" checked>로그인상태
											유지 </label> <a href="#" class="pull-right">비밀번호찾기</a>
									</div>

								</div>

								<div align="center">
									<button type="submit" class="btn btn-warning btn-block">
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
						<div class="modal-body" style="padding: 30px 45px;">
							<h1></h1>
							<form role="form">
								<div class="form-group">
									<!--  이메일로 가입하기  -->
									<label for="id"><span class="glyphicon glyphicon-user"></span>이메일로
										가입하기</label> <input type="text" class="form-control" id="id" name="id"
										placeholder="이메일 주소"><br /> <input type="text"
										class="form-control" id="name" name="name"
										placeholder="이름(별명)"><br> <input type="password"
										class="form-control" id="pw" name="pw" placeholder="비밀번호">
								</div>

								<p>
									가입과 함께 Spoon Compass의 <a href=policy_service.jsp
										class="underline">서비스약관</a>과 <a href=policy_privacy.jsp
										class="underline">개인정보수집이용</a>에 동의하시게 됩니다.
								</p>
							</form>

							<div align="center">
								<button type="submit" class="btn btn-warning btn-block"
									id="join_btn">가입하기</button>
							</div>
						</div>

					</div>

					<!-- tab-pane -->
					<!-- 
						<h2>Dynamic Tabs</h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
    <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    
    
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    
    
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
     -->


					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> 취소
						</button>

					</div>
				</div>

			</div>
		</div>

	</div>
</body>
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
	var naver_id_login = new naver_id_login("RiHbbkwWnQhprjXrVbi3",	//
			"http://192.168.56.1/SpoonCompass/views/nav.jsp");		//돌아오는 url 
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
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		console.log("callback_status>>"+naver_id_login.callback_status);
		console.log("callback_message>>"+naver_id_login.callback_message);
		console.log("profileParams>>"+naver_id_login.profileParams );
		console.log("oauthParams>>"+naver_id_login.oauthParams);
		console.log("client_id>>"+naver_id_login.client_id );
		
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
		
	}

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	
	//=======================================
	this.get_naver_userprofile=function(callback_func1){
		$.ajax({
			url: "https://openapi.naver.com/v1/nid/getUserProfile.json?response_type=json",
			type:"GET";
			data:{"access_token":this.oauthParams.access_token},
			dataType: "jsonp",
			jsonp: "oauth_callback",
			success: function (result) {
				inner_profileParams.age = result.response.age;
				inner_profileParams.birthday  = result.response.birthday;
				inner_profileParams.email  = result.response.email;
				inner_profileParams.gender = result.response.gender;
				inner_profileParams.id = result.response.id;
				inner_profileParams.nickname = result.response.nickname;
				eval(callback_func1);
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status);
				alert(thrownError);
			}
			});
		}
	
}
var inner_profileParams = {};
		
		
		
</script>
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->