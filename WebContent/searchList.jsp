<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
.item_container {
	border-style: solid;
	border-color: #FE9A2E;
	height: 230px;
}

#tags {
	border-style: solid;
	border-color: #FE9A2E;
}

.img-box {
	margin: 10px;
	width: 250px;
	height: 200px;
	border-radius: 8px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>
<div class="row col-md-offset-1 col-md-9" align="left">
	<h3>'${keyword }'을(를) ${type }(으)로 검색 결과</h3>
</div>

<div id="tags" class="row col-md-offset-1 col-md-9">
	<c:forEach items="${tagsList }" var="item">
		<form class="col-md-2" action="/search/tag?type=basic">
			<button class="btn" name="selectedTag" value="${item }">${item }</button>
		</form>
	</c:forEach>
</div>


<div id="location-list" class="row col-md-offset-1 col-md-9">
	<h2 align="center">위치 검색</h2>
	<h3>${result.size() }개검색</h3>
	<c:forEach items="${result }" var="item" varStatus="vs">
		<div class="item_container col-md-6">
			<div class="col-md-6">
				<img class="img-box" src="${item.img[0] }">
			</div>
			<div class="col-md-6">
				<h3>
					<a href="#">${vs.count}. ${item.title }</a>
				</h3>
				<br />
				<c:forEach items="${item.tag }" var="tag" varStatus="vs">
					<a href="#">${tag}</a>
				</c:forEach>
				<div>Like : ${item.hitCnt } / AVG : ${item.avg }</div>
			</div>
		</div>
	</c:forEach>
</div>