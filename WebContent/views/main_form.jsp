<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<div align="center">
	<h1>spoon compass</h1>
	<img src="/img/123.png" width="10%" height="20%"/>
	
</div>


<div class="well row">

	<!-- 12등분  -->
	<div class="col-md-3" align="center">
	ㅁㅇㄶ
		
	</div>
	<div class="col-md-3" class="form-control">
		ㅁㅇㄶ
	</div>
	<div class="col-md-3" class="form-control">
		ㅇㄴㅁㅎ
	</div>
	<div class="col-md-3" class="form-control">
		ㅁㅇㄶ
	</div>
	


</div>




<body>
<div class="container">
  <!-- Trigger the modal with a button -->
  <button type="button"  data-toggle="modal" data-target="#myModal">login</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
      <div class="row">
        <div class="col-md-6">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인</h4>
        </div>
        <div class="col-md-6">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원가입</h4>
        </div>
      </div>
        
        
        <div class="modal-body">
          <p>Some text in the modal.</p>
          <input type="text" class="form-control" name="id"/>
        </div>
        
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        
      </div>
      
    </div>
  </div>
  
</div>
</body>


