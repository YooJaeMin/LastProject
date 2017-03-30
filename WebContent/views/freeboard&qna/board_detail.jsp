<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<%@ page import="java.util.*"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--  <style>

	 .main_title {
      font-family: hanna;
      font-size: 2em;
      padding: 5px;
      background-color: #ff9400;
      color: white;
   }
   .main_small_title {
      font-family: hanna;
      font-size: 1.5em;
      padding: 3px;
      background-color: #ff9400;
      color: white;
   }
   .main_content {
      font-family: hanna;
      font-size: 1.2em;
   
} -->
<!-- </style> -->

<c:forEach items="${detail}" var="detail">
<div>
    <span class="main_title">NOTICE</span><br/>
    <span class="main_small_title">${detail.TITLE }</span>
</div>

<div class="main_content" align="center">
 <form action="/spoon_board/listAll" method="post">
     <div align="left">
    	<span style="font-size:">No.${detail.NUM} [${detail.CATEGORY}]</span> <br/>
    	작성자:${detail.WRITER}　update: ${detail.UPDATEDATE}　<br/>
    <b>	${detail.TITLE}</b>
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
</c:forEach>

