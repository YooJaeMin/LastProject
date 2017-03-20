<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.main_visual.item:not(.left):not(.right){
-webkit-transition:0s ease-in-out left
;transition:0s ease-in-out left}

/* .input { */
/*    font-family: '나눔고딕'; */
/*    font-size: 10pt; */
/* } */

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
#main_visual {
  position:relative;
  height:281px;
  width:450px;
  margin:0 auto;
}

#main_visual img {
  position:absolute;
  left:0;
  -webkit-transition: opacity 1s ease-in-out;
  -moz-transition: opacity 1s ease-in-out;
  -o-transition: opacity 1s ease-in-out;
  transition: opacity 1s ease-in-out;
}

 @keyframes cf3FadeInOut {
  0% {
  opacity:1;
}
45% {
opacity:1;
}
55% {
opacity:0;
}
100% {
opacity:0;
}
}

#main_visual img.top {
animation-name: cf3FadeInOut;
animation-timing-function: ease-in-out;
animation-iteration-count: infinite;
animation-duration: 10s;
animation-direction: alternate;
}

</style>

<div class="main_visual" style="width: 100%; height: 100%; overflow: hidden;Opacity : 0.9;
   background-image: url(&quot;./img/result.jpg&quot;);background-size: cover;">
   <!--  -->
	
   <div align="center" style="color:white;">
	<h1>spoon compass</h1>
	<img src="/img/123.png" width="10%" height="20%"/>
	
	</div>
   
   
   
   
   <div class="main_view row" style="width:35%; color: white; background-color: rgba(0,0,0,.5)" align="center">

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
<script>
var header = $('.main_visual');

var backgrounds = new Array(
    'url(./img/result.jpg)'
  , 'url(./img/main1.jpg)'
  , 'url(./img/main11.jpg)'
  , 'url(./img/main16.jpg)'
);
    
var current = 0;
 
function nextBackground() {
    current++;
    current = current % backgrounds.length;
  
    header.css('background-image', backgrounds[current]);
    
}
setInterval(nextBackground, 7000);

header.css('background-image', backgrounds[0]);</script>

                  