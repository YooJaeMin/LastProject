<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row font2">
	블로그 검색 결과 총 ${blog.total }개
	<hr />
</div>
<c:forEach items="${blog.itemList }" var="item" varStatus="vs">
	<div class="row">
		<div class="col-md-6" align="left">
			<a href="${item.link }">${item.title }</a>
		</div>
		<div class="col-md-6" align="right">
			<div class="col-md-6">post date. ${item.postdate }</div>
			<div class="col-md-6">write by. ${item.bloggername }</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			${item.description }
		</div>
	</div>
</c:forEach>
<div class="row">
	<c:forEach varStatus="vs" begin="1" end="${blog.total % 10 eq 0 ? blog.total/10 : blog.total/10 +1 }">
		${vs.count }
	</c:forEach>
</div>