<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.mainpic {
	width: 100%;
	height: 70%;
	overflow: hidden;
}

.title {
	font-weight: bold;
	font-size: 2.2em;
	font-family: 나눔고딕;
	line-height: 1.3em;
}

.location {
	font-size: 1.5em;
	color: grey;
}

.line {
	padding-top: 2%;
	border-bottom-style: solid;
	border-bottom-width: 1.5px;
	border-bottom-color: black;
	margin-top: 10px;
}

.point1 {
	background-image: url('/icon/star_off.png');
	width: 120px;
	height: 30px;
}

.point2 {
	overflow: hidden;
	width: 0%;
}

.point2_r {
	overflow: hidden;
}

.icon {
	width: 60px;
	height: 60px;
}

.font1 {
	font-size: 1.2em;
	line-height: 1.9em;
}

.font2 {
	font-size: 1.7em;
}

.font3 {
	font-size: 0.7em;
}

.profile {
	overflow: hidden;
	width: 70px;
	height: 70px;
	border-radius: 50%;
}

.modal1 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content1 {
	background-color: #fefefe;
	margin-right: 30%;
	margin-left: 30%;
	padding: 5%;
	border: 1px solid #888;
}

/* The Close Button */
.close1 {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.btn {
	border-style: soild;
	border-width: 2px;
	border-color: black;
	background-color: white;
	font-weight: bold;
}
</style>

<div
	style="padding-top: 5%; margin: 0 250; padding-right: 25px; padding-left: 25px;">

	<span class="title">${store.title }</span> <br />

	<div class="row">
		<div class="col-md-8">
			<div class="location">
				${store.adress } <span style="font-size: 0.8em;"> <br/>
				<c:forEach items="${store.tag }" var="tag">
					#${tag }
				</c:forEach>
				</span>
				<div class="point1">
					<div class="point2">
						<img src="/icon/star_on.png" width="120px" height="30px">
					</div>
				</div>
			</div>
		</div>

	</div>

	<hr class="line" />
	<div class="row" align="center">
		<div class="col-md-3">
			<img src="/views/search/images/store_red.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/food_red.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/list_red.png" class="icon">
		</div>
		<div class="col-md-3">
			<img src="/views/search/images/clock_red.png" class="icon">
		</div>
	</div>

	<div class="row font1" align="center">
		<div class="col-md-3"><c:forEach items="${store.type }" var="type">${type } </c:forEach> </div>
		<div class="col-md-3"><c:forEach items="${store.item }" var="item">${item } </c:forEach></div>
		<div class="col-md-3"><c:forEach items="${store.parking }" var="parking">${parking } </c:forEach></div>
		<div class="col-md-3"><c:forEach items="${store.time }" var="time">${time }<br/></c:forEach></div>
	</div>
	<hr />
	<div class="font2">상세설명</div>
	<hr />
	<!-- 숙소 -->
	<div class="row font1">
		<div class="col-md-4" style="font-weight: bold;">숙소</div>
		<div class="col-md-4">
			집 유형: 집전체<br /> 숙박 가능 인원: 3<br /> 방 개수: 1<br /> 침대 개수: 1<br />
		</div>
		<div class="col-md-4">
			체크인: 2017-03-17 00:00:00.0<br /> 체크아웃: 2017-03-28 00:00:00.0<br />
		</div>
	</div>
	<hr />
	<!-- 시설 -->
	<div class="row font1">
		<div class="col-md-4" style="font-weight: bold;">편의</div>
		<div class="col-md-8">
			TV, 세탁기, 수건, 드라이기<br />
		</div>

	</div>
	<hr />
	<!-- 가격 -->
	<div class="row font1">
		<div class="col-md-4" style="font-weight: bold;">가격</div>
		<div class="col-md-4">주중 90000원</div>
		<div class="col-md-4">주말 110000원</div>
	</div>

	<hr />
	<!-- 설명 -->
	<div class="row font1">
		<div class="col-md-4" style="font-weight: bold;">설명</div>
		<div class="col-md-8">깨끗히 사용하고 예의범절을 지켜줬으면 좋겠습니다.</div>
	</div>
	<hr />
	<!-- 규칙 -->
	<div class="row font1">
		<div class="col-md-4" style="font-weight: bold;">규칙</div>
		<div class="col-md-8">4호선 지하철역에서 도보로 7분거리에 있어 서울 각지에 이동하기 편리합니다.
			또한 주변에 서울대공원, 경마공원, 과천과학과, 국립현대미술관 등 유익한 관광지가 많이 있습니다. 원룸형태이며 침대는
			사용하기 전날 원룸으로 옮겨드립니다.</div>
	</div>

	<hr />
	<div class="row font2">
		사진
		<hr />
	</div>

	<div class="row" align="center">


		<img
			src="https://a0.muscache.com/im/pictures/10356601/100d72b9_original.jpg?aki_policy=x_large"
			width="70%"> <br /> <br /> <br /> <img
			src="https://a0.muscache.com/im/pictures/10356552/b9aa6c5b_original.jpg?aki_policy=x_large"
			width="70%"> <br /> <br /> <br /> <img
			src="https://a0.muscache.com/im/pictures/10356396/88dbba65_original.jpg?aki_policy=x_large"
			width="70%"> <br /> <br /> <br /> <img
			src="https://a0.muscache.com/im/pictures/10356334/a831e142_original.jpg?aki_policy=xx_large"
			width="70%"> <br /> <br /> <br />

	</div>

	<!-- 리뷰 -->
	<hr />
	<div class="row">
		<div class="col-md-3">
			<div class="font2">
				후기 0개 <span class="font3">0.0점</span>
			</div>
		</div>
		<div class="col-md-5" align="left">

			<div class="point1">
				<div class="point2">
					<img src="/icon/star_on.png" width="120px" height="30px">
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<button id="myBtn1" class="btn">후기등록</button>
		</div>


	</div>
	<hr />



	후기가 없다.




</div>

<!-- =============================== -->

<!-- Trigger/Open The Modal -->

<!-- The Modal -->
<div id="myModal1" class="modal1">

	<!-- Modal content -->
	<div class="modal-content1">
		<span class="close1">&times;</span>
		<div align="center">
			<h2>후기 등록</h2>
			<br /> <br />
			<form action="/view/review/result" method="get">
				<textarea rows="5" cols="80" id="content" class="form-control"
					placeholder="후기를 입력해주세요"></textarea>
				<br /> <br />
				<button type="submit"
					style="background-color: white; border-style: solid; border-color: orange; border-width: 2px;">등록</button>
			</form>
		</div>
	</div>

</div>
<script>
	// Get the modal
	var modal1 = document.getElementById('myModal1');

	// Get the button that opens the modal
	var btn1 = document.getElementById("myBtn1");

	// Get the <span> element that closes the modal
	var span1 = document.getElementsByClassName("close1")[0];

	// When the user clicks the button, open the modal 
	btn1.onclick = function() {
		modal1.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span1.onclick = function() {
		modal1.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal1) {
			modal1.style.display = "none";
		}
	}
</script>
