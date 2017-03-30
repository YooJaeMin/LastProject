<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div align="center">
	<span class="main_title" style="font-size: 80px;">해당 페이지는 로그인 후
		사용하세요!</span><br/>
		<span class="main_title" style="font-size: 80px;" id="setter">5초후 페이지를 이동합니다.</span>
</div>
<script>
	var time = 5;
	function goPage() {
		location.href = "/";
	}
	function setSecond() {
		time --;
		$("#setter").html(time+"초후 페이지를 이동합니다.");
	}
	setInterval(setSecond,1000);
	setInterval(goPage,5000);
</script>