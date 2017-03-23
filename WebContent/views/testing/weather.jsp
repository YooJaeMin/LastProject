<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/msdropdown/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/msdropdown/jquery.dd.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/msdropdown/dd.css" />
<!-- ${weather.status}	 	-->
<!-- ${weather.temp}		-->

<style>
	.weather_box {
		width: 50px;
	}
</style>
<div>
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

<div class="weatherBtn">
		<input type="radio" name="weather" value="sunny">
			<img src="/img_weather/sunny.png"/>
		<input type="radio" name="weather" value="cloudy">
			<img src="/img_weather/cloudy.png"/>
		<input type="radio" name="weather" value="rainy">
			<img src="/img_weather/rainy.png"/>
			<input type="radio" name="weather" value="snowy">
			<img src="/img_weather/snowy.png"/>
</div>
