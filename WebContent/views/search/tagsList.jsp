<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
hr {
	border: solid 2px #F5ECCE;
}

body {
	font-family: 'Hanna', sans-serif;
}

.item_container {
	border-style: double;
	border-color: #FE9A2E;
	border-radius: 10px;
	height: 230px;
}

#tags {
	border-style: double;
	border-color: #FE9A2E;
	border-radius: 10px;
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

.now-box {
	margin: 1px;
	background-color: pink;
	color: white;
}
</style>
<div class="row col-md-offset-1 col-md-10" align="left">
	<h3>'${selectedTag }'(으)로 검색 결과</h3>
</div>

<div id="tags" class="row col-md-offset-1 col-md-10">
	<c:forEach items="${tagsList }" var="item">
		<form class="col-md-2" action="/search/tag">
			<input type="hidden" name="type" value="basic" />
			<button class="btn btn-box" name="selectedTag" value="${item }">#${item }</button>
		</form>
	</c:forEach>
</div>
<div id="location-list" class="row col-md-offset-1 col-md-10">
	<h2 align="center">태그 검색</h2>
	<h3>${result.size() }개검색</h3>
	<c:choose>
		<c:when test="${result.size() eq 0}">
			<div class="item_container col-md-12">
				<h3 align="center">검색 결과가 없습니다.</h3>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${result }" var="item" varStatus="vs">
				<c:if test="${vs.count ge page*10-10+1 && vs.count le page*10  }">
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
								<a href="/search/tag?selectedTag=${tag }">${tag}</a>
							</c:forEach>
							<div>Like : ${item.hitCnt } / AVG : ${item.avg }</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
<div class="row col-md-offset-1 col-md-10 ">
	<div align="center" class="number-box">
		<div class="col-md-1">
			<c:if test="${!(page le 10) }">

				<a
					href="/search/tag?selectedTag=${selectedTag }&type=all&page=${page%10 eq 0 ? page-10 : page-page%10 }">이전</a>
			</c:if>
		</div>

		<c:forEach begin="${page%10 eq 0 ? page-9 : page-page%10+1 }"
			end="${page%10 eq 0 ? page : page-page%10+10  }" varStatus="vs"
			var="item">
			<c:if test="${item le max }">
				<c:choose>
					<c:when test="${item eq page }">
						<div class=" col-md-1">
							<a class="btn now-box">${item }</a>
						</div>
					</c:when>
					<c:otherwise>
						<form action="/search/tag">
							<input type="hidden" name="selectedTag" value="${selectedTag }">
							<input type="hidden" name="type" value="all">
							<div class=" col-md-1">
								<button name="page" class="btn btn-box" value="${item }">${item }</button>
							</div>
						</form>
					</c:otherwise>
				</c:choose>

			</c:if>
		</c:forEach>
		<div class="col-md-1">
			<c:if test="${result.size() gt 100 }">
				<c:if test="${page le (max%10 eq 0 ? max-10 : max-max%10 ) }">
					<a
						href="/search/tag?selectedTag=${selectedTag }&type=all&page=${page%10 eq 0 ? page+1 : page-(page%10)+11 }">다음</a>
				</c:if>
			</c:if>
		</div>
	</div>
</div>
<div class="col-md-1"></div>
