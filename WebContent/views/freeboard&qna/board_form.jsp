<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</div>
<div> 
	<form action="/spoon_board/add" method="post">
		<input type="hidden" name="writer" value="harry"/>
		<p>
			<b>TITLE</b><br /> <input type="text" class="form-control"
				name="title" required/>
		</p>
		<p>
			<b>CATEGORY</b><br /> <select class="form-control" name="category" required>
				<option value="free">잡담하기</option>
				<option value="help">도움요청</option>
				<option value="info">정보공유</option>
			</select>
		</p>
		<p>
			<b>CONTENT</b><br />
			<textarea rows="12" cols="60" name="content" class="form-control" required></textarea>
		</p>
		<div align="right">
			<button type="submit" class="btn">작성하기</button>
			<a href="/spoon_board/listAll"><button type="button" class="btn">취소하기</button></a>
		</div>
	</form>
</div>


