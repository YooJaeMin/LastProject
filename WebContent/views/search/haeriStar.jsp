<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
</head>

<style>
.jumbotron {
    color: #ffffff;
    font-family: 'Lobster';
    background-color: #ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}
.weather_box{
	width : 50px;
	height : 50px;
}
.starScore {
	cursor: pointer;
}
.modal-content{
	margin:40px;
}
.modal-body{
	margin-left:25px;
	margin-right:25px;
	
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
						<div class="jumbotron">
							<h1>My Review</h1>
						</div>

					<!-- 후기작성란+별점+날씨등록란 -->
					<div class="modal-body">
						<form action="/view/review/result" method="get">
							<!-- hidden >> id+tel 넘김 -->
							<input type="hidden" name="id" value="${sessionScope.auth_id }" />
							<input type="hidden" name="tel" value="${store.tel }" /> <input
								type="hidden" id="wStatus" name="weather" value="${weather.status}" />
							<input type="hidden" id="type" name="type" value="single"/> 

							날씨가 어땠나요?<br>
							<a class="btn btn-lg"
								id="wb1" onclick="wBox(1, 'sunny')"> <img class="weather_box"
								src="/img_weather/sunny.png" />
							</a> <a class="btn btn-lg" id="wb2" onclick="wBox(2, 'cloudy')"> <img
								class="weather_box" src="/img_weather/cloudy.png" />
							</a> <a class="btn btn-lg" id="wb3" onclick="wBox(3,'rainy')"> <img
								class="weather_box" src="/img_weather/rainy.png" />
							</a> <a class="btn btn-lg" id="wb4" onclick="wBox(4,'snowy')"> <img
								class="weather_box" src="/img_weather/snowy.png" />
							</a><br />
							
							<br /> 누구와 방문했나요? <br>
							<a class="btn btn-lg" id="t1" onclick="tBox(1,'single')">
								<img class="weather_box" src="/img_weather/single.png" />
							</a> <a class="btn btn-lg" id="t2" onclick="tBox(2,'couple')"> <img
								class="weather_box" src="/img_weather/couple.png" />
							</a> <a class="btn btn-lg" id="t3" onclick="tBox(3,'friend')"> <img
								class="weather_box" src="/img_weather/friends.png" />
							</a> <a class="btn btn-lg" id="t4" onclick="tBox(4,'together')"> <img
								class="weather_box" src="/img_weather/gettogether.png" />
							</a> <a class="btn btn-lg" id="t5" onclick="tBox(5,'family')"> <img
								class="weather_box" src="/img_weather/family.png" />
							</a><br />



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
													onclick="star(${vs.count},'clean')" style="color: orange;">★</a>
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
													onclick="star(${vs.count},'taste')" style="color: orange;">★</a>
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
													onclick="star(${vs.count},'good')" style="color: orange;">★</a>
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
													onclick="star(${vs.count},'location')"
													style="color: orange;">★</a>
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
													onclick="star(${vs.count},'price')" style="color: orange;">★</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<br /> <br />
								<div align="center">
									<button type="button" class="btn btn-warning"
										value="hide" id="hbt">자세한 후기 작성하기</button>
									<button type="submit" class="btn btn-primary">
										등록하기 <span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">취소</button>
								</div>
							</div>

							<br />
							<div class="review_detail" id="text1" style="display: none;">
								<textarea placeholder="내용을 입력하세요." name="content"
									></textarea>
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
							$(this).css("color","orange");

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
	
	function wBox(weather, wStat){
		for(var i = 1; i<=4; i++){
			$("#wb"+i).each(function(){
					if(i == weather){
						console.log(i);
						$(this).css("border", "2px solid #ff9400");
					} else {
						$(this).css("border", "");
					}
			});
			}
		$("#wStatus").val(wStat);
		}
	
	function tBox(type,d_type){
		for(var i = 1; i<=5; i++){
			$("#t"+i).each(function(){
					if(i == type){
						console.log(i);
						$(this).css("border", "2px solid #ff9400");
					} else {
						$(this).css("border", "");
					}
			});
			}
		$("#type").val(d_type);
		}


</script>


