<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<title><tiles:getAsString name="title" /></title>
<!-- getAsString 출력용 -->
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<body>
	<div  style="min-height: 5%">
		<tiles:insertAttribute name="nav" />
	</div>
	<div  style="min-height: 20%">
		<tiles:insertAttribute name="map" />
	</div>
	<div style="min-height: 70%;">
		<tiles:insertAttribute name="main" />
	</div>
	<div style="min-height: 4%">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>


