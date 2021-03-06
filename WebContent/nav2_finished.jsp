<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
  <link href='//fonts.googleapis.com/css?family=Coming Soon' rel='stylesheet'>
</head>
  <style>
  
 
body {
    font-family: 'Coming Soon';
    font-size: 18px;
}


.navbar-inverse {
     background-color: #222;
     border-color: #080808;
}

</style>

<body>

<nav class="navbar navbar-inverse" >
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
   <li><a href="#"><span style="color: #ffd700;"><b>Spoon Compass</b></span></a></li>
      <li class="active"><a href="#"><b>HOME</b></a></li>
      <li><a href="#"><b>About us</b></a></li>
      <li><a href="#"><b>FAQ</b></a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>Page 1 </b><span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
      <li class="pull-right">
	<a class="glyphicon glyphicon-log-in" data-toggle="modal" data-target="#myModal">
	</a>
	</li>
    </ul>
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
						<div class="modal-body">
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
						<div class="modal-body" >
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
	
  </div>
</nav>
  


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
	var naver_id_login = new naver_id_login("RiHbbkwWnQhprjXrVbi3",	"http://192.168.56.1/nav2.jsp");		//돌아오는 url 
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
