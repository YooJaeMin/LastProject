<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap"
	async defer></script>
<style>
#map {
	width: 100%;
	height: 30%;
	font-family: 'Hanna', sans-serif;
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
		
		<c:forEach items="${result }" var="item" varStatus="vs">
		var pos${vs.index} = {
			'lat' : ${item.lat},	
			'lng' : ${item.lng}
		};
		</c:forEach>

		<c:choose>
		<c:when test="${result.size() eq 0 }">
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : 	posSpecial,
			"scrollwheel" : true,
			"zoom" : 15
		});
		</c:when>
		<c:otherwise>
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : 	pos0,
			"scrollwheel" : true,
			"zoom" : 15
		});
		</c:otherwise>
	</c:choose>

// 		var image = {
// 				  url: "https://img.clipartfest.com/ba1ac63fd2ee320732b4b2ad6f6a5fec_spoon-clipart-spoon-clipart-png_246-587.png",
// 				  size: new google.maps.Size(100, 100),
// 				  origin: new google.maps.Point(0, 0),
// 				  anchor: new google.maps.Point(17, 34),
// 				  scaledSize: new google.maps.Size(40, 60)
// 				};
		<c:forEach items="${result }" var="item" varStatus="vs">
		var marker${vs.index} = new google.maps.Marker({
			"map" : map,
			"position" : pos${vs.index},
			"title" : '${item.title}',
// 			"icon": image
		});
		
		var contentString${vs.index} =
			'<span style="font-family: Hanna, sans-serif, black;"><span style="font-size: 17pt; bold;">${item.title }</span><br/>'+
			'${item.adress }<br/>'+
			'☏ ${item.tel }<br/></span>'+
			'<div style="font-family: Hanna, sans-serif; color : #FA5882;" align="right">${item.avg } Score</div>';
			
		var infowindow${vs.index} = new google.maps.InfoWindow({
			'content' : contentString${vs.index},
			'maxWidth': 200
		});
		marker${vs.index}.addListener('click', function() {
			infowindow${vs.index}.open(map, marker${vs.index});
		});
		</c:forEach>
	}
</script>



