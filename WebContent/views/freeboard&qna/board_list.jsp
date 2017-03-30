<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div >
	<h3><span class=main_title>NOTICE</span></h3>
<!-- 총 ${cnt} 개의 글이 존재합니다. -->	
</div>
<hr/>
<span class=main_content>공지사항을 확인해 주세요 ~!!</span>
<c:forEach var="one" items="${list }">
	<div class="main_content">
		<h4><a href="/spoon_board/detail?num=${one.NUM }">${one.TITLE}</a></h4>
		<p style="color: gray;">
			${one.get('CATEGORY')} ｜작성자 : ${one.WRITER} |
		</p>

	</div>
</c:forEach>

<!-- 페이지 뷰 -->
<div align="center" class="main_content">
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
<c:if test="${SesseionScope.auth_id eq'spoon@spoon'}">
	<div align="right">
		<a href="/spoon_board/write" data-toggle="tooltip" title="글쓰기" ><button type="button" class="btn">write</button></a>
	</div>
</c:if>
