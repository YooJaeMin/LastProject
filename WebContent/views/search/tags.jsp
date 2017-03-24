<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.btn-box {
	background-color: black;
	color: yellow;
}
</style>
<div class="row col-md-offset-1 col-md-9" align="left">
	<h3>'${selectedTag }'(으)로 검색 결과</h3>
</div>

<div id="tags" class="row col-md-offset-1 col-md-9">
	<c:forEach items="${tagsList }" var="item">
		<form class="col-md-2" action="/search/tag">
				<input type="hidden" name="type" value="basic"/>
			<button class="btn btn-box" name="selectedTag" value="${item }">${item }</button>
		</form>
	</c:forEach>
</div>
<div id="location-list" class="row col-md-offset-1 col-md-9">
	<h2 align="center">태그 검색</h2>
	<c:choose>
		<c:when test="${result.size() eq 0 || result eq null}">
			<h3>0개검색</h3>
			<div class="item_container col-md-12">
				<h3 align="center">검색 결과가 없습니다.</h3>
			</div>
		</c:when>
		<c:otherwise>
			<h3>${result.size() }개검색</h3>
			<c:forEach items="${result }" var="item" begin="0" end="5"
				varStatus="vs">
				<div class="item_container col-md-6">
					<div class="col-md-6">
						<img class="img-box" src="${item.img[0] }">
					</div>
					<div class="col-md-6">
						<h3>
							<a href="/search/detail?tel=${item.tel }">${vs.count}. ${item.title }</a>
						</h3>
						<br />
						<c:forEach items="${item.tag }" var="tag" varStatus="vs">
							<a href="/search/tag?selectedTag=${tag }">${tag}</a>
						</c:forEach>
						<div>Like : ${item.hitCnt } / AVG : ${item.avg }</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<c:if test="${result.size() ne 0 && result ne null}">
	<div align="right">
		<a href="/search/tag?selectedTag=${selectedTag }&type=all">리스트 더보기</a>
	</div>
	</c:if>
</div>
