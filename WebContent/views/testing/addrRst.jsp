<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String addr = request.getParameter("addr");
		addr = addr.replaceAll("\\s", "");
	String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + addr
			+ "&key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&language=ko";
	// 요청보내는 방법은 꽤 많다.
	System.out.println(target);
	URL url = new URL(target);
	
	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
	String outstr = "";
	while (true) {
		String str = br.readLine();
		if (str == null)
			break;
		// out.println(str);
		outstr += str;
	}

	// out.println(outstr);
	Map map = new ObjectMapper().readValue(outstr, Map.class);
	request.setAttribute("json", map);
%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&callback=initMap"
	async defer></script>
Format Address : ${json.results[0].formatted_address } ..
<br />
lat : ${json.results[0].geometry.location.lat }
<br />
lng : ${json.results[0].geometry.location.lng }
<br />
<div id="map" style="width: 500; height: 500"></div>
<script>
	function initMap() {
	
		var pos = { lat : ${json.results[0].geometry.location.lat },
				lng : ${json.results[0].geometry.location.lng } };
		// Create a map object and specify the DOM element for display.
		var map = new google.maps.Map(document.getElementById('map'), {
			"center" : pos,
			"scrollwheel" : false,
			"zoom" : 15
		});
		var marker = new google.maps.Marker({
	          "map" : map,
	          "position" : pos,
	          "title" : '${param.addr}'
	    });
	}
</script>



