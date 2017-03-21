<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<style>
#tags {
	
}

#location-list {
	
}

#name-list {
	
}
</style>

<div id="tags">
	<div class="row">
		<c:forEach items="${tagsList }" var="item">
			<form action="/search/tag">
				<button class="submit" name="selectedTag">${item }</button>
			</form>
		</c:forEach>
	</div>
	<div class="row"></div>
</div>

<div id="location-list">
	
</div>

<div id="name-list">
	
</div>

