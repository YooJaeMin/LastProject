<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <style>
  .modal-header, h4, .close {
      background-color: #FFD700;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  
  .modal-footer {
      background-color: #f9f9f9;
  }
  </style>


<body>

<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-default btn-lg" id="myBtn">Login</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> 로그인</h4>
        </div>
        
        <div class="modal-body" style="padding:40px 50px;">
        <h1></h1>
          <form role="form">
            <div class="form-group">
              <label for="id"><span class="glyphicon glyphicon-user"></span> 이메일로 로그인하기</label>
              <input type="text" class="form-control" id="id" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="pw"><span class="glyphicon glyphicon-eye-open"></span> 비밀번호</label>
              <input type="text" class="form-control" id="pw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>로그인상태 유지 </label>
            </div>
            
			<div align="center">
              <button type="submit" class="btn btn-warning btn-block">
              <span class="glyphicon glyphicon-off"></span> 로그인</button><br>
              <button id = "naver_id_login" type="submit" ></button>
				</div>
          </form>
        </div>
        
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소</button>
          <p>아직 회원이 아니신가요?</p>
          <p>지금 <a href="#">회원등록</a>을 하시면 맛있는 프리미엄 기능이 제공됩니다.</p>
          <p><a href="#">비밀번호찾기</a></p>
        </div>
      </div>
      
    </div>
  </div> 
</div>
 
<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("WTSpbzT1tpWir6Lw4yHO", "http://192.168.10.26:8080/dddd/loginTest.jsp");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,60);
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

</body>
