<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/js/jquery.bxslider.min.js"></script>
<link href="/lib/jquery.bxslider.css" rel="stylesheet">
<style>
.arrow {
	width: 50px;
}

.bucketCon {
	
	height : 350px;
	border: 5px #ff9400;
	border-style: double;
	font-family: hanna;
}

.reviewCon {
	padding : 20px 20px 20px 20px;
	border: 5px #ff9400;
	border-style: double;
	max-width: 33cm;
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
	background-color:#ff9400;
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

	margin-top : 10px;
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
	margin-right : 1cm;
}

#review-box {
	margin-left: 3.5cm; 
	margin-top: 1cm; 
	margin-right : 1cm;
}

.bucket-img {
	padding-bottom :25px;
	width: 70px;
}
</style>

<div class="row" id="bucket-box">
	<img src="/views/search/images/color-bucket.png" class="bucket-img">
	&nbsp;&nbsp;&nbsp;<span class="bucket-font">나의 먹킷 리스트</span>
</div>
<div id="bucketList" class="row">
	<div class="col-md-1" align="center" style="margin-top: 2.5cm;">
		<span id="bucket-left"  ></span>
	</div>
	<div class="col-md-10">
		<ul class="bucket-slider">

			<c:forEach items="${bucketList}" var="item" varStatus="vs">

				<li>
					<div class="bucketCon" align="center">
						<a href="/search/detail?tel=${item.TEL }" class="title-font">${item.title }</a>
						<br /> <span class="info-font">${item.adress}</span>
						<br /> <span class="info-font">${item.type } / ${item.AVG }
							Score</span><br /> <a href="/search/detail?tel=${item.TEL }"><img class="img-box" src="${item.img }" /></a>
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
			<span id="review-up" ></span>
		</div>
		<div class="row">
			<ul class="review-slider">

				<c:forEach items="${reviewList}" var="item" varStatus="vs">

					<li>
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


		<div class="row" align="center"style="padding-bottom: 1cm;">
			<span id="review-down" ></span>
		</div>
	</div>
	<div class="col-md-1" align="center"></div>
</div>
<script>
	$('.bucket-slider')
			.bxSlider(
					{
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
	$('.review-slider')
			.bxSlider(
					{
						nextSelector : '#review-down',
						prevSelector : '#review-up',
						nextText : '<div ><img src="/img/down.png" class="arrow" ></div>',
						prevText : '<div ><img src="/img/up.png" class="arrow" ></div>',

						minSlides : 3,
						maxSlides : 3,
						slideWidth : 1600,
						slideMargin : 10,
						mode : 'vertical',
						captions : true,
						pagerCustom : '#bx-pager'
					});
</script>