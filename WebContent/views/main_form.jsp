<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div align="center">
	<h1>spoon compass</h1>
	<img src="/img/123.png" width="10%" height="20%"/>
	
</div>


<div class="row">

	<!-- 12등분  -->
	<div class="col-md-3" align="center">
		<a href="javascript:joining()"><button class="btn" id="chat">
		joining</button></a>
	</div>
	<div class="col-md-3">
		
	</div>
	<div class="col-md-3">
	
	</div>
	<div class="col-md-3">

	</div>

</div>

			<script>
				function joining() {
					window.open("/chat/open", "c",
							"width=350, height=500, left=500");
				}
			</script>

