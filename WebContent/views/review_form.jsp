<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
<link href='//fonts.googleapis.com/css?family=Coming Soon'
	rel='stylesheet'>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>

div {
	font-family: 'Coming Soon';
}

	.weather_box {
		width: 50px;
	}
	
	.rating {
			width: 226px;
			margin: 0 auto 1em;
			font-size: 45px;
			overflow:hidden;
		}
.rating input {
  float: right;
  opacity: 0;
  position: absolute;
}
	.rating a,
    .rating label {
			float:right;
			color: #aaa;
			text-decoration: none;
			-webkit-transition: color .4s;
			-moz-transition: color .4s;
			-o-transition: color .4s;
			transition: color .4s;
		}
.rating label:hover ~ label,
.rating input:focus ~ label,
.rating label:hover,
		.rating a:hover,
		.rating a:hover ~ a,
		.rating a:focus,
		.rating a:focus ~ a		{
			color: orange;
			cursor: pointer;
		}
		.rating {
			direction: rtl;
		}
		.rating a {
			float:none
		}
</style>

<div>
	<form action="/review/basic" method="post">
		<input type="hidden" name="id" value="${sessionScope.auth_id }" /> 
		<input type="hidden" name="tel" value="${store.tel }" />
		
	<div class="weather">
		<c:choose>
			<c:when test="${wStatus eq 'sunny'}">
				<img class="weather_box" src="/img_weather/sunny.png" />
			</c:when>
			<c:when test="${wStatus eq 'cloudy'}">
				<img class="weather_box" src="/img_weather/cloudy.png" />
			</c:when>
			<c:when test="${wStatus eq 'rainy'}">
				<img class="weather_box" src="/img_weather/rainy.png" />
			</c:when>
			<c:when test="${wStatus eq 'snowy'}">
				<img class="weather_box" src="/img_weather/snowy.png" />
			</c:when>
		</c:choose>
	</div>
	
	<div class="rating"><!--
			--><a href="#5" title="5 stars">★</a><!--
			--><a href="#4" title="4 stars">★</a><!--
			--><a href="#3" title="3 stars">★</a><!--
			--><a href="#2" title="2 stars">★</a><!--
			--><a href="#1" title="1 star">★</a>
	</div> 	
		<div class="rating"><!--
			--><a href="#5" title="5 stars">★</a><!--
			--><a href="#4" title="4 stars">★</a><!--
			--><a href="#3" title="3 stars">★</a><!--
			--><a href="#2" title="2 stars">★</a><!--
			--><a href="#1" title="1 star">★</a>
	</div> 
		<div class="rating"><!--
			--><a href="#5" title="5 stars">★</a><!--
			--><a href="#4" title="4 stars">★</a><!--
			--><a href="#3" title="3 stars">★</a><!--
			--><a href="#2" title="2 stars">★</a><!--
			--><a href="#1" title="1 star">★</a>
	</div> 
		<div class="rating"><!--
			--><a href="#5" title="5 stars">★</a><!--
			--><a href="#4" title="4 stars">★</a><!--
			--><a href="#3" title="3 stars">★</a><!--
			--><a href="#2" title="2 stars">★</a><!--
			--><a href="#1" title="1 star">★</a>
	</div> 



	</form>
</div>

