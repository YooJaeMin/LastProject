<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">


.input {
   font-family: '나눔고딕';
   font-size: 10pt;
}

.main_view {
   	position: absolute;
    top:60%;
    left:35%;
    padding-bottom:30px;
    padding-top: 30px;
    
}

.main_search_area {
    position: absolute;
    bottom: 0%;
    background-color: rgba(0,0,0,.5);
    padding-bottom: 16px;
    padding-top: 30px;
}
</style>

<div class="main_visual" style="width: 100%; height: 100%; overflow: hidden;Opacity : 0.9;
   background-image: url(&quot;/img/result.jpg&quot;); background-size: cover;">
   <!--  -->

   <div align="center" style="color:white;">
	<h1>spoon compass</h1>
	<img src="/img/123.png" width="10%" height="20%"/>
	
	</div>
   
   
   
   
   <div class="main_view row" style="width:40%; color: white;">

         <div class="input col-sm-6" style="width: 50%; font-size: 18px" >
 			
             <ul >
 				<li >disc 타입의 리스트
 				<li >circle 타입의 리스트
 				<li >square 타입의 리스트
 				<li >none 타입의 리스트
			</ul>

          </div>
          
         <div class="input col-sm-6" style="width: 50%; font-size: 18px">
 			
             <ul >
 				<li>강남 
 				<li>강북
 				<li>이태원
 				<li>고기동
 				<li>수지구
			</ul>

          </div>
    </div>
  <div class="main_search_area row" style="width:101%; color: white;">
    <div class="input-group" style="width: 101%;">
            <input type="text" class="form-control" style="height: 55px; font-size: 18px; 
               border: 4px solid; border-color: #FFD700;" placeholder="지역명">
            <div class="input-group-btn">
               <button class="btn btn-default" type="submit" style="height: 55px; width: 120px; font-size: 18px; 
                     border: 4px solid; border-color: #FFD700; background-color: #FFD700; color: white;" >
                  <b>←</b>
               </button>
            </div>
         </div>
        </div>
    
</div>

                  