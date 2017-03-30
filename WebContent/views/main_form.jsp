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
	background-color: rgba(0, 0, 0, .5);
	padding-bottom: 10px;
	padding-top: 10px;
	font-family: 'Hanna', sans-serif;
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

<div class="main_visual contain">
	<div style="margin: 0.3cm;" align="center">
		<img src="/img/spoon2.png" width="250px" />

	</div>


	<%-- <c:if test="${sessionScope.auth ne  null }"> --%>
	<c:choose>
		<c:when test="${sessionScope.auth ne  null }">
			<div class="main_view row"
				style="position: absolute; top: 50%; left: 21%; margin-bottom: 250px; margin-top: 10px; padding-top: 30px; width: 60%; color: white; background-color: rgba(0, 0, 0, .5)"
				align="left">

				<div class="input col-sm-3">
					<div align="center">
						<span style="font-size: 16pt"> <c:choose>
								<c:when test="${infodetail eq null}">
									${age} ${gender } 추천
								</c:when>
								<c:otherwise>나이 / 성별 추천 리스트!</c:otherwise>
							</c:choose>
						</span>
					</div>
					<!--  -->
					<c:choose>
						<c:when test="${infodetail eq null}">
							<ul>
								<c:forEach items="${listRecommendR}" var="item" varStatus="vs">
						${vs.count }위 <a href="/search/detail?tel=${item.TEL }"><font
										color="#ff9400"><span style="font-size: 14pt">${item.title }</span></font></a>
									<br />
								</c:forEach>
							</ul>
						</c:when>
						<c:otherwise>
							<c:forEach items="${infodetail}" var="item" varStatus="vs">
								<br />
								<a href="/Mypage/info"><font color="#ff9400"><span
										style="font-size: 14pt;">자세한 정보를 입력하려면 <br />여기!
									</span></font></a>
								<br />
							</c:forEach>
						</c:otherwise>

					</c:choose>
				</div>
				<div class="input col-sm-3">
					<div align="center">
						<span style="font-size: 16pt">실시간 검색어</span>
					</div>
					<ul>
						<c:forEach items="${realRank}" var="item" varStatus="vs">
					${vs.count }위 <a href="/search/keyword?keyword=${item._id }"> <font
								color="#ff9400"> <span style="font-size: 14pt;">${item._id }</span></font></a>
							<br />
						</c:forEach>
					</ul>
				</div>
				<div class="input col-sm-3">
					<div align="center">
						<span style="font-size: 16pt">오늘의 맛집</span>
					</div>
					<ul>
						<c:forEach items="${todayRank}" var="item" varStatus="vs">
					${vs.count }위 <a href="/search/detail?tel=${item._id }"><font
								color="#ff9400"><span style="font-size: 14pt;">${item.title }</span></font></a>
							<br />
						</c:forEach>
					</ul>
				</div>
				<!--  -->
				<div class="input col-sm-3">
					<div align="center">
						<span style="font-size: 16pt">${wStatus}</span>
					</div>

					<ul>
						<c:forEach items="${weather_ecommend}" var="item" varStatus="vs">
						${vs.count }위 <a href="/search/detail?tel=${item.TEL }"><font
								color="#ff9400"><span style="font-size: 14pt;">${item.title }</span></font></a>
							<br />
						</c:forEach>
					</ul>

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
				style="position: absolute; top: 50%; left: 28%; margin-bottom: 250px; margin-top: 10px; padding-top: 30px; width: 45%; color: white; background-color: rgba(0, 0, 0, .5)"
				align="left">

				<div class="input col-sm-4">
					<div align="center">
						<span style="font-size: 16pt">실시간 검색어</span>
					</div>
					<ul>
						<c:forEach items="${realRank}" var="item" varStatus="vs">
					${vs.count }위 <a href="/search/keyword?keyword=${item._id }"><font
								color="#ff9400"><span style="font-size: 14pt">${item._id }</span></font></a>
							<br />
						</c:forEach>
					</ul>

				</div>

				<div class="input col-sm-4">
					<div align="center">
						<span style="font-size: 16pt">오늘의 맛집</span>
					</div>
					<ul>
						<c:forEach items="${todayRank}" var="item" varStatus="vs">
					${vs.count }위 <a href="/search/detail?tel=${item._id }"><font
								color="#ff9400"><span style="font-size: 14pt;">${item.title }</span></font></a>
							<br />
						</c:forEach>
					</ul>
				</div>
				<div class="input col-sm-4">
					<div align="center">
						<span style="font-size: 16pt">${wStatus}</span>
					</div>

					<ul>
						<c:forEach items="${weather_ecommend}" var="item" varStatus="vs">
						${vs.count }위 <a href="/search/detail?tel=${item.TEL }"><font
								color="#ff9400"><span style="font-size: 14pt;">${item.title }</span></font></a>
							<br />
						</c:forEach>
					</ul>

				</div>
			</div>

		</c:otherwise>
	</c:choose>

	<div class="main_search_area row col-md-offset-3 col-md-6"
		style="position: absolute; top: 78%;">
		<div class="input-group" style="width: 100%;">
			<form action="/search/keyword" method="get">
				<div class="col-md-10">
					<input onkeypress="if(event.keyCode==13) {$('#main_s_btn').trigger(‘click’);}" type="text" name="keyword" class="form-control"
						style="height: 45px; font-size: 16px; border: 4px solid; border-color: #ff9400;"
						placeholder="검색어 입력! 예) 강남역 수요미식회">
				</div>
				<div class="input-group-btn col-md-2">
					<button class="btn btn-default" type="submit" id="main_s_btn"
						style="height: 45px; width: 100px; font-size: 18px; border: 4px solid; border-color: #ff9400; background-color: #ff9400; color: white;">
						<span>Search</span>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>


