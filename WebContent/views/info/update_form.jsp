<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/js/jquery.bxslider.min.js"></script>
<link href="/lib/jquery.bxslider.css" rel="stylesheet">

<style type="text/css">
.jumbotron {
	color: #ffffff;
	font-family: 'Lobster';
	background-color: #ff9400;
	margin-top: 0;
	padding: 20px 20px 20px 40px;
}

body {
	font-family: 'Hanna', sans-serif;
	font-size: medium;
}
</style>
<!-------- 버킷 스타일 --------->
<style>
.arrow {
	width: 50px;
	margin-top: 50px;
}

.downArrow {
	width: 50px;
	margin-top: -40px;
}

.upArrow {
	width: 50px;
	margin-bottom: -20px;
}

.bucketCon {
	height: 320px;
	border: 5px #ff9400;
	border-style: double;
	font-family: hanna;
}

.reviewCon {
	padding: 20px 20px 20px 20px;
	border: 5px #ff9400;
	border-style: double;
	max-width: 23.5cm;
	min-height: 3.5cm;
	font-family: hanna;
}

.title-font {
	font-size: 25px;
	color: black;
}

.bucket-font {
	font-size: 45px;
	color: #ffffff;
	background-color: #ff9400;
	font-family: hanna;
	padding: 15px 15px 15px 15px;
}

.info-font {
	font-size: 15px;
	color: grey;
}

.content-font {
	font-size: 20px;
	color: black;
}

.img-box {
	margin-top: 10px;
	width: 200px;
	height: 200px;
	overflow: hidden;
	border-radius: 8px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

#bucket-box {
	margin-left: 3.5cm;
	margin-top: 1cm;
	margin-right: 1cm;
}

#review-box {
	margin-left: 3.5cm;
	margin-top: 1cm;
	margin-right: 1cm;
}

.bucket-img {
	padding-bottom: 25px;
	width: 70px;
}
</style>
<!-------- 버킷 스타일 --------->
<!--------------------- 회원 정보 수정------------------------->
<div class="jumbotron" align="center" style="margin-bottom: 0px">
	<h1>My Account</h1>
</div>
<br />
<br />
<div class="container"
	style="size: 100px; margin: 0 250; padding: 0px; width: 1000px;">

	<div class="col-md-1"></div>
	<c:forEach var="pic" items="${InfoR}">
		<!-- 12등분  -->


		<div class="col-md-4" align="center" style="margin-top: 1cm;">
			<form action="/Mypage/pictureR" method="post"
				enctype="multipart/form-data" >
				<br /> <img src="${pic.PROFILE}" width="200" height="200"
					style="border-radius: 100px;" /> <br /> <br /> 
					<input type="file" class="form-control" name="pic" value="${pic.PROFILE}" /> <br />
				<div align="right" style="margin-top: -55.5;">
					<button type="submit" class="btn btn-default">사진변경</button>
				</div>
			</form>
		</div>
	</c:forEach>

	<c:forEach var="map" items="${InfoR}">
		<div class="col-md-7">
			<form action="/Mypage/infoUpdate" method="post">
				<span style="font-family: Lobster; font-size: 30px;">Hello
					"${map.ID}".<input type="hidden" name="id" value="${map.ID }">
				</span> <br />
				<br />

				<p>
					별명<br /> <input type="text" class="form-control" name="nick"
						value="${map.NICK}" />
				</p>

				<div>
					생년월일 <input type="text" class="form-control" name=birth
						id="datepicker1" value="${map.BIRTH}" />
				</div>

				<p>
					성별<br /> <select name="gender" class="form-control">
						<option selected="selected">성별을 선택해 주세요.</option>
						<option value="M" ${map.GENDER eq 'M' ? 'selected' : ''}>남</option>
						<option value="F" ${map.GENDER eq 'F' ? 'selected' : ''}>여</option>
					</select>
				</p>
				<p>
					결혼여부<br /> <select name="marry" class="form-control">
						<option selected="selected">결혼 여부를 선택해 주세요.</option>
						<option value="미혼" ${map.GENDER eq 'couple' ? 'selected' : ''}>미혼</option>
						<option value="기혼" ${map.GENDER eq 'single' ? 'selected' : ''}>기혼</option>
					</select>

				</p>
				<br />
				<div align="right">
					<button type="submit" class="btn btn-success btn-lg">변경하기</button>
				</div>
			</form>

		</div>
	</c:forEach>
</div>
<!--------------------- 회원 정보 수정------------------------->
<!-- ------------------ my bucket ----------------------------->
<div class="container" id="myBucket">
	<div class="row" id="bucket-box">
		<img src="/views/search/images/color-bucket.png" class="bucket-img">
		&nbsp;&nbsp;&nbsp;<span class="bucket-font">나의 먹킷 리스트</span>
	</div>
	<div id="bucketList" class="row">
		<div class="col-md-1" align="center" style="margin-top: 2.5cm;">
			<span id="bucket-left"></span>
		</div>
		<div class="col-md-10">
			<ul class="bucket-slider">
				<c:choose>
					<c:when test="${bucketList.size() eq 0}">
						<li>
							<div class="bucketCon" align="center">
								<br /> <br /> <br /> <span class="bucket-font">먹킷에 담긴 것이
									없어요 T^T</span>
							</div>
						</li>
					</c:when>
				</c:choose>
				<c:forEach items="${bucketList}" var="item" varStatus="vs">

					<li>
						<div class="bucketCon" align="center">
							<a href="/search/detail?tel=${item.TEL }" class="title-font">${item.title }</a>
							<br /> <span class="info-font">${item.adress}</span> <br /> <span
								class="info-font">${item.type } / ${item.AVG } Score</span><br />
							<a href="/search/detail?tel=${item.TEL }"><img
								class="img-box" src="${item.img }" onerror="this.src='/views/memberImg/default2.png'" /></a>
						</div>
					</li>

				</c:forEach>
			</ul>
		</div>


		<div class="col-md-1" align="center" style="margin-top: 2.5cm;">
			<span id="bucket-right"></span>
		</div>
	</div>

	<div class="row" id="review-box">
		<img src="/img/myReview.png" class="bucket-img">
		&nbsp;&nbsp;&nbsp;<span class="bucket-font">내가 쓴 리뷰</span>
	</div>
	<div class="row" id="reviewList">
		<div class="col-md-1" align="center"></div>
		<div class="col-md-10">
			<div class="row" align="center" style="padding-bottom: 1cm;">
				<span id="review-up"></span>
			</div>
			<div class="row">
				<c:choose>
					<c:when test="${bucketList.size() eq 0}">
						<li>
							<div class="bucketCon" align="center">
								<br /> <br /> <br /> <span class="bucket-font">작성하신 리뷰가 없어요 T^T</span>
							</div>
						</li>
					</c:when>
				</c:choose>
				<ul class="review-slider">

					<c:forEach items="${reviewList}" var="item" varStatus="vs">

						<li style="width: 300px;">
							<div class="reviewCon">
								<a href="/search/detail?tel=${item.TEL }#${item.ID}"
									class="title-font">${item.title }</a> <br /> <span
									class="info-font">${item.WEATHER } ${item.TYPE } /
									${item.AVG_S }점 / ${item.EAT_DATE }</span> <br /> <span
									class="content-font">${item.CONTENT }</span>
							</div>
						</li>

					</c:forEach>
				</ul>
			</div>


			<div class="row" align="center" style="padding-bottom: 1cm;">
				<span id="review-down"></span>
			</div>
		</div>
		<div class="col-md-1" align="center"></div>
	</div>
</div>


<script>
	$(function() {
		$("#datepicker1").datepicker(
				{
					yearRange : "-60:+0",
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					yearSuffix : '년'
				});
	});

	function checkCHK() {

	}
</script>
<script>
	$('.bucket-slider').bxSlider({
		nextSelector : '#bucket-right',
		prevSelector : '#bucket-left',
		nextText : '<div ><img src="/img/next2.png" class="arrow" ></div>',
		prevText : '<div ><img src="/img/back2.png" class="arrow" ></div>',

		minSlides : 4,
		maxSlides : 4,
		slideWidth : 1000,
		slideMargin : 10,
		mode : 'horizontal',
		captions : true,
		pagerCustom : '#bx-pager'
	});
</script>
<script>
	$('.review-slider').bxSlider({
		nextSelector : '#review-down',
		prevSelector : '#review-up',
		nextText : '<div ><img src="/img/down.png" class="downArrow" ></div>',
		prevText : '<div ><img src="/img/up.png" class="upArrow" ></div>',

		minSlides : 3,
		maxSlides : 3,
		slideWidth : 1000,
		slideMargin : 10,

		mode : 'vertical',
		captions : true,
		pagerCustom : '#bx-pager'
	});
</script>
