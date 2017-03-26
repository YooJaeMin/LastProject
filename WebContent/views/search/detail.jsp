<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<link href="/lib/jquery.bxslider.css" rel="stylesheet">
<style>
.profile_img {
	width: 300px;
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
	font-size: 0.7em;
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
</style>

<div
	style="padding-top: 5%; margin: 0 250; padding-right: 25px; padding-left: 25px;">

	<span class="title">${store.title },${store.avg}</span> <br />

	<div class="row">
		<div class="col-md-8">
			<div class="location">
				${store.adress } <span style="font-size: 0.8em;"> <br /> <c:forEach
						items="${store.tag }" var="tag">
						<a href="/search/tag?type=basic&selectedTag=${tag }">#${tag }
						</a>
					</c:forEach>
				</span>
				<div class="point1">
					<div class="point2">
						<img src="/icon/star_on.png" width="160px" height="30px">
					</div>
				</div>
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
				<!-- <a href="#" id="shopping"><img
					src="/views/search/images/food bucket.png" id="shoppingR"
					style="width: 40pt; height: 30pt"></a> -->\
				<c:choose>
						<c:when test="${shoppingR eq true}">
							<img class="btn-img" id=shoppingR
								src="/views/search/images/food bucket.png"
								style="width: 40pt; height: 30pt;">
						</c:when>
						<c:otherwise>
							<img class="btn-img" id="shoppingR"
								src="/views/search/images/food_bucket_R.png"
								style="width: 40pt; height: 30pt;">
						</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<hr style="border: solid 2px red;" />
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
	<hr style="border: solid 2px red;" />

	<div class="row font2">
		사진
		<hr style="border: solid 2px red;" />
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
		<div align="center">
			<button id="myBtn1" class="btn">후기등록</button>
		</div>
	</div>
	<div class="row">
		<hr style="border: solid 2px red;" />
		<div class="row font2" align="left">
			<b>리뷰</b>
		</div>
		<hr style="border: solid 2px red;" />
		<!-- 숙소 -->

		<div class="row font1" align="center">
			<c:forEach items="${reviewList}" var="item" begin="1" end="5" varStatus="vs">
				<div class="row font1 col-md-3">
					<img class="profile_img" src="${item.PROFILE }">
				</div>
				<div class="row font1 col-md-9">
					<div class="col-md-offset-1 col-md-5">${item.ID }</div>
					<div class="col-md-3">${item.EAT_DATE }</div>
					<div class="col-md-1">
					
						좋아요<br /><div> ${item.HIT }</div><a id="${item.ID}"
							onclick="goReviewHit(${vs.count },'${item.ID}',${item.HIT})"><img
							id="img${vs.count }"
							style="WIDTH: 15pt; HEIGHT: 15pt"
							src="/img/SketchTalk201361917350.png"></a>
					</div>
					<!--  -->
					<!--  -->
					<div class="col-md-2">
						<div
							style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
							총점 / ${item.AVG_S }
							<p
								style="WIDTH: ${item.AVG_S*20}%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(/img/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
							</p>
						</div>
					</div>


				</div>

				<div class="row font1">
					<div class="col-md-6">커플 : ${item.TYPE }</div>
					<div class="col-md-6">
						날씨 : ${item.WEATHER }
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
					<div class="col-md-2">청결도</div>
					<div class="col-md-2">맛평가</div>
					<div class="col-md-2">가격평가</div>
					<div class="col-md-2">친절도</div>
					<div class="col-md-2">접근성</div>
				</div>
				<div class="row font1">
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
				</div>
				<div class="row font1">
					<div class="col-md-12" align="left">
						<b>평가</b>
					</div>
				</div>
				<div class="row font1">
					<div class="col-md-12" align="left">${item.CONTENT }</div>
				</div>
				<hr style="border: solid 2px red;" />
			</c:forEach>


			<div class="row font1" align="right">
				<button class="btn" onclick="listMore()">리스트 더보기</button>
			</div>

			<div id="reviewList row font1" style="display: none">
				<c:forEach items="${reviewList }" var="item" varStatus="vs">
					<c:if test="${vs.count ge 6  }">
						<div class="row font1">
							<div class="col-md-offset-1 col-md-3">${item.ID }</div>
							<div class="col-md-3">${item.EAT_DATE }</div>
							<div class="col-md-1">${item.HIT }</div>
							<div class="col-md-3">총점 / ${item.AVG_S }</div>
						</div>
						<div class="row font1">
							<div class="col-md-6">${item.TYPE }</div>
							<div class="col-md-6">${item.WEATHER }</div>
						</div>
						<div class="row font1">
							<div class="col-md-2">청결도</div>
							<div class="col-md-2">맛평가</div>
							<div class="col-md-2">가격평가</div>
							<div class="col-md-2">친절도</div>
							<div class="col-md-2">접근성</div>
						</div>
						<div class="row font1">
							<div class="col-md-2">${item.CLEAN_S}</div>
							<div class="col-md-2">
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
							<div class="col-md-2">${item.PRICE_S }</div>
							<div class="col-md-2">${item.GOOD_S }</div>
							<div class="col-md-2">${item.LOCATION_S }</div>
						</div>
						<div class="row font1">
							<div class="col-md-12">평가</div>
						</div>
						<div class="row font1">
							<div class="col-md-12">${item.CONTENT }</div>
						</div>
					</c:if>


				</c:forEach>
			</div>

		</div>


	</div>

</div>

<!-- 리뷰 -->
<hr style="border: solid 2px red;" />
<!-- <div class="row"> -->
<!-- 	<div class="col-md-3"> -->
<!-- 		<div class="font2"> -->
<!-- 			후기 0개 <span class="font3">0.0점</span> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="col-md-5" align="left"> -->

<!-- 		<div class="point1"> -->
<!-- 			<div class="point2"> -->
<!-- 				<img src="/icon/star_on.png" width="120px" height="30px"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->



<!-- </div> -->
<hr style="border: solid 2px red;" />





<!-- =============================== -->

<!-- Trigger/Open The Modal -->

<!-- The Modal -->
<div id="myModal1" class="modal1">

	<!-- Modal content -->
	<div class="modal-content1">
		<span class="close1">&times;</span>
		<div align="center">
			<h2>후기 등록</h2>
			<br /> <br />
			<form action="/view/review/result" method="get">
				<textarea rows="5" cols="80" id="content" class="form-control"
					placeholder="후기를 입력해주세요"></textarea>
				<br /> <br />
				<button type="submit"
					style="background-color: white; border-style: solid; border-color: orange; border-width: 2px;">등록</button>
			</form>
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
												window
														.alert("장바구니에 추가 되었습니다.!")
												$("#shoppingR")
														.attr("src",
																"/views/search/images/food_bucket_R.png")
											} else if(rst=="ShopingF"){
												window
														.alert("장바구니가 취소 되었습니다.!")
											}else{
												window
												.alert("장바구니가 등록에 실패하였습니다.!")
											}

										});
					});
</script>
<!--리뷰 좋아요-->
<script>
					function goReviewHit(cnt, id,hit) {
						
						$.ajax({
									"url" : "/like/review?",
									"method" : "post",
									"data" : {
										"id" : "${sessionScope.auth_id}",
										"review_id" : id,
										"good" : hit,
										
									}
								}).done(function(rst) {
											var printRst = rst;
											console.log(rst)
											if (rst == 1){
												$("#img"+cnt)
												.attr("src",
														"/img/1414328714455_PicsArt_1389242401746.png")
											} else {
												$("#img"+cnt)
												.attr("src",
														"/img/SketchTalk201361917350.png")
											}

										});
					}
</script>



<!--  -->


<script>
	function listMore() {
		var x = document.getElementById('reviewList');
		if (x.style.display === 'none') {
			x.style.display = 'block';
			x.innerHTML = '리스트 닫기';
		} else {
			x.style.display = 'none';
			x.innerHTML = '리스트 더보기';
		}
	}
	
</script>

<div class="row font2">
	블로그 검색 결과 총 ${blog.total }개
	<hr />
</div>
<c:forEach items="${blog.itemList }" var="item" varStatus="vs">
	<div class="row">
		<div class="col-md-6" align="left">
			<a href="${item.link }">${item.title }</a>
		</div>
		<div class="col-md-6" align="right">
			<div class="col-md-6">post date. ${item.postdate }</div>
			<div class="col-md-6">write by. ${item.bloggername }</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">${item.description }</div>
	</div>
</c:forEach>
<div class="row">
	<c:forEach varStatus="vs" begin="1"
		end="${blog.total % 10 eq 0 ? blog.total/10 : blog.total/10 +1 }">
		${vs.count }
	</c:forEach>
</div>