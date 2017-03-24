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
<<<<<<<
HEAD
.main_visual.item:not (.left ):not (.right ){
	-webkit-transition: 0s ease-in-out left;
	transition: 0s ease-in-out left
}

/* .input { */
/*    font-family: '나눔고딕'; */
/*    font-size: 10pt; */
/* } */
=======
.main_visual
.item
:not
 
(
.left
 
)
:not
 
(
.right
 
){
-webkit-transition
:
 
0
s
 
ease-in-out
 
left
;

	
transition
:
 
0
s
 
ease-in-out
 
left


}
>>>>>>>
branch 'master ' of https: //github.com /YooJaeMin/LastProject.git


 .input {
	font-family: '나눔고딕';
	font-size: 10pt;
}

.main_view {
	position: absolute;
	top: 60%;
	left: 35%;
	padding-bottom: 30px;
	padding-top: 30px;
}

.main_search_area {
	position: absolute;
	bottom: 0%;
	background-color: rgba(0, 0, 0, .5);
	padding-bottom: 16px;
	padding-top: 30px;
}

#main_visual {
	position: relative;
	height: 281px;
	width: 450px;
	margin: 0 auto;
}

#main_visual img {
	position: absolute;
	left: 0;
	-webkit-transition: opacity 1s ease-in-out;
	-moz-transition: opacity 1s ease-in-out;
	-o-transition: opacity 1s ease-in-out;
	transition: opacity 1s ease-in-out;
}

@
keyframes cf3FadeInOut { 0% {
	opacity: 1;
}

45%
{
opacity


:


1;
}
55%
{
opacity


:


0;
}
100%
{
opacity


:


0;
}
}
#main_visual img.top {
	animation-name: cf3FadeInOut;
	animation-timing-function: ease-in-out;
	animation-iteration-count: infinite;
	animation-duration: 10s;
	animation-direction: alternate;
}
</style>

<div class="main_visual"
	style="width: 100%; height: 100%; overflow: hidden; Opacity: 0.9; background-image: url(&amp;quot;./img/result.jpg&amp;quot;); background-size: cover;">
	<!--  -->

	<div align="center" style="color: white;">
		<img src="/img/spooncompass.png" width="50%" height="50%" />

	</div>




	<div class="main_view row"
		style="width: 35%; color: white; background-color: rgba(0, 0, 0, .5)"
		align="center">

		<div class="input col-sm-6" style="width: 50%; font-size: 18px">
			<ul>
				<c:forEach items="${realRank}" var="item">
					<li><a href="/search/keyword?keyword=${item._id }">${item._id }</a></li>
				</c:forEach>
			</ul>

		</div>

		<div class="input col-sm-6" style="width: 50%; font-size: 18px">

			<ul>
				<c:forEach items="${todayRank}" var="item">
					<li><a href="/search/keyword?keyword=${item._id }">${item._id }</a></li>
				</c:forEach>
			</ul>

		</div>
	</div>

	<div class="main_search_area row col-md-offset-2 col-md-8">
		<div class="input-group" style="width: 100%;">
			<form action="/search/keyword" method="get">
				<div class="col-md-10">
					<input type="text" name="keyword" class="form-control"
						style="height: 55px; font-size: 18px; border: 4px solid; border-color: #FFD700;"
						placeholder="지역명">
				</div>
				<div class="input-group-btn col-md-2">
					<button class="btn btn-default" type="submit"
						style="height: 55px; width: 120px; font-size: 18px; border: 4px solid; border-color: #FFD700; background-color: #FFD700; color: white;">
						<b>←</b>
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

