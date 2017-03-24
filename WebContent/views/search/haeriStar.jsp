<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/lib/w3-theme-amber.css">
<style>
	.weather_box {
		width: 40px;
	}



</style>


<body>

<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
  후기등록</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" align="center">나의 후기 등록하기</h4>
        </div>
        <!-- 후기작성란+별점+날씨등록란 -->
        <div class="modal-body">
          	<form action="/view/review/result" method="get">
          		<!-- hidden >> id+tel 넘김 -->
          		<input type="hidden" name="id" value="${sessionScope.auth_id }" /> 
				<input type="hidden" name="tel" value="${store.tel }" />
          		<p>
          			날씨가 어땠나요?<br/>
					<input type="radio" name="weather" value="sunny">맑음
					<img class="weather_box" src="/img_weather/sunny.png"/>
					<input type="radio" name="weather" value="cloudy">흐림
					<img class="weather_box" src="/img_weather/cloudy.png"/>
					<input type="radio" name="weather" value="rainy">비
					<img class="weather_box"  src="/img_weather/rainy.png"/>
					<input type="radio" name="weather" value="snowy">눈
					<img class="weather_box" src="/img_weather/snowy.png"/>
				</p>
				<p>
          			누구와 방문했나요?<br/>
					<input type="radio" name="type" value="single">혼자
					<img class="weather_box" src="/img_weather/single.png"/>
					<input type="radio" name="type" value="couple">애인
					<img class="weather_box" src="/img_weather/couple.png"/>
					<input type="radio" name="type" value="friend">친구
					<img class="weather_box"  src="/img_weather/friends.png"/>
					<input type="radio" name="type" value="gettogether">회식
					<img class="weather_box" src="/img_weather/gettogether.png"/>
					<input type="radio" name="type" value="family">가족
					<img class="weather_box" src="/img_weather/family.png"/>
				</p>
				
				<div class="row">
				<div class="col-sm-3">
				<!-- 별점 평가란 -->
				
				</div><br>
				<div class="col-sm-9">
					<textarea rows="5" cols="80" id="content" class="form-control" 
						placeholder="후기를 입력해주세요" required="required"
						style="height:251px;"></textarea><br/>
					<div class="submit_btn" align="right">
					<hr>
					<button type="submit" class="btn btn-default">등록하기</button>
		         	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		         	</div>
	         	</div>
	         	</div>
	         	

	         	
			</form>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

</body>


