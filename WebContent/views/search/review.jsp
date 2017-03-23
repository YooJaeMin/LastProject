<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row font1" align="center">
	<c:forEach items="" var="item" begin="1" end="5" varStatus="vs">
		<div class="row font1">
			<div class="col-md-offset-1 col-md-3">${item.ID }</div>
			<div class="col-md-3">${item.EAT_DATE }</div>
			<div class="col-md-1">${item.HIT }</div>
			<div class="col-md-3">총점 / ${item.AVG_S }</div>
		</div>
		<div class="row font1">
			<div class="col-md-6">${item.TYPE }</div>
			<div class="col-md-6">${item.WEATHER }</div>
		</div>
		<div class="row font1">
			<div class="col-md-2">청결도</div>
			<div class="col-md-2">맛평가</div>
			<div class="col-md-2">가격평가</div>
			<div class="col-md-2">친절도</div>
			<div class="col-md-2">접근성</div>
		</div>
		<div class="row font1">
			<div class="col-md-2">${item.CLEAN_S }</div>
			<div class="col-md-2">${item.TASTE_S }</div>
			<div class="col-md-2">${item.PRICE_S }</div>
			<div class="col-md-2">${item.GOOD_S }</div>
			<div class="col-md-2">${item.LOCATION_S }</div>
		</div>
		<div class="row font1">
			<div class="col-md-12">평가</div>
		</div>
		<div class="row font1">
			<div class="col-md-12">${item.CONTENT }</div>
		</div>
	</c:forEach>
	<div class="row font1" align="right">
		<button class="btn" onclick="listMore()">리스트 더보기</button>
	</div>

	<div id="reviewList row font1" style="display: none">
		<c:forEach items="" var="item" varStatus="vs">
			<c:if test="${vs.count ge 6  }">
						<div class="row font1">
			<div class="col-md-offset-1 col-md-3">${item.ID }</div>
			<div class="col-md-3">${item.EAT_DATE }</div>
			<div class="col-md-1">${item.HIT }</div>
			<div class="col-md-3">총점 / ${item.AVG_S }</div>
		</div>
		<div class="row font1">
			<div class="col-md-6">${item.TYPE }</div>
			<div class="col-md-6">${item.WEATHER }</div>
		</div>
		<div class="row font1">
			<div class="col-md-2">청결도</div>
			<div class="col-md-2">맛평가</div>
			<div class="col-md-2">가격평가</div>
			<div class="col-md-2">친절도</div>
			<div class="col-md-2">접근성</div>
		</div>
		<div class="row font1">
			<div class="col-md-2">${item.CLEAN_S }</div>
			<div class="col-md-2">${item.TASTE_S }</div>
			<div class="col-md-2">${item.PRICE_S }</div>
			<div class="col-md-2">${item.GOOD_S }</div>
			<div class="col-md-2">${item.LOCATION_S }</div>
		</div>
		<div class="row font1">
			<div class="col-md-12">평가</div>
		</div>
		<div class="row font1">
			<div class="col-md-12">${item.CONTENT }</div>
		</div>
			</c:if>
		</c:forEach>
	</div>

</div>


<script>
	function listMore() {
		var x = document.getElementById('reviewList');
		if (x.style.display === 'none') {
			x.style.display = 'block';
			x.innerHTML = '리스트 닫기';
		} else {
			x.style.display = 'none';
			x.innerHTML = '리스트 더보기';
		}
	}
</script>