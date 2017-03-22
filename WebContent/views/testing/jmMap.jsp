<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap"
	async defer></script>

<c:forEach items="${list }" var ="item">
	${item.title }
</c:forEach>
<div id="map " style="width: 500; height: 500"></div>
<script>
	function initMap() {
		// Create the map with no initial style specified.
		// It therefore has default styling.
		var pos = {
			'lat' : 37.5145437,
			'lng' : 127.1065971
		};
		// Create a map object and specify the DOM element for display.
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : pos,
			"scrollwheel" : false,
			"zoom" : 15
		});
		var marker = new google.maps.Marker({
			"map" : map,
			"position" : pos,
			"title" : 'Hello'
		});
		var contentString = 'kkkk';
		var infowindow = new google.maps.InfoWindow({
			'content' : contentString
		});
		marker.addListener('click', function() {
			infowindow.open(map, marker);
		});
	}
</script>
