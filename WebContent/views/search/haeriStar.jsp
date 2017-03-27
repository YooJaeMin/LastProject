<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.weather_div {
	width: 40px;
	background: white;
}

.starScore {
	cursor: pointer;
}

#review_detail {
	width: 100%;
	padding: 50px;
	background-color: lightblue;
	margin-top: 20px;
}

#modal-header {
	padding: 10px 16px;
	background-color: #5cb85c;
	color: white;
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
						<div class="jumbotron text-center">
							<h3>My Review</h3>
							<p>생생한 후기를 남겨주세요!</p>
						</div>
					</div>

					<!-- 후기작성란+별점+날씨등록란 -->
					<div class="modal-body">
						<form action="/view/review/result" method="get">
							<!-- hidden >> id+tel 넘김 -->
							<input type="hidden" name="id" value="${sessionScope.auth_id }" />
							<input type="hidden" name="tel" value="${store.tel }" /> <input
								type="hidden" id="weather_status" name="weather"
								value="${wStatus}" />
							<p>
								날씨가 어땠나요?<br />
							<div id="wb1" class="weather_div">
								<a class="btn" onclick="wBox(1)"> <img class="weather_box"
									src="/img_weather/sunny.png" />
								</a>
							</div>
							<div id="wb2" class="weather_div">
								<a class="btn weather_btn" onclick="wBox(2)"> <img
									class="weather_box" src="/img_weather/cloudy.png" />
								</a>
							</div>
							<div id="wb3" class="weather_div">
								<a class="btn weather_btn" onclick="wBox(3)"> <img
									class="weather_box" src="/img_weather/rainy.png" />
								</a>
							</div>
							<div id="wb4" class="weather_div">
								<a class="btn weather_btn" onclick="wBox(4)"> <img
									class="weather_box" src="/img_weather/snowy.png" />
								</a>
							</div>
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
								<div class="container">
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
								</div>
								<br /> <br />
								<div class="btn-group-vertical btn-block">
									<button type="submit" class="btn btn-primary">
										등록하기 <span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button type="button" class="btn btn-warning btn-block "
										value="hide" id="hbt">자세한 후기 작성하기</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">취소</button>
								</div>
							</div>

							<br />
							<div class="review_detail" id="text1" style="display: none;">
								<textarea placeholder="내용을 입력하세요."
									style="width: 565px; height: 150px;"></textarea>
							</div>
						</form>
					</div>



				</div>
			</div>
		</div>
	</div>

</body>
<script>
	$("#hbt").click(function(){
		$("#text1").toggle();
	});
	
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
	};
	
	function wBox(weather){
		for(var i = 1; i<=4; i++){
			$("#wb"+i).each(function(){
					if(i == weather){
						console.log(i);
						$(this).css("border", "2px solid #4CAF50");
					} else {
						$(this).css("border", "");
					}
			});
			}
		$("#wStatus").val("");
		}



</script>


