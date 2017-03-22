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
<br/>
<br/>
<br/>
<div align="center">
	<h2><span>회원정보</span></h2>
</div>
<br/>
<br/>
<div class="well row" style="size: 80px; margin: 0 250; padding: 0px 25px;">


	<c:forEach var="pic" items="${InfoR}">
		<!-- 12등분  -->
		<div class="col-md-3" align="center">
			<form action="/Mypage/pictureR" method="post"
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
			<form action="/Mypage/infoUpdate" method="post">
				<p>
					<b>ID</b><br /> <b>${map.ID}</b>
					<input type="hidden" name="id" value="${map.ID }">
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
					<b>MARRY</b><br /> <select name="marry" class="form-control">
						<option value="미혼" ${map.GENDER eq 'couple' ? 'selected' : ''}>couple</option>
						<option value="기혼" ${map.GENDER eq 'single' ? 'selected' : ''}>single</option>
					</select>

				</p>

				<p>
					<b>food preferency</b><br /><b>${map.FAVOR}</b><hr/>
					
					<c:forEach var="tg" items="${taglist}">
					<input type="checkbox" name="preferency" id="opta" value="${tg}"/> 
						<span class="checkboxtext">${tg} &nbsp;&nbsp; </span>
					</c:forEach>
					
				</p>
				<br />
				<p>
					<button type="submit" class="btn">변경하기</button>
				</p>
			</form>

		</div>
	</c:forEach>
</div>

