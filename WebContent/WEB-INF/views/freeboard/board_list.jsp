<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div>
	<h3>자유 게시판 </h3>
	${cnt } 개의 글이 존재합니다.
</div>
<div align="right">
	<a href="/board/write.jsp"><button type="button" class="btn">글작성</button></a>
</div>
<hr />
<c:forEach var="one" items="${list }">
	<div class="well">
		<h4><a href="/board/detail.jsp?num=${one.num }">${one.title}</a></h4>
		<p style="color: gray;">
			${one.get('category')} ｜작성자 : ${one.writer} | 조회수:${one.viewcount}
			(추천:<span style="color: red;">${one.hitcount}</span>)
		</p>
		<p>
			<c:choose>
				<c:when test="${fn:length(one.content) le 40}">${one.content }</c:when>
				<c:otherwise>
					${fn:substring(one.content, 0, 40) } ...
				</c:otherwise>
			</c:choose>
		</p>
	</div>
</c:forEach>
<!-- 페이지 뷰 -->
<div align="center" class="well">
	<c:if test="${page ne 1 }">
		<a href="/views/board_list.jsp?page=${page -1 }">이전</a>
	</c:if>
	<c:forEach var="p" begin="1" end="${size }" varStatus="vs">
		<c:choose>
			<c:when test="${p eq page }">
				<b style="color: red;">${p }</b>
			</c:when>
			<c:otherwise>
				<a href="/views/board_list.jsp?page=${p }">${p }</a>
			</c:otherwise>
		</c:choose>
		<c:if test="${vs.last eq false }">|</c:if>
	</c:forEach>
	<c:if test="${page ne size }">
		<a href="/views/board_list.jsp?page=${page +1 }">다음</a>
	</c:if>
</div>


