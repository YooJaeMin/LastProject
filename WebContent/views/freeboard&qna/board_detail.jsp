<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<link href='//fonts.googleapis.com/css?family=Coming Soon'
	rel='stylesheet'>
</head>
<style>
div {
	font-family: 'Coming Soon';
}
</style>
<div>
    <h3>NOTICE</h3><br/>
    <h2>${detail.TITLE }</h2>
</div>
<div class="well" align="center">
 <form action="/spoon_board/listAll" method="post">
     <div align="left">
 
    No.${detail.NUM} [${detail.CATEGORY}] <br/>
    작성자:${detail.WRITER}　update: ${detail.UPDATEDATE}　조회수:${detail.VIEWCOUNT}<br/>
    <b>${detail.TITLE}</b>
    <hr/>
    ${detail.CONTENT}    
    <hr/>
 
     <div align="right">
     <c:choose>
     <c:when test="${detail.WRITER ne auth_id}">
         <button type="submit" class="btn">목록으로</button> 
    </c:when>
        <c:otherwise>
         <button type="submit" class="btn">목록으로</button> 
     </c:otherwise>
     </c:choose>
      </div>
     </div>
 </form>
</div>
