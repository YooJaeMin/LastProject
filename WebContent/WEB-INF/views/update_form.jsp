<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/* 
		String id = (String)session.getAttribute("auth_id");
		PictureDao pDao = new PictureDao();
		String picURL = pDao.getLastetImageURL(id);
		if(picURL== null){
			picURL = "/picture/default.jpg";
		}
		MemberDao mDao = new MemberDao();
		// 리턴되는 값에는 이름, 나이, 성별, 이메일 주소들이 다 담겨져 있어야 함.
		HashMap<String, Member> val = (HashMap<String, Member>)mDao.getDetails(id);
		System.out.println(val.size());
		Member result = (Member)val.get(id);
		System.out.println(result.getId());
		
		request.setAttribute("url", picURL);
		
		request.setAttribute("map", result);
		 */
%>

<div>
	<h3>회원정보</h3>
</div>

<div class="well row">

	<!-- 12등분  -->
	<div class="col-md-4" align="center">
		
	</div>
	<div class="col-md-4" align="center">
		
	</div>
	<div class="col-md-4" align="center">
		
	</div>
	<div class="col-md-4"  align="center">
		
	</div>

</div>

