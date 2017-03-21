<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<div>
	<h3>회원정보</h3>
</div>

<div class="well row" style="size:80px;">


<%-- <c:forEach var="pic" items="${pictureResult}"> --%>
	<!-- 12등분  -->
	<div class="col-md-3" align="center">
		<form action="/my/update_picture.jsp" method="post"
			enctype="multipart/form-data">
				<b>PICTURE</b><br /> <img src="${pic.URL}" width="200" height="200"
				style="border-radius: 100px;" />
			<hr />
			<input type="file" class="form-control" name="pic" /> <br />
			<button type="submit" class="btn">사진변경</button>
		</form>
	</div>
<%-- </c:forEach> --%>
<%-- <c:forEach var="map" items="${infoResult}"> --%>
	<div class="col-md-9">
		<form action="/my/update_pictureR.jsp" method="post">
			<p>
				<b>NAME</b><br /> <input type="text" class="form-control"
					name="name" value="${map.NAME}" />
			</p>
			<p>
				
				<b>AGE</b><br />
						${map.AGE}세 

			</p>
			<p>
				<b>GENDER</b><br /> <select name="gender" class="form-control">
					<option value="male"
						${map.GENDER eq 'male' ? 'selected' : ''}>남</option>
					<option value="female"
						${map.GENDER eq 'female' ? 'selected' : ''}>여</option>
				</select>
			</p>
			<p>
				<b>E-MAIL</b><br /> <input type="email" class="form-control"
					name="email" value="${map.EMAIL}" />
			</p>
			<br />
			<p>
				<a href="/my/leave.jsp"><button type="button" class="btn">탈퇴하기</button></a>
				<button type="submit" class="btn">변경하기</button>
			</p>
		</form>
		
	</div>
<%-- </c:forEach> --%>
</div>

