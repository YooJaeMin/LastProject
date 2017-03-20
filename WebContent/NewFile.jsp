<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap"
	async defer></script>

<div id="map" style="width: 500; height: 500"></div>
<script>
	function initMap() {
		
		// Create the map with no initial style specified.
		// It therefore has default styling.
		
		var pos0 = {
			'lat' : 37.4818785,
			'lng' : 126.8832991
		};
		
		var pos1 = {
			'lat' : 37.4662108,
			'lng' : 126.8870784
		};
		
		var pos2 = {
			'lat' : 37.4798346,
			'lng' : 126.8824997
		};
		
		var pos3 = {
			'lat' : 37.4798346,
			'lng' : 126.8824997
		};
		
		var pos4 = {
			'lat' : 37.4798346,
			'lng' : 126.8824997
		};
		
		var pos5 = {
			'lat' : 37.4798346,
			'lng' : 126.8824997
		};
		
		var pos6 = {
			'lat' : 37.4798346,
			'lng' : 126.8824997
		};
		
		var pos7 = {
			'lat' : 37.4667551,
			'lng' : 126.8881386
		};
		
		var pos8 = {
			'lat' : 37.4798346,
			'lng' : 126.8824997
		};
		
		var pos9 = {
			'lat' : 37.4794491,
			'lng' : 126.8874768
		};
		
		var pos10 = {
			'lat' : 37.479822,
			'lng' : 126.882187
		};
		
		// Create a map object and specify the DOM element for display.
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : 	pos0,
			"scrollwheel" : false,
			"zoom" : 15
		});
		
		var marker0 = new google.maps.Marker({
			"map" : map,
			"position" : pos0,
			"title" : '이태원포차'
		});
		var contentString0 = '서울특별시 금천구 가산동 43-1';
		var infowindow0 = new google.maps.InfoWindow({
			'content' : contentString0
		});
		marker0.addListener('click', function() {
			infowindow.open(map, marker0);
		});
		
		var marker1 = new google.maps.Marker({
			"map" : map,
			"position" : pos1,
			"title" : '용달통닭'
		});
		var contentString1 = '서울특별시 금천구 가산동 691-3';
		var infowindow1 = new google.maps.InfoWindow({
			'content' : contentString1
		});
		marker1.addListener('click', function() {
			infowindow.open(map, marker1);
		});
		
		var marker2 = new google.maps.Marker({
			"map" : map,
			"position" : pos2,
			"title" : '말뚝곱창'
		});
		var contentString2 = '서울특별시 금천구 가산동 371-28';
		var infowindow2 = new google.maps.InfoWindow({
			'content' : contentString2
		});
		marker2.addListener('click', function() {
			infowindow.open(map, marker2);
		});
		
		var marker3 = new google.maps.Marker({
			"map" : map,
			"position" : pos3,
			"title" : '새마을식당 가산점'
		});
		var contentString3 = '서울특별시 금천구 가산동 371-28';
		var infowindow3 = new google.maps.InfoWindow({
			'content' : contentString3
		});
		marker3.addListener('click', function() {
			infowindow.open(map, marker3);
		});
		
		var marker4 = new google.maps.Marker({
			"map" : map,
			"position" : pos4,
			"title" : '소공동뚝배기'
		});
		var contentString4 = '서울특별시 금천구 가산동 371-28';
		var infowindow4 = new google.maps.InfoWindow({
			'content' : contentString4
		});
		marker4.addListener('click', function() {
			infowindow.open(map, marker4);
		});
		
		var marker5 = new google.maps.Marker({
			"map" : map,
			"position" : pos5,
			"title" : '야끼화로'
		});
		var contentString5 = '서울특별시 금천구 가산동 371-28';
		var infowindow5 = new google.maps.InfoWindow({
			'content' : contentString5
		});
		marker5.addListener('click', function() {
			infowindow.open(map, marker5);
		});
		
		var marker6 = new google.maps.Marker({
			"map" : map,
			"position" : pos6,
			"title" : '포닭'
		});
		var contentString6 = '서울특별시 금천구 가산동 371-28';
		var infowindow6 = new google.maps.InfoWindow({
			'content' : contentString6
		});
		marker6.addListener('click', function() {
			infowindow.open(map, marker6);
		});
		
		var marker7 = new google.maps.Marker({
			"map" : map,
			"position" : pos7,
			"title" : '본스치킨 독산역점'
		});
		var contentString7 = '서울특별시 금천구 가산동 680';
		var infowindow7 = new google.maps.InfoWindow({
			'content' : contentString7
		});
		marker7.addListener('click', function() {
			infowindow.open(map, marker7);
		});
		
		var marker8 = new google.maps.Marker({
			"map" : map,
			"position" : pos8,
			"title" : '하시'
		});
		var contentString8 = '서울특별시 금천구 가산동 371-28';
		var infowindow8 = new google.maps.InfoWindow({
			'content' : contentString8
		});
		marker8.addListener('click', function() {
			infowindow.open(map, marker8);
		});
		
		var marker9 = new google.maps.Marker({
			"map" : map,
			"position" : pos9,
			"title" : '응급실국물떡볶이 가산점'
		});
		var contentString9 = '서울특별시 금천구 가산동 60-5';
		var infowindow9 = new google.maps.InfoWindow({
			'content' : contentString9
		});
		marker9.addListener('click', function() {
			infowindow.open(map, marker9);
		});
		
		var marker10 = new google.maps.Marker({
			"map" : map,
			"position" : pos10,
			"title" : '멘무샤'
		});
		var contentString10 = '서울특별시 금천구 가산동 371-28 우림라이온밸리 B동 B303호';
		var infowindow10 = new google.maps.InfoWindow({
			'content' : contentString10
		});
		marker10.addListener('click', function() {
			infowindow.open(map, marker10);
		});
		
	}
</script>
