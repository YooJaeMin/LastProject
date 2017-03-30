<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<title><tiles:getAsString name="title" /></title>
<!-- getAsString 출력용 -->
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/earlyaccess/hanna.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/hanna.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<style type="text/css">
	.main_title {
		font-family: hanna;
		font-size: 2em;
		padding: 5px;
		background-color: #ff9400;
		color: white;
	}
	.main_small_title {
		font-family: hanna;
		font-size: 1.5em;
		padding: 3px;
		background-color: #ff9400;
		color: white;
	}
	.main_content {
		font-family: hanna;
		font-size: 1.2em;
	}
</style>
<body>
	<div style="height: 1.4cm;">
		<tiles:insertAttribute name="nav" />
	</div>

	<div class="row" style="padding-top:1cm ; padding-left: 6cm; padding-right: 6cm; padding-bottom: 1cm;">
		<tiles:insertAttribute name="main" />
	</div>
	<div class="row" style="bottom: 0%; position: absolute;">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>
