<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap"
	async defer></script>
<style>
#map {
	width:100%;
	height : 30%;
}
</style>
<div id="map"></div>
<script>
	function initMap() {
		// Create a map object and specify the DOM element for display.

		// Create the map with no initial style specified.
		// It therefore has default styling.
		var posSpecial= {
				'lat' : 37.49794199999999,
				'lng' : 127.027621
			};
		
		<c:forEach items="${locationResult }" var="item" begin="0" end="10" varStatus="vs">
		var pos${vs.index} = {
			'lat' : ${item.lat},
			'lng' : ${item.lng}
		};
		</c:forEach>

		<c:choose>
		<c:when test="${locationResult.size() eq 0 }">
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : 	posSpecial,
			"scrollwheel" : false,
			"zoom" : 15
		});
		</c:when>
		<c:otherwise>
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : 	pos0,
			"scrollwheel" : false,
			"zoom" : 15
		});
		</c:otherwise>
	</c:choose>


		<c:forEach items="${locationResult }" var="item" begin="0" end="10" varStatus="vs">
		var marker${vs.index} = new google.maps.Marker({
			"map" : map,
			"position" : pos${vs.index},
			"title" : '${item.title}'
		});
		var contentString${vs.index} = '${item.adress}';
		var infowindow${vs.index} = new google.maps.InfoWindow({
			'content' : contentString${vs.index}
		});
		marker${vs.index}.addListener('click', function() {
			infowindow${vs.index}.open(map, marker${vs.index});
		});
		</c:forEach>
	}
</script>


