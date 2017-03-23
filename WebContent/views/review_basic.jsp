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

<div> 
	<form action="/review/basic" method="post">
		<input type="hidden" name="id" value="${sessionScope.auth_id }"/>
		<input type="hidden" name="tel" value="${store.tel }"/>
		
	
	</form>
</div>