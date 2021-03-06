<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<html>
<title><tiles:getAsString name="title" /></title>
<!-- getAsString 출력용 -->
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/earlyaccess/hanna.css"
	rel="stylesheet" type="text/css">
<body>
	<div>
		<tiles:insertAttribute name="nav" />
	</div>
	<div style="min-height: 90%; padding-right: 20%; padding-left: 20%; margin:5%">
		<tiles:insertAttribute name="main" />
	</div>
	<div style="min-height: 5%">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>



