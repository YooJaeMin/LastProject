<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<link href="/lib/jquery.bxslider.css" rel="stylesheet">
<style>
.profile_img {
	width: 200px;
}
body {
	font-family: 'Hanna', sans-serif;
}
.score {
	font-family: impact;
	font-size: 2.0em;
	color: #FA5882;
}

hr {
	border: solid 2px orange;
}

.weather {
	width: 30px;
}

.mainpic {
	width: 100%;
	height: 70%;
	overflow: hidden;
}

.title {
	font-weight: bold;
	font-size: 2.2em;
	font-family: 나눔고딕;
	line-height: 1.3em;
}

.location {
	font-size: 1.5em;
	color: grey;
}

.line {
	padding-top: 2%;
	border-bottom-style: solid;
	border-bottom-width: 1.5px;
	border-bottom-color: black;
	margin-top: 10px;
}

.point1 {
	background-image: url('/icon/star_off.png');
	width: 120px;
	height: 30px;
}

.point2 {
	overflow: hidden;
	width: 0%;
}

.point2_r {
	overflow: hidden;
}

.icon {
	width: 60px;
	height: 60px;
}

.font1 {
	font-size: 1.2em;
	line-height: 1.9em;
}

.font2 {
	font-size: 1.7em;
}

.font3 {
	font-size: 1.1em;
}

.font4 {
	font-size: 1.4em;
}

.profile {
	overflow: hidden;
	width: 70px;
	height: 70px;
	border-radius: 50%;
}

.modal1 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content1 {
	background-color: #fefefe;
	margin-right: 30%;
	margin-left: 30%;
	padding: 5%;
	border: 1px solid #888;
}

/* The Close Button */
.close1 {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.btn {
	border-style: soild;
	border-width: 2px;
	border-color: black;
	background-color: white;
	font-weight: bold;
}

.img-box {
	max-height: 250px;
	width: 300px;
	overflow: hidden;
	border-radius: 8px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

#hiddenIMG {
	max-height: 250px;
	width: 300px;
	overflow: hidden;
	border-radius: 8px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.pop-up-* {
	max-height: 500px;
	width: 400px;
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 300px; /* Location of the box */
	left: 0;
	top: 0;
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.rating {
	width: 226px;
	margin: 0 auto 1em;
	font-size: 45px;
	overflow: hidden;
}

.rating input {
	float: right;
	opacity: 0;
	position: absolute;
}

.rating a, .rating label {
	float: right;
	color: #aaa;
	text-decoration: none;
	-webkit-transition: color .4s;
	-moz-transition: color .4s;
	-o-transition: color .4s;
	transition: color .4s;
}

.rating label:hover ~ label, .rating input:focus ~ label, .rating label:hover,
	.rating a:hover, .rating a:hover ~ a, .rating a:focus, .rating a:focus 
	 ~ a {
	color: orange;
	cursor: pointer;
}

.rating {
	direction: rtl;
}

.rating a {
	float: none
}

.arrow {
	width: 80px;
	padding: 10px;
	cursor: pointer;
}
</style>

<div
	style="padding-top: 5%; margin: 0 250; padding-right: 25px; padding-left: 25px;">
	<div class="row">
		<div class="col-md-4">
			<span class="title">${store.title } / </span><span class="score">
				${store.avg } Score</span>
		</div>

	</div>
	<br />
	<div class="row">
		<div class="col-md-8">
			<div class="location">
				${store.adress } <span style="font-size: 0.8em;"> <br /> <c:forEach
						items="${store.tag }" var="tag">
						<a href="/search/tag?type=basic&selectedTag=${tag }">#${tag }
						</a>
					</c:forEach>
				</span>
			</div>
		</div>
		<div class="col-md-3">
			<!--  -->
			<!--  -->
			<div class="col-md-8">
				<button type="button" id="like" class="btn" value="true"
					style="WIDTH: 80pt; HEIGHT: 30pt">
					좋아요<span id="like_cnt">${like.CNT}</span>
					<!--  -->
					<c:choose>
						<c:when test="${likeResult eq true}">
							<img class="btn-img" id="likeR"
								src="/img/1414328714455_PicsArt_1389242401746.png"
								style="width: 15%; height: auto;">
						</c:when>
						<c:otherwise>
							<img class="btn-img" id="likeR"
								src="/img/SketchTalk201361917350.png"
								style="width: 15%; height: auto;">
						</c:otherwise>
					</c:choose>
					<!--  -->
				</button>
			</div>
			<div class="col-md-4">
					<a href="#" id="shopping">
				<c:choose>
						<c:when test="${shoppingR eq true}">
							<img class="btn-img" id=shoppingR
								src="/views/search/images/color-bucket.png"
								style="width: 40pt; height: 40pt;">
						</c:when>
						<c:otherwise>
							<img class="btn-img" id="shoppingR"
								src="/views/search/images/black-bucket.png"
								style="width: 40pt; height: 40pt;">
						</c:otherwise>
				</c:choose>
				</a>
			</div>
		</div>
	</div>

	<div class="row font2">
		<hr />
		간단 정보
		<hr />
	</div>

	<div class="row" align="center">
		<div class="col-md-3">
			<img src="/views/search/images/store_red.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/food_red.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/list_red.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/clock_red.png" class="icon">
		</div>
	</div>

	<div class="row font1" align="center">
		<div class="col-md-3">
			<c:forEach items="${store.type }" var="type">${type } </c:forEach>
		</div>
		<div class="col-md-3">
			<c:forEach items="${store.item }" var="item">${item } </c:forEach>
		</div>
		<div class="col-md-3">
			<c:forEach items="${store.parking }" var="parking">${parking } </c:forEach>
		</div>
		<div class="col-md-3">
			<c:forEach items="${store.time }" var="time">${time }<br />
			</c:forEach>
		</div>
	</div>


	<div class="row font2">
		<hr />
		사진
		<hr />
	</div>

	<div class="row">
		<div class="col-md-1" align="left">
			<br /> <br /> <br /> <br /> <br /> <span id="slider-prev"
				style="font-size: 2em; padding-right: 20%"></span>
		</div>
		<div class="col-md-10">
			<ul class="bxslider">

				<c:forEach items="${store.img }" var="img" varStatus="vs">

					<li><a href="#" data-toggle="modal"
						data-target=".pop-up-${vs.index }"><img class="img-box"
							src="${img }"></a></li>

				</c:forEach>
			</ul>
		</div>


		<div class="col-md-1" align="right">
			<br /> <br /> <br /> <br /> <br /> <span id="slider-next"
				style="font-size: 2em; padding-right: 20%"></span>
		</div>
	</div>

	<div class="row">
		<div class="row font2">
			<hr />
			<div class="col-md-6">리뷰</div>
			<div class="col-md-6" align="right">
				<button id="myBtn1" class="btn">리뷰 등록</button>
			</div>
			<br/>
			<hr />
		</div>

		<!-- 숙소 -->

		<div class="row font1" align="center">
			<c:forEach items="${reviewList}" var="item" begin="1" end="5" varStatus="vs">
				<div class="row font1 col-md-3">
					<img class="profile_img" src="${item.PROFILE }">
				</div>
				<div class="row font1 col-md-9">
					<div class="col-md-offset-1 col-md-5">${item.ID }</div>
					<div class="col-md-3">${item.EAT_DATE }</div>
					<div class="col-md-3">
						<div
							style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
							총점 / ${item.AVG_S }
							<p
								style="WIDTH: ${item.AVG_S*20}%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/img/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
							</p>
						</div>
					</div>


				</div>
				<div class="row font1"></div>
				<div class="row font1">
					<div class="col-md-6">
						누구랑? <span style="background-color: orange; color: white;">${item.TYPE }</span>
					</div>
					<div class="col-md-6">
						그날은...?
						<c:choose>
							<c:when test="${item.WEATHER eq 'cloudy' }">
								<img class="weather" src="/img_weather/cloudy.png">
							</c:when>
							<c:when test="${item.WEATHER eq 'rainy' }">
								<img class="weather" src="/img_weather/rainy.png">
							</c:when>
							<c:when test="${item.WEATHER eq 'snowy' }">
								<img class="weather" src="/img_weather/snowy.png">
							</c:when>
							<c:when test="${item.WEATHER eq 'sunny' }">
								<img class="weather" src="/img_weather/sunny.png">
							</c:when>
							<c:when test="${item.WEATHER eq 'windy' }">
								<img class="weather" src="/img_weather/windy.png">
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="row font1">
					<div class="col-md-1"></div>
					<div class="col-md-2">청결도</div>
					<div class="col-md-2">맛평가</div>
					<div class="col-md-2">가격평가</div>
					<div class="col-md-2">친절도</div>
					<div class="col-md-2">접근성</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row font1">
					<div class="col-md-1"></div>
					<div class="col-md-2" style="color: orange;">
						<!--  -->
						<c:choose>
							<c:when test="${item.CLEAN_S eq 1 }">
							★
						</c:when>
							<c:when test="${item.CLEAN_S eq 2 }">
							★★
						</c:when>
							<c:when test="${item.CLEAN_S eq 3 }">
								★★★
						</c:when>
							<c:when test="${item.CLEAN_S eq 4 }">
								★★★★
						</c:when>
							<c:when test="${item.CLEAN_S eq 5 }">
								★★★★★
						</c:when>
						</c:choose>
					</div>

					<!--  -->
					<div class="col-md-2" style="color: orange;">
						<!--  -->
						<c:choose>
							<c:when test="${item.TASTE_S eq 1 }">
							★
						</c:when>
							<c:when test="${item.TASTE_S eq 2 }">
							★★
						</c:when>
							<c:when test="${item.TASTE_S eq 3 }">
								★★★
						</c:when>
							<c:when test="${item.TASTE_S eq 4 }">
								★★★★
						</c:when>
							<c:when test="${item.TASTE_S eq 5 }">
								★★★★★
						</c:when>
						</c:choose>
					</div>
					<div class="col-md-2" style="color: orange;">
						<c:choose>
							<c:when test="${item.PRICE_S eq 1 }">
							★
						</c:when>
							<c:when test="${item.PRICE_S eq 2 }">
							★★
						</c:when>
							<c:when test="${item.PRICE_S eq 3 }">
								★★★
						</c:when>
							<c:when test="${item.PRICE_S eq 4 }">
								★★★★
						</c:when>
							<c:when test="${item.PRICE_S eq 5 }">
								★★★★★
						</c:when>
						</c:choose>
					</div>
					<div class="col-md-2" style="color: orange;">

						<c:choose>
							<c:when test="${item.GOOD_S eq 1 }">
							★
						</c:when>
							<c:when test="${item.GOOD_S eq 2 }">
							★★
						</c:when>
							<c:when test="${item.GOOD_S eq 3 }">
								★★★
						</c:when>
							<c:when test="${item.GOOD_S eq 4 }">
								★★★★
						</c:when>
							<c:when test="${item.GOOD_S eq 5 }">
								★★★★★
						</c:when>
						</c:choose>
					</div>
					<div class="col-md-2" style="color: orange;">
						<c:choose>
							<c:when test="${item.LOCATION_S eq 1 }">
							★
						</c:when>
							<c:when test="${item.LOCATION_S eq 2 }">
							★★
						</c:when>
							<c:when test="${item.LOCATION_S eq 3 }">
								★★★
						</c:when>
							<c:when test="${item.LOCATION_S eq 4 }">
								★★★★
						</c:when>
							<c:when test="${item.LOCATION_S eq 5 }">
								★★★★★
						</c:when>
						</c:choose>

					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row font1">
					<div class="col-md-12" align="left">
						<b>평가</b>
					</div>
				</div>
				<div class="row font1">
					<div class="col-md-12" align="left">${item.CONTENT }</div>
				</div>
				<hr />
			</c:forEach>


			<div class="row font1" align="right">
				<button class="btn" id="reviewMore">리뷰 더보기</button>
			</div>

			<script>
				$("#reviewMore").click(function() {
					if ($(".reviewList").css("display") == 'block') {
						$(".reviewList").css("display", "none");
						$(this).html("리뷰 더보기");
					} else {
						$(".reviewList").css("display", "block");
						$(this).html("리뷰 닫기");
					}

				});
			</script>

			<div id="row font1" class="reviewList" style="display: none">
				<hr />
				<c:forEach items="${reviewList }" var="item" varStatus="vs">
					<c:if test="${vs.count ge 6  }">
						<div class="row font1 col-md-3">
							<img class="profile_img" src="${item.PROFILE }">
						</div>
						<div class="row font1 col-md-9">
							<div class="col-md-offset-1 col-md-5">${item.ID }</div>
							<div class="col-md-3">${item.EAT_DATE }</div>
							<!--  -->
							<!--  -->
							<div class="col-md-3">
								<div
									style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
									총점 / ${item.AVG_S }
									<p
										style="WIDTH: ${item.AVG_S*20}%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/img/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
									</p>
								</div>
							</div>


						</div>
						<div class="row font1"></div>
						<div class="row font1">
							<div class="col-md-6">
								누구랑? <b>${item.TYPE }</b>
							</div>
							<div class="col-md-6">
								그날은...?
								<c:choose>
									<c:when test="${item.WEATHER eq 'cloudy' }">
										<img class="weather" src="/img_weather/cloudy.png">
									</c:when>
									<c:when test="${item.WEATHER eq 'rainy' }">
										<img class="weather" src="/img_weather/rainy.png">
									</c:when>
									<c:when test="${item.WEATHER eq 'snowy' }">
										<img class="weather" src="/img_weather/snowy.png">
									</c:when>
									<c:when test="${item.WEATHER eq 'sunny' }">
										<img class="weather" src="/img_weather/sunny.png">
									</c:when>
									<c:when test="${item.WEATHER eq 'windy' }">
										<img class="weather" src="/img_weather/windy.png">
									</c:when>
								</c:choose>
							</div>
						</div>
						<div class="row font1">
							<div class="col-md-1"></div>
							<div class="col-md-2">청결도</div>
							<div class="col-md-2">맛평가</div>
							<div class="col-md-2">가격평가</div>
							<div class="col-md-2">친절도</div>
							<div class="col-md-2">접근성</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row font1">
							<div class="col-md-1"></div>
							<div class="col-md-2" style="color: #FF0015;">
								<!--  -->
								<c:choose>
									<c:when test="${item.CLEAN_S eq 1 }">
							★
						</c:when>
									<c:when test="${item.CLEAN_S eq 2 }">
							★★
						</c:when>
									<c:when test="${item.CLEAN_S eq 3 }">
								★★★
						</c:when>
									<c:when test="${item.CLEAN_S eq 4 }">
								★★★★
						</c:when>
									<c:when test="${item.CLEAN_S eq 5 }">
								★★★★★
						</c:when>
								</c:choose>
							</div>

							<!--  -->
							<div class="col-md-2" style="color: #FF0015;">
								<!--  -->
								<c:choose>
									<c:when test="${item.TASTE_S eq 1 }">
							★
						</c:when>
									<c:when test="${item.TASTE_S eq 2 }">
							★★
						</c:when>
									<c:when test="${item.TASTE_S eq 3 }">
								★★★
						</c:when>
									<c:when test="${item.TASTE_S eq 4 }">
								★★★★
						</c:when>
									<c:when test="${item.TASTE_S eq 5 }">
								★★★★★
						</c:when>
								</c:choose>
							</div>
							<div class="col-md-2" style="color: #FF0015;">
								<c:choose>
									<c:when test="${item.PRICE_S eq 1 }">
							★
						</c:when>
									<c:when test="${item.PRICE_S eq 2 }">
							★★
						</c:when>
									<c:when test="${item.PRICE_S eq 3 }">
								★★★
						</c:when>
									<c:when test="${item.PRICE_S eq 4 }">
								★★★★
						</c:when>
									<c:when test="${item.PRICE_S eq 5 }">
								★★★★★
						</c:when>
								</c:choose>
							</div>
							<div class="col-md-2" style="color: #FF0015;">

								<c:choose>
									<c:when test="${item.GOOD_S eq 1 }">
							★
						</c:when>
									<c:when test="${item.GOOD_S eq 2 }">
							★★
						</c:when>
									<c:when test="${item.GOOD_S eq 3 }">
								★★★
						</c:when>
									<c:when test="${item.GOOD_S eq 4 }">
								★★★★
						</c:when>
									<c:when test="${item.GOOD_S eq 5 }">
								★★★★★
						</c:when>
								</c:choose>
							</div>
							<div class="col-md-2" style="color: #FF0015;">
								<c:choose>
									<c:when test="${item.LOCATION_S eq 1 }">
							★
						</c:when>
									<c:when test="${item.LOCATION_S eq 2 }">
							★★
						</c:when>
									<c:when test="${item.LOCATION_S eq 3 }">
								★★★
						</c:when>
									<c:when test="${item.LOCATION_S eq 4 }">
								★★★★
						</c:when>
									<c:when test="${item.LOCATION_S eq 5 }">
								★★★★★
						</c:when>
								</c:choose>

							</div>
							<div class="col-md-1"></div>
						</div>
						<div class="row font1">
							<div class="col-md-12" align="left">
								<b>평가</b>
							</div>
						</div>
						<div class="row font1">
							<div class="col-md-12" align="left">${item.CONTENT }</div>
						</div>
						<hr />
					</c:if>


				</c:forEach>
			</div>

		</div>


	</div>

</div>

<script>
	// Get the modal
	var modal1 = document.getElementById('myModal1');

	// Get the button that opens the modal
	var btn1 = document.getElementById("myBtn1");

	// Get the <span> element that closes the modal
	var span1 = document.getElementsByClassName("close1")[0];

	// When the user clicks the button, open the modal 
	btn1.onclick = function() {
		modal1.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span1.onclick = function() {
		modal1.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal1) {
			modal1.style.display = "none";
		}
	}
</script>

<script>
	$('.bxslider').bxSlider({
		nextSelector : '#slider-next',
		prevSelector : '#slider-prev',
		nextText : '>',
		prevText : '<',

		minSlides : 3,
		maxSlides : 3,
		slideWidth : 500,
		slideMargin : 10,
		mode : 'horizontal',
		captions : true,
		pagerCustom : '#bx-pager'
	});
</script>
<!--업소 좋아요-->
<script>
	$("#like")
			.click(
					function() {
						$
								.ajax({
									"url" : "/like/button?",
									"method" : "post",
									"data" : {
										"id" : "${sessionScope.auth_id}",
										"tel" : "${store.tel}",
									}
								})
								.done(
										function(rst) {
											var printRst = rst;
											console.log(rst)
											if (rst.like == 'like') {
												$("#likeR")
														.attr("src",
																"/img/1414328714455_PicsArt_1389242401746.png")
												$("#like_cnt").html(rst.CNT)

											} else if (rst.like == 'delete') {
												$("#likeR")
														.attr("src",
																"/img/SketchTalk201361917350.png")
												$("#like_cnt").html(rst.CNT)
											} else {

											}

										});
					});
</script>


<!--장바구니-->
<script>
	$("#shopping")
			.click(
					function() {
						$
								.ajax({
									"url" : "/like/shopping?",
									"method" : "post",
									"data" : {
										"id" : "${sessionScope.auth_id}",
										"tel" : "${store.tel}",
									}
								})
								.done(
										function(rst) {
											var printRst = rst;
											console.log(rst)
											if (rst =="ShopingS") {
												window.alert("장바구니에 추가 되었습니다.!");
												$("#shoppingR")
														.attr("src","/views/search/images/color-bucket.png");
											} else if(rst=="ShopingF"){
												window.alert("장바구니가 취소 되었습니다.!");
												$("#shoppingR")
														.attr("src","/views/search/images/black-bucket.png");
											} 
																
											 else{
												window.alert("장바구니가 등록에 실패하였습니다.!");
											}

										});
					});
</script>
<!--리뷰 좋아요-->
<script>

		$.ajax({
			"url" : "/like/review?",
			"method" : "post",
			"data" : {
				"id" : "${sessionScope.auth_id}",
				"review_id" : id,
				"good" : hit,

			}
		}).done(
				function(rst) {
					var printRst = rst;
					console.log(rst)
					if (rst == 1) {
						$("#img" + cnt).attr("src",
								"/img/1414328714455_PicsArt_1389242401746.png")
					} else {
						$("#img" + cnt).attr("src",
								"/img/SketchTalk201361917350.png")
					}

				});

</script>



<!--  -->

<div
	style="padding-top: 5%; margin: 0 250; padding-right: 25px; padding-left: 25px;">


	<div class="row font2">
		<img src="/views/search/images/n_blog.png" /> 검색 결과 총 ${blog.total }개
		<hr />
	</div>
	<div id="blog-prev"
		style="font-size: 2em; padding-right: 20%; color: green;"
		align="center">
		<img src="">
	</div>
	<div id="blogSlider">
		<c:forEach items="${blog.itemList }" var="item" varStatus="vs">
			<div>
				<div class="row">
					<div class="col-md-6 font4" align="left">
						${vs.count }. <a href="${item.link }" style="color: green;">${item.title }</a>
					</div>
					<div class="col-md-6 font3" align="right">
						<div class="col-md-6 ">
							<span style="color: green;">post date.</span> ${item.postdate }
						</div>
						<div class="col-md-6 ">
							<span style="color: green;">write by.</span> ${item.bloggername }
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 font3">${item.description }</div>
				</div>
				<hr />
			</div>

		</c:forEach>
	</div>
	<div id="blog-next"
		style="font-size: 2em; padding-right: 20%; color: green;"
		align="center"></div>

</div>

<script>
	$('#blogSlider')
			.bxSlider(
					{
						nextSelector : '#blog-next',
						prevSelector : '#blog-prev',
						nextText : '<div ><img src="/views/search/images/down.png" class="arrow" ></div>',
						prevText : '<div ><img src="/views/search/images/up.png" class="arrow" ></div>',

						minSlides : 5,
						maxSlides : 5,
						slideWidth : 1000,
						slideMargin : 10,
						mode : 'vertical',
						captions : true,
						pagerCustom : '#bx-pager'
					});
</script>