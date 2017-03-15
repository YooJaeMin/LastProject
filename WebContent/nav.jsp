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

<!-- modal login -->
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  </style>
</head>

<!-- -------------------------------------------------------------------------------- -->
<body>


	<ul>
		<!-- 웹 정보 -->
		<li class="dropdown"><a href="javascript:void(0)" class="dropbtn">
			<b>Spoon Compass</b></a>
			<div class="dropdown-content">
				<a href="about.jsp">About</a>
			</div></li>

		<!-- FAQ -->
		<li><a href="faq.jsp"><b>FAQ</b></a></li>

	<c:choose>
			<c:when test="${sessionScope.auth ne null}">
				<li class="dropdown pull-right"><a href="javascript:void(0)" class="dropbtn2">
				<b>(${auth_id})</b></a>
					<div class="dropdown-content">
						<a href="foodBucket.jsp">나의 먹킷리스트</a> 
						<a href="userInfo.jsp">회원정보</a> 
						<a href="logout.jsp">Logout</a>
					</div></li>
			</c:when>
			
			<c:otherwise >
				<li class="pull-right"><a href="join.jsp"><span class="glyphicon glyphicon-user"></span>
						<b>Join us</b></a></li>
				<li class="pull-right"><a href="javascript:login()"><span class="glyphicon glyphicon-log-in"></span>
						<b>Login</b></a></li>
						<script>
							function logIn(){
								window.open("/login.jsp","c","width=350, height=500, left=500");
							}
						</script>
			</c:otherwise>
</c:choose>

</ul>

</body>
</html>