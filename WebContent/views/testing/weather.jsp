<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> 
<script type="text/javascript" src="planetxsdk.js"></script>
<script type="text/javascript">
	$(function(){
		PlanetX.init({
		appKey:"adfcc889-90df-3246-ab84-cd0af620e065",
		client_id:"adfcc889-90df-3246-ab84-cd0af620e065",
		redirect_uri:"http://192.168.10.27:80/",
		scope: ""	//앱에서 접근 할 수 있는 서비스 리스트 
		});
		
	});
	
	function weather(){
		PlanetX.api("get","http://apis.skplanetx.com/weather/current/hourly","JSON",
				{"version":1},weather_callback);
		}
	function weather_callback(data){
		var weather,
			$weather;
	}
	
</script>
