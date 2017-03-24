<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/lib/w3-theme-amber.css">

<style>
.weather_box {
	width: 40px;
}

.starScore {
	cursor: pointer;
}
</style>


<body>

	<div class="container">
		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">후기등록</button>

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
								날씨가 어땠나요?<br /> <input type="radio" name="weather"
									value="sunny">맑음 <img class="weather_box"
									src="/img_weather/sunny.png" /> <input type="radio"
									name="weather" value="cloudy">흐림 <img
									class="weather_box" src="/img_weather/cloudy.png" /> <input
									type="radio" name="weather" value="rainy">비 <img
									class="weather_box" src="/img_weather/rainy.png" /> <input
									type="radio" name="weather" value="snowy">눈 <img
									class="weather_box" src="/img_weather/snowy.png" />
							</p>
							<p>
								누구와 방문했나요?<br /> <input type="radio" name="type" value="single">혼자
								<img class="weather_box" src="/img_weather/single.png" /> <input
									type="radio" name="type" value="couple">애인 <img
									class="weather_box" src="/img_weather/couple.png" /> <input
									type="radio" name="type" value="friend">친구 <img
									class="weather_box" src="/img_weather/friends.png" /> <input
									type="radio" name="type" value="gettogether">회식 <img
									class="weather_box" src="/img_weather/gettogether.png" /> <input
									type="radio" name="type" value="family">가족 <img
									class="weather_box" src="/img_weather/family.png" />
							</p>

							<div class="row">
								<div class="col-sm-3">
									<!-- 별점 평가란 -->
									청결도 : <input type="hidden" id="clean_s" name="clean_s"
										value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_clean${vs.count }"
													onclick="star(${vs.count},'clean')">☆</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_clean${vs.count }"
													onclick="star(${vs.count},'clean')" style="color: red;">★</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<br /> 가 격 : <input type="hidden" id="price_s" name="price_s"
										value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_price${vs.count }"
													onclick="star(${vs.count},'price')">☆</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_price${vs.count }"
													onclick="star(${vs.count},'price')" style="color: red;">★</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<br /> 맛평가 : <input type="hidden" id="taste_s" name="taste_s"
										value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_taste${vs.count }"
													onclick="star(${vs.count},'taste')">☆</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_taste${vs.count }"
													onclick="star(${vs.count},'taste')" style="color: red;">★</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<br /> 친절도 : <input type="hidden" id="good_s" name="good_s"
										value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_good${vs.count }"
													onclick="star(${vs.count},'good')">☆</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_good${vs.count }"
													onclick="star(${vs.count},'good')" style="color: red;">★</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<br /> 접근성 : <input type="hidden" id="location_s"
										name="location_s" value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_location${vs.count }"
													onclick="star(${vs.count},'location')">☆</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_location${vs.count }"
													onclick="star(${vs.count},'location')" style="color: red;">★</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<br />
								</div>
								<br>
								<div class="col-sm-9">
									<textarea rows="5" cols="80" id="content" class="form-control"
										placeholder="후기를 입력해주세요" required="required"
										style="height: 251px;"></textarea>
									<br />
									<div class="submit_btn" align="right">
										<hr>
										<button type="submit" class="btn btn-default">등록하기</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소</button>
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
<script>
	function star(x,type){
		
		if($("#star_"+type+x).html()=="☆"){
			for(var i =1; i<=x; i++){
				$("#star_"+type+i).each(function(){
					//class name이 chk인 개체들을 모두 체크되게함
						// this.checked =true;
							$(this).html("★");
							$(this).css("color","red");

					});
			}
		} else{
			for(var i =x+1; i<=5; i++){
				$("#star_"+type+i).each(function(){
					//class name이 chk인 개체들을 모두 체크되게함
						// this.checked =true;
							$(this).html("☆");
							$(this).css("color","black");

					});
			}
		}

		$("#"+type+"_s").val(x);
	}
</script>

