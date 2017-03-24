<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
.starScore {
	cursor: pointer;
}
</style>
<form action="/">
청결도	: 
	<input type="hidden" id="clean_s" name="clean_s" value="1" />
	<c:forEach begin="1" end="5" varStatus="vs">
		<c:choose>
			<c:when test="${!vs.first }">
				<a class="starScore" id="star_clean${vs.count }"
					onclick="star(${vs.count},'clean')">☆</a>
			</c:when>
			<c:otherwise>
				<a class="starScore" id="star_clean${vs.count }"
					onclick="star(${vs.count},'clean')" style="color: red;">★</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br/>
가　격 : 
	<input type="hidden" id="price_s" name="price_s" value="1" />
	<c:forEach begin="1" end="5" varStatus="vs">
		<c:choose>
			<c:when test="${!vs.first }">
				<a class="starScore" id="star_price${vs.count }"
					onclick="star(${vs.count},'price')">☆</a>
			</c:when>
			<c:otherwise>
				<a class="starScore" id="star_price${vs.count }"
					onclick="star(${vs.count},'price')" style="color: red;">★</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br/>
맛평가	: 
	<input type="hidden" id="taste_s" name="taste_s" value="1" />
	<c:forEach begin="1" end="5" varStatus="vs">
		<c:choose>
			<c:when test="${!vs.first }">
				<a class="starScore" id="star_taste${vs.count }"
					onclick="star(${vs.count},'taste')">☆</a>
			</c:when>
			<c:otherwise>
				<a class="starScore" id="star_taste${vs.count }"
					onclick="star(${vs.count},'taste')" style="color: red;">★</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br/>
친절도	: 
	<input type="hidden" id="good_s" name="good_s" value="1" />
	<c:forEach begin="1" end="5" varStatus="vs">
		<c:choose>
			<c:when test="${!vs.first }">
				<a class="starScore" id="star_good${vs.count }"
					onclick="star(${vs.count},'good')">☆</a>
			</c:when>
			<c:otherwise>
				<a class="starScore" id="star_good${vs.count }"
					onclick="star(${vs.count},'good')" style="color: red;">★</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br/>
접근성	: 
	<input type="hidden" id="location_s" name="location_s" value="1" />
	<c:forEach begin="1" end="5" varStatus="vs">
		<c:choose>
			<c:when test="${!vs.first }">
				<a class="starScore" id="star_location${vs.count }"
					onclick="star(${vs.count},'location')">☆</a>
			</c:when>
			<c:otherwise>
				<a class="starScore" id="star_location${vs.count }"
					onclick="star(${vs.count},'location')" style="color: red;">★</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br/>
	
</form>

<script>
	function star(x,type){
		
		if($("#star_"+type+x).html()=="☆"){
			for(var i =1; i<=x; i++){
				$("#star_"+type+i).each(function(){
					//class name이 chk인 개체들을 모두 체크되게함
						// this.checked =true;
							$(this).html("★");
							$(this).css("color","red");

					});
			}
		} else{
			for(var i =x+1; i<=5; i++){
				$("#star_"+type+i).each(function(){
					//class name이 chk인 개체들을 모두 체크되게함
						// this.checked =true;
							$(this).html("☆");
							$(this).css("color","black");

					});
			}
		}

		$("#"+type+"_s").val(x);
	}
</script>