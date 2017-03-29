<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html style="overflow: hidden;">
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
<body>
	<div style="height: 1.3cm;">
		<tiles:insertAttribute name="nav" />
	</div>
	<div id="bg-all" style="style=width: 100%; height: 94%; overflow: hidden; Opacity: 0.9; background-size: cover;">
		<div class="main_body" style="min-height: 90%;">
			<tiles:insertAttribute name="main" />
		</div>
		<div style="min-height: 3%">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	<script>
		var header = $('#bg-all');

		var backgrounds = new Array('url(/img/main33.jpg)',
				'url(/img/main111.jpg)', 'url(/img/main22.jpg)',
				'url(/img/main44.jpg)');

		var current = 0;
		header.css('background-image', backgrounds[0]);
		function nextBackground() {
			current++;
			current = current % backgrounds.length;

			header.css('background-image', backgrounds[current]);

		}
		setInterval(nextBackground, 7000);


	</script>

</body>
</html>
