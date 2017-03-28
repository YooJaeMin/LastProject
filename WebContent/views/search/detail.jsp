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
	border: solid 1.5px orange;
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
	margin-bottom: 10px;
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

.like {
	border:none;
	background:none;
	font-size: 18px;
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
<!-- 리뷰 모달 스타일 시작 -->
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
	font-size: 25px;
}
.star_rating{
	font-size: 20px
}
.modal-content{
	margin:40px;
}
.modal-body{
	margin-left:25px;
	margin-right:25px;
	font-family: 'Hanna', sans-serif;
	
}
.heart{
	font-size:18px;
	width :5.5cm;
	float: left;
}


</style>

<!-- 리뷰 모달 스타일 끝 -->

<div
	style="padding-top: 5%; margin: 0 250; padding-right: 25px; padding-left: 25px;">
	<div class="row">
		<div class="col-md-6">
			<span class="title">${store.title } </span><span class="score">
				 ${store.avg }</span><span style="font-size: 20px; font-family: impact;"> / 5.0</span> 
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
				<button type="button" id="like" class="btn like" value="true" 
					style="WIDTH: 100pt; ">
					좋아요<span id="like_cnt">${like.CNT}</span>
					<!--  -->
					<c:choose>
						<c:when test="${likeResult eq true}">
							<img class="btn-img" id="likeR"
								src="/img/heart01.png"
								style="width:25px">
						</c:when>
						<c:otherwise>
							<img class="btn-img" id="likeR"
								src="/img/heart02.png"
								style="width: 18pt; height: auto;">
						</c:otherwise>
					</c:choose>
					<!--  -->
				</button>
			</div>
			<div class="col-md-4">
				<a href="#" id="shopping"> <c:choose>
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
			<img src="/views/search/images/store_r.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/food_r.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/list_r.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/clock_r.png" class="icon">
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
			<ul class="bxslider" style="border: white;">

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
				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#reviewModal">리뷰 등록</button>
			</div>
			<br />
			<hr />
		</div>

		<!-- 숙소 -->

		<div class="row font1" align="center">
			<c:forEach items="${reviewList}" var="item" begin="1" end="5"
				varStatus="vs">
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
				<button type="button" class="btn btn-info btn-lg" id="reviewMore">리뷰 더보기</button>
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
						<div class="row font1 col-md-3" id=${item.ID }>
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
<!-- 여기서부터 리뷰 모달 -->
		<!-- Modal -->
		<div class="modal fade" id="reviewModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
						<div class="jumbotron" align="center" style="margin-bottom: 0px; font-family: 'Lobster';">
							<h1>My Review</h1>
						</div>

					<!-- 후기작성란+별점+날씨등록란 -->
					<div class="modal-body">
						<form action="/view/review/result" method="post">
							<!-- hidden >> id+tel 넘김 -->
							<input type="hidden" name="id" value="${sessionScope.auth_id }" />
							<input type="hidden" name="tel" value="${store.tel }" /> <input
								type="hidden" id="wStatus" name="weather" value="${weather.status}" />
							<input type="hidden" id="type" name="type" value="single"/> 

							　<h3 style="margin-top: 0px">#1. 날씨가 어땠나요?<br></h3>
							<div align="center">
							<a class="btn btn-lg"
								id="wb1" onclick="wBox(1, 'sunny')"> <img class="weather_box"
								src="/img_weather/sunny.png" />
							</a> <a class="btn btn-lg" id="wb2" onclick="wBox(2, 'cloudy')"> <img
								class="weather_box" src="/img_weather/cloudy.png" />
							</a> <a class="btn btn-lg" id="wb3" onclick="wBox(3,'rainy')"> <img
								class="weather_box" src="/img_weather/rainy.png" />
							</a> <a class="btn btn-lg" id="wb4" onclick="wBox(4,'snowy')"> <img
								class="weather_box" src="/img_weather/snowy.png" />
							</a>
							</div>
							
							<h3>#2. 누구와 방문했나요? <br></h3>
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
							</a>

									<!-- 별점 평가란 -->
								<h3>#3. 방문한 가게를 평가해 주세요! </h3>
									<div class="container">
									<div class="heart">
									청결도 : <input type="hidden" id="clean_s" name="clean_s"
										value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_clean${vs.count }"
													onclick="star(${vs.count},'clean')">♡</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_clean${vs.count }"
													onclick="star(${vs.count},'clean')" style="color: pink;">♥</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<br /> 맛평가 : <input type="hidden" id="taste_s" name="taste_s"
										value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_taste${vs.count }"
													onclick="star(${vs.count},'taste')">♡</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_taste${vs.count }"
													onclick="star(${vs.count},'taste')" style="color: pink;">♥</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<br/>
									친절도 : <input type="hidden" id="good_s" name="good_s"
										value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_good${vs.count }"
													onclick="star(${vs.count},'good')">♡</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_good${vs.count }"
													onclick="star(${vs.count},'good')" style="color: pink;">♥</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									</div>
									<div class="heart">
									접근성 : <input type="hidden" id="location_s"
										name="location_s" value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_location${vs.count }"
													onclick="star(${vs.count},'location')">♡</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_location${vs.count }"
													onclick="star(${vs.count},'location')"
													style="color: pink;">♥</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<br /> 
									가　격 : <input type="hidden" id="price_s" name="price_s"
										value="1" />
									<c:forEach begin="1" end="5" varStatus="vs">
										<c:choose>
											<c:when test="${!vs.first }">
												<a class="starScore" id="star_price${vs.count }"
													onclick="star(${vs.count},'price')">♡</a>
											</c:when>
											<c:otherwise>
												<a class="starScore" id="star_price${vs.count }"
													onclick="star(${vs.count},'price')" style="color: pink;">♥</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									</div>
								</div>
									
									
								<br /> <br />
								<div align="center" >
									<button  type="button" class="btn btn-warning"
										value="hide" id="hbt">자세한 후기 작성하기</button>
									<button type="submit" class="btn btn-primary">
										등록하기 <span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">취소</button>
								</div>
								

							<br />
							<div class="review_detail" id="text1" style="display: none;">
								<textarea placeholder="내용을 입력하세요." name="content" draggable="false" cols="46" rows="6" style="resize:none"
									></textarea>
							</div>
						</form>
					</div>



				
				</div>
			</div>
		</div>
<!-- 여기까지 리뷰 모달 -->

<script>
	$('.bxslider').bxSlider({
		nextSelector : '#slider-next',
		prevSelector : '#slider-prev',
		nextText : '<img src="/img/next2.png" width=50px>',
		prevText : '<img src="/img/back2.png" width=50px>',

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
																"/img/heart01.png")
												$("#like_cnt").html(rst.CNT)

											} else if (rst.like == 'delete') {
												$("#likeR")
														.attr("src",
																"/img/heart02.png")
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
											if (rst == "ShopingS") {
												window
														.alert("장바구니에 추가 되었습니다.!");
												$("#shoppingR")
														.attr("src",
																"/views/search/images/color-bucket.png");
											} else if (rst == "ShopingF") {
												window
														.alert("장바구니가 취소 되었습니다.!");
												$("#shoppingR")
														.attr("src",
																"/views/search/images/black-bucket.png");
											}

											else {
												window
														.alert("장바구니가 등록에 실패하였습니다.!");
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
							"/img/heart01.png")
				} else {
					$("#img" + cnt).attr("src",
							"/img/heart02.png")
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
							<span style="color: green;">posted date.</span> ${item.postdate }
						</div>
						<div class="col-md-6 ">
							<span style="color: green;">written by.</span> ${item.bloggername }
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

<script>
	$("#hbt").click(function(){
		$("#text1").toggle();
	});
	
	function star(x,type){
		
		if($("#star_"+type+x).html()=="♡"){
			for(var i =1; i<=x; i++){
				$("#star_"+type+i).each(function(){
					//class name이 chk인 개체들을 모두 체크되게함
						// this.checked =true;
							$(this).html("♥");
							$(this).css("color","pink");

					});
			}
		} else{
			for(var i =x+1; i<=5; i++){
				$("#star_"+type+i).each(function(){
					//class name이 chk인 개체들을 모두 체크되게함
						// this.checked =true;
							$(this).html("♡");
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