<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a, .dropbtn {
	display: inline-block;
	color: #FFD700;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
	background-color: #FF4500;
}

li.dropdown {
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>

<!-- font -->
<head>
<link href='//fonts.googleapis.com/css?family=Coming Soon'
	rel='stylesheet'>
<style>
body {
	font-family: 'Coming Soon';
	font-size: 18px;
}
</style>
</head>
<body>


	<ul>
		<!-- 웹 정보 -->
		<li class="dropdown"><a href="javascript:void(0)"
			class="dropbtn_1"><b>Spoon Compass</b></a>
			<div class="dropdown-content">
				<a href="about">About</a>
			</div></li>

		<!-- FAQ -->
		<li><a href="#faq"><b>FAQ</b></a></li>

		<!-- 회원정보/수정 -->
<c:choose>
			<c:when test="${sessionScope.loginCheck ne null}">
				<li class="dropdown"><a href="javascript:void(0)"
					class="dropbtn_2"><b>MyPage</b></a>
					<div class="dropdown-content">
						<a href="foodBucket">My List</a> <a href="userInfo">Info.</a> <a
							href="logOut">Logout</a>
					</div></li>
			</c:when>

		<!-- login&join-->
		<c:otherwise >
			<li><a href="join"><span class="glyphicon glyphicon-user"></span>
					Join us</a></li>
			<li><a href="longIn"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
		</c:otherwise>
</c:choose>

</ul>

</body>
</html>
