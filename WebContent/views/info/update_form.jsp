<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
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

.jumbotron {
    color: #ffffff;
    font-family: 'Lobster';
    background-color: #ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}
</style>


<div class="jumbotron" align="center" style="margin-bottom: 0px">
	<h1>My Account</h1>
</div>
<br />
<br />
<div class="well row"
	style="size: 80px; margin: 0 250; padding: 0px 25px;">


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
					<b>ID</b><br /> <b>${map.ID}</b> <input type="hidden" name="id"
						value="${map.ID }">
				</p>
				<p>
					<b>NICK</b><br /> <input type="text" class="form-control"
						name="nick" value="${map.NICK}" />
				</p>

				<p>
				<div>
					<b>BIRTH</b> <input type="text" class="form-control" name=birth
						id="datepicker1" value="${map.BIRTH}" />
				</div>

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
					<b>food preferency</b><br /> <b>${map.FAVOR}</b>
				<hr />
				<p>
					<c:forEach var="tg" items="${taglist}" varStatus="vs">
						<input onclick="checkCHK()" type="checkbox" name="preferency"
							id="${tg}" value="${tg}" />
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

<script>
	var x = $
	{
		DateR
	};

	console.log(x);
	if (x != null) {
		for ( var xr in x) {
			if (xr == '한식') {
				$("input:checkbox[id='한식']").prop("checked", true);
			} else if (xr == '중식') {
				$("input:checkbox[id='중식']").prop("checked", true);
			} else if (xr == '일식') {
				$("input:checkbox[id='일식']").prop("checked", true);
			} else if (xr == '카페') {
				$("input:checkbox[id='카페']").prop("checked", true);
			} else if (xr == '술집') {
				$("input:checkbox[id='술집']").prop("checked", true);
			} else if (xr == '고기집') {
				$("input:checkbox[id='고기집']").prop("checked", true);
			} else if (xr == '횟집') {
				$("input:checkbox[id='횟집']").prop("checked", true);
			} else if (xr == '해산물') {
				$("input:checkbox[id='해산물']").prop("checked", true);
			} else if (xr == '밥집') {
				$("input:checkbox[id='밥집']").prop("checked", true);
			} else if (xr == '분식') {
				$("input:checkbox[id='분식']").prop("checked", true);
			} else if (xr == '파스타') {
				$("input:checkbox[id='파스타']").prop("checked", true);
			} else if (xr == '뷔페') {
				$("input:checkbox[id='뷔페']").prop("checked", true);
			} else if (xr == '국물요리') {
				$("input:checkbox[id='국물요리']").prop("checked", true);
			} else if (xr == '면요리') {
				$("input:checkbox[id='면요리']").prop("checked", true);
			} else if (xr == '이탈리안') {
				$("input:checkbox[id='이탈리안']").prop("checked", true);
			} else if (xr == '멕시칸') {
				$("input:checkbox[id='멕시칸']").prop("checked", true);
			} else if (xr == '프렌치') {
				$("input:checkbox[id='프렌치']").prop("checked", true);
			} else if (xr == '아시안') {
				$("input:checkbox[id='아시안']").prop("checked", true);
			}
		}
	}

	$(function() {
		$("#datepicker1").datepicker(
				{
					yearRange : "-100:+0",
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					yearSuffix : '년'
				});
	});

	function checkCHK() {

	}
</script>

