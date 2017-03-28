<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.input {
	font-size: 10pt;
}

.main_search_area {
	position: absolute;
	bottom: 0%;
	background-color: rgba(0, 0, 0, .5);
	padding-bottom: 15px;
	padding-top: 15px;
}

#main_visual {
	position: relative;
	height: 281px;
	width: 450px;
	margin: 0 auto;
	font-family: 'Hanna', sans-serif;
}

#main_visual img {
	position: absolute;
	left: 0;
	-webkit-transition: opacity 1s ease-in-out;
	-moz-transition: opacity 1s ease-in-out;
	-o-transition: opacity 1s ease-in-out;
	transition: opacity 1s ease-in-out;
}

#main_visual img.top {
	animation-name: cf3FadeInOut;
	animation-timing-function: ease-in-out;
	animation-iteration-count: infinite;
	animation-duration: 10s;
	animation-direction: alternate;
}
.main_view {
	font-family: "hanna";
}
</style>

<div class="main_visual"
	style="width: 100%; height: 100%; overflow: hidden; Opacity: 0.9; background-image: url(&amp;quot;./img/result.jpg&amp;quot;); background-size: cover;">
	<!--  -->

	<div style="margin-buttom: 5cm;" align="center" style="color: white;">
		<img src="/img/spooncompass.png" width="45%" height="55%" />

	</div>


	<%-- <c:if test="${sessionScope.auth ne  null }"> --%>
	<c:choose>
		<c:when test="${sessionScope.auth ne  null }">
			<div class="main_view row"
				style="position: absolute; top: 60%; left: 20%; margin-bottom: 250px; margin-top: 10px;padding-top: 30px; width: 60%; color: white; background-color: rgba(0, 0, 0, .5)"
				align="left">

				<div class="input col-sm-3">
					<div align="center"><span style=" font-size: 16pt">${age} ${gender } 추천</span></div>
					<!--  -->
						<c:choose>
						<c:when test="${infodetail eq null}">
						<ul>
						<c:forEach items="${listRecommendR}" var="item" varStatus="vs">
						${vs.count }위 <a href="/search/detail?tel=${item.TEL }"><font color="#ff9400"><span
								style="font-size: 14pt">${item.title }</span></font></a>
							<br />
						</c:forEach>
						</ul>
						</c:when>
						<c:otherwise>
							<c:forEach items="${infodetail}" var="item" varStatus="vs"><br/>
								${vs.count }위 <a href="/Mypage/info"><font color="#ff9400"><span
								style="font-size: 14pt;">${item}</span></font></a>
							<br />
						</c:forEach>
						</c:otherwise>
						
					</c:choose>
				</div>
				<div class="input col-sm-3">
					<div align="center"><span style="font-size: 16pt">실시간 검색어</span></div>
					<ul>
						<c:forEach items="${realRank}" var="item" varStatus="vs">
					${vs.count }위 <a href="/search/keyword?keyword=${item._id }">
					<font color="#ff9400"> <span style="font-size: 14pt;">${item._id }</span></font></a>
							<br />
						</c:forEach>
					</ul>
				</div>
				<div class="input col-sm-3">
					<div align="center"><span style="font-size: 16pt">오늘의 맛집</span></div>
					<ul>
						<c:forEach items="${todayRank}" var="item" varStatus="vs">
					${vs.count }위 <a href="/search/detail?tel=${item._id }"><font color="#ff9400"><span
								style="font-size: 14pt;">${item.title }</span></font></a>
							<br />
						</c:forEach>
					</ul>
				</div>
				<!--  -->
				<div class="input col-sm-3">
					<div align="center"><span style="font-size: 16pt">${wStatus}</span></div>
					
					<c:choose>
						<c:when test="${infodetail eq null}">
						<ul>
						<c:forEach items="${weather_ecommend}" var="item" varStatus="vs">
						${vs.count }위 <a href="/search/detail?tel=${item.TEL }"><font color="#ff9400"><span
								style="font-size: 14pt;">${item.title }</span></font></a>
							<br />
						</c:forEach>
						</ul>
						</c:when>
						<c:otherwise>
							<c:forEach items="${infodetail}" var="item" varStatus="vs"><br/>
								${vs.count }위 <a href="/Mypage/info"><font color="#ff9400"><span
								style="font-size: 14pt;">${item}</span></font></a>
							<br />
						</c:forEach>
						</c:otherwise>
						
					</c:choose>
					
				</div>

			</div>
		</c:when>
		<c:otherwise>

			<!-- /* .main_view {
	position: absolute;
	top: 60%;
	left: 20%;
	padding-bottom: 30px;
	padding-top: 30px;
} */ -->
			<div class="main_view row"
				style="position: absolute; top: 60%; margin-bottom: 250px; padding-top: 30px; left: 33%; width: 35%; color: white; background-color: rgba(0, 0, 0, .5)"
				align="left">

				<div class="input col-sm-6">
					<div align="center"><span style="font-size: 16pt">실시간 검색어</span></div>
					<ul>
						<c:forEach items="${realRank}" var="item" varStatus="vs">
					${vs.count }위 <a href="/search/keyword?keyword=${item._id }"><font color="#ff9400"><span
								style="font-size: 14pt">${item._id }</span></font></a>
							<br />
						</c:forEach>
					</ul>

				</div>

				<div class="input col-sm-6">
					<div align="center"><span style="font-size: 16pt">오늘의 맛집</span></div>
					<ul>
						<c:forEach items="${todayRank}" var="item" varStatus="vs">
					${vs.count }위 <a href="/search/detail?tel=${item._id }"><font color="#ff9400"><span
								style="font-size: 14pt;">${item.title }</span></font></a>
							<br />
						</c:forEach>
					</ul>
				</div>
			</div>

		</c:otherwise>
	</c:choose>

	<div class="main_search_area row col-md-offset-2 col-md-8">
		<div class="input-group" style="width: 100%;">
			<form action="/search/keyword" method="get">
				<div class="col-md-10">
					<input type="text" name="keyword" class="form-control"
						style="height: 55px; font-size: 18px; border: 4px solid; border-color: #FFD700;"
						placeholder="검색어 입력! 예) 강남역 수요미식회">
				</div>
				<div class="input-group-btn col-md-2">
					<button class="btn btn-default" type="submit"
						style="height: 55px; width: 120px; font-size: 18px; border: 4px solid; border-color: #FFD700; background-color: #FFD700; color: white;">
						<span>←</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	var header = $('.main_visual');

	var backgrounds = new Array('url(./img/result.jpg)',
			'url(./img/main11.jpg)', 'url(./img/main16.jpg)');

	var current = 0;

	function nextBackground() {
		current++;
		current = current % backgrounds.length;

		header.css('background-image', backgrounds[current]);

	}
	setInterval(nextBackground, 7000);

	header.css('background-image', backgrounds[0]);
</script>

