<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style type="text/css">
input[type=checkbox] {
	/* Double-sized Checkboxes */
	-ms-transform: scale(2); /* IE */
	-moz-transform: scale(2); /* FF */
	-webkit-transform: scale(2); /* Safari and Chrome */
	-o-transform: scale(2); /* Opera */
	padding: 10px;
}

/* Might want to wrap a span around your checkbox text */
.checkboxtext {
	/* Checkbox text */
	font-size: 110%;
	display: inline;
}
</style>


<div>
	<h3>회원정보</h3>
</div>

<div class="well row" style="size: 80px;">


	<c:forEach var="pic" items="${InfoR}">
		<!-- 12등분  -->
		<div class="col-md-3" align="center">
			<form action="/my/update_picture.jsp" method="post"
				enctype="multipart/form-data">
				<b>PICTURE</b><br /> <img src="${pic.PROFILE}" width="200"
					height="200" style="border-radius: 100px;" />
				<hr />
				<input type="file" class="form-control" name="pic" /> <br />
				<button type="submit" class="btn">사진변경</button>
			</form>
		</div>
	</c:forEach>

	<c:forEach var="map" items="${InfoR}">
		<div class="col-md-9">
			<form action="/my/update_pictureR.jsp" method="post">
				<p>
					<b>ID</b><br /> <input type="text" class="form-control" disabled
						name="id" value="${map.ID}" />
				</p>
				<p>
					<b>NICK</b><br /> <input type="text" class="form-control"
						name="nick" value="${map.NICK}" />
				</p>

				<p>

					<b>BIRTH</b><br /> <input type="text" class="form-control"
						name=birth value="${map.BIRTH}" />

				</p>
				<p>
					<b>GENDER</b><br /> <select name="gender" class="form-control">
						<option value="M" ${map.GENDER eq 'M' ? 'selected' : ''}>남</option>
						<option value="F" ${map.GENDER eq 'F' ? 'selected' : ''}>여</option>
					</select>
				</p>
				<p>
					<b>MARRY</b><br /> <select name="MARRY" class="form-control">
						<option value="미혼" ${map.GENDER eq 'couple' ? 'selected' : ''}>couple</option>
						<option value="기혼" ${map.GENDER eq 'single' ? 'selected' : ''}>single</option>
					</select>

				</p>

				<p>
					<b>food preferency</b><br /> <br/>
					<c:forEach var="tg" items="${taglist}">
					<input type="checkbox" name="preferency" id="opta" value="${tg}"/> 
						<span class="checkboxtext">${tg} &nbsp;&nbsp; </span>
					</c:forEach>
					
				</p>
				<br />
				<p>
					<a href="/my/leave.jsp"><button type="button" class="btn">탈퇴하기</button></a>
					<button type="submit" class="btn">변경하기</button>
				</p>
			</form>

		</div>
	</c:forEach>
</div>

