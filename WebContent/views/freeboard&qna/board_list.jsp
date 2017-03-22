<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<link href='//fonts.googleapis.com/css?family=Coming Soon'
	rel='stylesheet'>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
div {
	font-family: 'Coming Soon';
}
</style>
<div class="jumbotron text-center">
	<h3>NOTICE</h3>
<!-- 총 ${cnt} 개의 글이 존재합니다. -->	
</div>


<c:forEach var="one" items="${list }">
	<div class="well">
		<h4><a href="/spoon_board/detail?num=${one.NUM }">${one.TITLE}</a></h4>
		<p style="color: gray;">
			${one.get('CATEGORY')} ｜작성자 : ${one.WRITER} | 조회수:${one.VIEWCOUNT}
			(추천:<span style="color: red;">${one.HITCOUNT}</span>)
		</p>

	</div>
</c:forEach>

<!-- 페이지 뷰 -->
<div align="center" class="well">
	<c:if test="${page ne 1 }">
		<a href="/spoon_board/listAll?page=${cnt -1 }">이전</a>
	</c:if>
	<c:forEach var="p" begin="1" end="${size }" varStatus="vs">
		<c:choose>
			<c:when test="${p eq page }">
				<b style="color: red;">${p }</b>
			</c:when>
			<c:otherwise>
				<a href="/spoon_board/listAll?page=${p }">${p }</a>
			</c:otherwise>
		</c:choose>
		<c:if test="${vs.last eq false }">|</c:if>
	</c:forEach>
	<c:if test="${page ne size }">
		<a href="/spoon_board/listAll?page=${page +1 }">다음</a>
	</c:if>
<!-- 페이지 뷰 -->
	
</div>
<div align="right">
	<a href="/spoon_board/write" data-toggle="tooltip" title="글쓰기" ><button type="button" class="btn">write</button></a>
</div>

