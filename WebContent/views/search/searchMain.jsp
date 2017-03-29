<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body {
	font-family: 'Hanna', sans-serif;
}

.item_container {
	border-style: double;
	border-radius: 10px;
	height: 230px;
	border-color: white;
}

#tags {
	border-style: double;
	border-radius: 10px;
	border-color: #FE9A2E;
	padding: 10px;
}

a {
	color: black;
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
	color: #ffd700;
}

.score-box {
	
}
</style>
<div class="row">
	<div class="col-md-offset-1 col-md-10" align="left">
		<h3>
			'<span style="background-color: #ff9400; color: white; padding: 3px;">${keyword }</span>'(으)로
			검색 결과
		</h3>
	</div>
	<div class=""></div>
</div>
<div class="row">
	<div id="tags" class="col-md-offset-1 col-md-10">
		<c:forEach items="${tagsList }" var="item">
			<form class="col-md-2" action="/search/tag?type=basic">
				<input type="hidden" name="type" value="basic" />
				<button class="btn btn-box" name="selectedTag" value="${item }">#${item
					}</button>
			</form>
		</c:forEach>
	</div>
	<div class="col-md-1"></div>
</div>

<div class="row">
	<div id="location-list" class="col-md-offset-1 col-md-10">
		<h2 align="center">위치 검색</h2>

		<c:choose>
			<c:when
				test="${locationResult.size() eq 0 || locationResult eq null }">
				<h3>0개검색</h3>
				<div class="item_container col-md-12">
					<h3 align="center">검색 결과가 없습니다.</h3>
				</div>
			</c:when>
			<c:otherwise>
				<h3>${locationResult.size() }개검색</h3>
				<c:forEach items="${locationResult }" var="item" begin="0" end="5"
					varStatus="vs">
					<div class="item_container col-md-6">
						<div class="col-md-6">
							<img class="img-box" src="${item.img[0] }">
						</div>
						<div class="col-md-6">
							<h3>

								<a href="/search/detail?tel=${item.tel }">${vs.count}.
									${item.title }</a>
							</h3>
							<br />
							<c:forEach items="${item.tag }" var="tag" varStatus="vs">
								<a href="/search/tag?type=basic&selectedTag=${tag }">${tag}</a>
							</c:forEach>
							<div><span style="color: pink;">♥</span> ${item.hitCnt }  &  <span style="color: #FA5882">${item.avg } Score</span></div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${locationResult.size() ne 0 && locationResult ne null}">
			<div align="right" style="font-size: 20px;">
				<a href="/search/list?keyword=${keyword }&type=location">리스트 더보기</a>
			</div>
		</c:if>
	</div>
	<div class="col-md-1"></div>
</div>
<hr>
<div class="row">
	<div id="title-list" class="col-md-offset-1 col-md-10">
		<h2 align="center">상호명 검색</h2>

		<c:choose>
			<c:when test="${titleResult.size() eq 0 || titleResult eq null}">
				<h3>0개검색</h3>
				<div class="item_container col-md-12">
					<h3 align="center">검색 결과가 없습니다.</h3>
				</div>
			</c:when>
			<c:otherwise>
				<h3>${titleResult.size() }개검색</h3>
				<c:forEach items="${titleResult }" var="item" begin="0" end="5"
					varStatus="vs">
					<div class="item_container col-md-6">
						<div class="col-md-6">
							<img class="img-box" src="${item.img[0] }">
						</div>
						<div class="col-md-6">
							<h3>
								<a href="/search/detail?tel=${item.tel }">${vs.count}.
									${item.title }</a>
							</h3>
							<br />
							<c:forEach items="${item.tag }" var="tag" varStatus="vs">
								<a href="/search/tag?type=basic&selectedTag=${tag }">${tag}</a>
							</c:forEach>
							<div><span style="color: pink;">♥</span> ${item.hitCnt }  &  <span style="color: #FA5882">${item.avg } Score</span></div>
						</div>

					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${titleResult.size() ne 0 && titleResult ne null}">
			<div align="right" style="font-size: 20px;">
				<a href="/search/list?keyword=${keyword }&type=title">리스트 더보기</a>
			</div>
		</c:if>

	</div>
	<div class="col-md-1"></div>
</div>
