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
	border: 2px #FA5882;
	border-style: solid;
	font-family: hanna;
}

.reviewCon {
	border: 2px #FA5882;
	border-style: solid;
	max-width: 33cm;
	font-family: hanna;
}

.title-font {
	font-size: 25px;
	color: black;
}

.info-font {
	font-size: 15px;
	color: black;
}

.content-font {
	font-size: 20px;
	color: black;
}
</style>

<div id="bucketList" class="row">
	<div class="col-md-1" align="center">
		<span id="bucket-left" style="font-size: 2em; padding-right: 20%"></span>
	</div>
	<div class="col-md-10">
		<ul class="bucket-slider">

			<c:forEach items="${bucketList}" var="item" varStatus="vs">

				<li>
					<div class="bucketCon">
						<a href="/search/detail?tel=${item.TEL }" class="title-font">${item.title }</a>
						<br /> <span class="info-font">${item.type } / ${item.AVG }점</span>

					</div>
				</li>

			</c:forEach>
		</ul>
	</div>


	<div class="col-md-1" align="center">
		<span id="bucket-right" style="font-size: 2em; padding-right: 20%"></span>
	</div>
</div>


<div class="row" id="reviewList">
	<div class="col-md-1" align="center"></div>
	<div class="col-md-10">
		<div class="row" align="center">
			<span id="review-up" style="font-size: 2em; padding-right: 20%"></span>
		</div>
		<div class="row">
			<ul class="review-slider">

				<c:forEach items="${reviewList}" var="item" varStatus="vs">

					<li>
						<div class="reviewCon">
							<a href="/search/detail?tel=${item.TEL }#${item.ID}"
								class="title-font">${item.title }</a> <br /> <span
								class="info-font">${item.WEATHER } /${item.TYPE } /
								${item.AVG_S }점 / ${item.EAT_DATE }</span> <br /> <span
								class="content-font">${item.CONTENT }</span>
						</div>
					</li>

				</c:forEach>
			</ul>
		</div>


		<div class="row" align="center">
			<span id="review-down" style="font-size: 2em; padding-right: 20%"></span>
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
						nextText : '<div ><img src="/views/search/images/right.png" class="arrow" ></div>',
						prevText : '<div ><img src="/views/search/images/left.png" class="arrow" ></div>',

						minSlides : 5,
						maxSlides : 5,
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
						nextText : '<div ><img src="/views/search/images/downn.png" class="arrow" ></div>',
						prevText : '<div ><img src="/views/search/images/upp.png" class="arrow" ></div>',

						minSlides : 5,
						maxSlides : 5,
						slideWidth : 1600,
						slideMargin : 10,
						mode : 'vertical',
						captions : true,
						pagerCustom : '#bx-pager'
					});
</script>