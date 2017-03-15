<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String addr = request.getParameter("addr");
	String target = "https://maps.googleapis.com/maps/api/geocode/json?address="+addr+"&key=AIzaSyCpcNf3T5eaviEl5TMxnzo0gk6Bzvlkw6M";
	// 요청보내는 방법은 꽤 많다.
	System.out.println(target);
	URL url = new URL(target);
	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
	String outstr = "";
	while (true) {
		String str = br.readLine();
		if (str == null)
			break;
		// out.println(str);
		outstr += str;
	}
	
	out.println(outstr);
%>


