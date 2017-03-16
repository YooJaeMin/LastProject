</form><%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
 </head>
 
 <!-- 로고 -->
 <div align="center">
	<h1>spoon compass</h1>
	<img src="/img/123.png" width="10%" height="20%" />
</div>
  
  <!-- 모달 헤더+풋터 -->
  <style>
  .nav, h4, .close {
      background-color: #FFD700;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  
  .modal-footer {
      background-color: #f9f9f9;
  }
  </style>
  
  <div class="well row">
	<!-- 12등분  -->
	<div class="col-md-3" align="center">메뉴1??</div>
	<div class="col-md-3" class="form-control">메뉴2??</div>
	<div class="col-md-3" class="form-control">메뉴3??</div>
	<div class="col-md-3" class="form-control">메뉴4??</div>
</div>

<li class="pull-right">
	<button class="btn" data-toggle="modal" data-target="#myModal">LOG IN</button></li>

<body>
<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
			<ul class="nav nav-tabs" >			<!-- header 사이즈 -->
					<li class="active"><a data-toggle="tab" href="#login">LOG IN</a></li>		
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
											이메일로 로그인하기</label> <input type="text" class="form-control" id="id" placeholder="이메일 주소">
									</div>
									<div class="form-group">
										<label for="pw"><span class="glyphicon glyphicon-eye-open"></span> 
											비밀번호</label> <input	type="password" class="form-control" id="pw" placeholder="비밀번호">

									<div class="checkbox">
										<label><input type="checkbox" value="" checked>로그인상태	유지 </label>
									</div>
								</div>
								
									<div align="center">
										<button type="submit" class="btn btn-warning btn-block" >
											<span class="glyphicon glyphicon-off"></span>로그인
										</button>
										
										<button id="naver_id_login" type="submit" style="background:none;border:0px;"></button>
									</div>
									
								</form>
							</div>
						</div>
						
						<!-- 회원가입 tab -->
						<div id = "member" class="tab-pane fade">
								<div class="modal-body" style="padding: 30px 45px;">
								<h1></h1>
								<form role="form">
									<div class="form-group" >
										<!--  이메일로 가입하기  -->
										<label for="id"><span class="glyphicon glyphicon-user"></span>이메일로 가입하기</label> 
											<input type="text" class="form-control" id="id" 	name="id" placeholder="이메일 주소"><br/>
											<input type="text" class="form-control" id="name" name="name" placeholder="이름(별명)"><br>
											<input type="password" class="form-control" id="pw"	name="pw" placeholder="비밀번호">
									</div>
								</form>
							
							<div align="center">
										<button type="submit" class="btn btn-warning btn-block">가입하기
										</button>
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
						<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> 취소 </button>
								<p>아직 회원이 아니신가요?</p>
								<p>지금 <a href="#">회원가입</a>을 하시면 맛있는 프리미엄 기능이 제공됩니다.
						</p>
						<p>
							<a href="#">비밀번호찾기</a>
						</p>
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

<script type="text/javascript">
	var naver_id_login = new naver_id_login("WTSpbzT1tpWir6Lw4yHO",
			"http://192.168.10.26:8080/dddd/loginTest.jsp");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3, 60);
	naver_id_login.setDomain("http://192.168.10.26:8080/dddd/loginTest.jsp");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->
<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
	}

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->

		