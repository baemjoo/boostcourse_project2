<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.project2.todolist.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="com.fasterxml.jackson.databind.JsonNode"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.fasterxml.jackson.core.JsonParser"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=urf-8"> 
<title>todolist_main</title>
<link rel="stylesheet" href="css/todolist.css">
</head>

<script type="text/javascript">

function Ajax(id,type) {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	console.log("Ajax _ res )" + this.responseText);
	    }
	  };
	  
	  xhttp.open("POST", "./type", true);
	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  console.log("Ajax) id  : " + id + " / type  : " + type);
	  xhttp.send("id="+id+"&type="+type);
}




</script>

<body>
	<!-- 전체 페이지 div -->
	<div id="wrap">

		<!-- header 영역 -->
		<div id="header">
			<div class="layout_in">
				<div class="lnk">
					<button type="button" class="headerbtn" onclick="alert_click()">새로운 TODO 등록</button>
				</div>
			</div>
		</div>

		<!-- container 영역-->
		<div id="container">

			<div id="content">

				<!-- TODO -->
				<div class="section">
					<div class="title"><p>TODO</p></div>
					<div id="TODO" class="todo_html">
						<c:forEach items="${todo_list}" var="tododto">
							<div id="${tododto.id}" class="todo-list">
								<div class="todo-list-title">
									<c:out value="${tododto.title}" />
								</div>
								<div class="todo-list-content" >
									등록날짜 :
									<fmt:parseDate value="${tododto.regdate}" var="formatdate"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${formatdate}" pattern="yyyy.MM.dd" />
									<c:out value="${tododto.name}" />
									우선순위
									<c:out value="${tododto.sequence}" />
									&ensp;
									<button type="button" class="typebtn"  id="todo${tododto.id}"
										data-value="${tododto.id}" value="${tododto.type}">→</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- DOING -->
				<div class="section">
					<div class="title"><p>DOING</p></div>
					<div id="DOING" class="doing_html">
						<c:forEach items="${doing_list}" var="doingdto">
							<div id="${doingdto.id}" class="todo-list">
								<div class="todo-list-title">
									<c:out value="${doingdto.title}" />
								</div>
								<div class="todo-list-content">
									등록날짜 :
									<fmt:parseDate value="${doingdto.regdate}" var="formatdate"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${formatdate}" pattern="yyyy.MM.dd" />
									<c:out value="${doingdto.name}" />
									우선순위
									<c:out value="${doingdto.sequence}" />
									&ensp;
									<button type="button" class="typebtn" id="doing${doingdto.id}"
									    data-value="${doingdto.id}" value="${doingdto.type}">→</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>


				<!-- DONE -->
				<div class="section">
					<div class="title"><p>DONE</p></div>
					<div id="DONE" class="done_html">
						<c:forEach items="${done_list}" var="donedto">
							<div id="${donedto.id}" class="todo-list">
								<div class="todo-list-title">
									<c:out value="${donedto.title}" />
								</div>
								<div class="todo-list-content">
									등록날짜 :
									<fmt:parseDate value="${donedto.regdate}" var="formatdate"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate value="${formatdate}" pattern="yyyy.MM.dd" />
									<c:out value="${donedto.name}" />
									우선순위
									<c:out value="${donedto.sequence}" />
									&ensp;
								</div>
							</div>
						</c:forEach>
					</div>
				</div>


			</div>
			<!-- content -->
		</div>
		<!-- container -->
	</div>
	<!-- wrap -->
</body>

<script>

<!-- TODO 입력 폼으로 이동-->
function alert_click() {
	location.href = "./form";
}

<!-- btn method 등록 -->
var type_btn = document.querySelectorAll(".typebtn");

 for(var i=0;i<type_btn.length;i++)
{
	type_btn[i].addEventListener("click",dynamicEvent)
}  


function dynamicEvent(e){
	
	var id = e.target.id;
	var value = e.target.value;
	var data_value = e.target.getAttribute('data-value');
	//id - data value //  value - type 
	console.log("dynamicEvent) id : "+ id +"/ value , type : "+ value +" / data-value : " + data_value);
	
	Ajax(data_value,value);
	
	change_list(id,value,data_value);
}

function change_list(id,value,data_value){
	
	console.log("change_list) id : "+ id +"/ value : "+ value +" / data-value : " + data_value);
	
	if(id.startsWith("todo"))
	{
		console.log("change_list) id 가 todo 로 시작");
		
		var change_val = id.replace("todo","doing");
		
		console.log("change_list) 바꾼 id :" +change_val);
		
		document.getElementById(id).setAttribute("id",change_val);
		document.getElementById(change_val).setAttribute("value","DOING");
		
		//parent_div 
		var re_div = document.getElementById(data_value);
		
		var cln = re_div.cloneNode(true);
		
		var ch_div = cln.getElementsByTagName('button')[0];
		
		console.log("change_list_clone_btn) id : "+ ch_div.id +"/ value : "+ ch_div.value +" / data-value : " + ch_div.getAttribute('data-value'));
		
		re_div.remove();
		
		document.getElementById("DOING").appendChild(cln);
		
		ch_div.addEventListener("click",dynamicEvent);
	}
	else if(id.startsWith("doing"))
	{
		console.log("change_list) id 가 doing 로 시작");
		
		var change_val = id.replace("doing","done");
		
		console.log("change_list) 바꾼 id :" +change_val);
		
		document.getElementById(id).setAttribute("id",change_val);
		document.getElementById(change_val).setAttribute("value","DONE");
		
		var re_div = document.getElementById(data_value);
		
		var remove_btn = document.getElementById(change_val);
		remove_btn.parentNode.removeChild(remove_btn);
		
		var cln = re_div.cloneNode(true);
		
		re_div.remove();
		
		document.getElementById("DONE").appendChild(cln);
	}

}
	   
</script>
</html>
