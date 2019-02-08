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

<%
	ObjectMapper mapper = new ObjectMapper();
	String todo_Json = request.getAttribute("todo_list").toString();
	System.out.println("TODO" + todo_Json);

	String doing_Json = request.getAttribute("doing_list").toString();
	System.out.println("DOING" + doing_Json);

	String done_Json = request.getAttribute("done_list").toString();
	System.out.println("DONE" + done_Json);

	List<TodoDto> TODO = mapper.readValue(todo_Json, List.class);
	List<TodoDto> DOING = mapper.readValue(doing_Json, List.class);
	List<TodoDto> DONE = mapper.readValue(done_Json, List.class);

	request.setAttribute("todo_list", TODO);
	request.setAttribute("doing_list", DOING);
	request.setAttribute("done_list", DONE);
%>
<!DOCTYPE html>
<html>
<head>
<title>boostcourse_project1_index</title>
<link rel="stylesheet" href="css/todolist.css">
</head>

<script type="text/javascript">

function Ajax(id,type) {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	alert(this.responseText);
	    }
	  };
	  
	  xhttp.open("POST", "./type", true);
	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
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
					<button type="button" class="headerbtn" onclick="alert_click()">새로운
						TODO 등록</button>
				</div>
			</div>
		</div>

		<!-- container 영역-->
		<div id="container">

			<div id="content">


				<!-- TODO -->
				<div class="section">
					<div class="title">TODO</div>
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
					<div class="title">DOING</div>
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
					<div class="title">DONE</div>
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



var type_btn = document.querySelectorAll(".typebtn");
for(var i=0;i<type_btn.length;i++)
{
	type_btn[i].addEventListener("click",function(){
		
		var id = this.id;
		var value = this.getAttribute('data-value');
		var type = this.value;
		console.log("btn click ) id : "+this.id+" type : " + type + " / data-value : " + value);
		
		change_list(id,value,type);
		
		Ajax(value,type);
	});
}

function change_list(id,value,type){
	
	
	console.log("change_list ) id : " + id + " / value : " + value + "/ type : " + type);
	
	if(id.startsWith("todo"))
	{
		var re_div = document.getElementById(value);
		
		var cln = re_div.cloneNode(true);
		console.log("todo다");
		re_div.remove();
		document.getElementById("DOING").appendChild(cln);
	}
	else if(id.startsWith("doing"))
	{
		var element = document.getElementById(id);
		element.parentNode.removeChild(element);
		
		var re_div = document.getElementById(value);
		
		var cln = re_div.cloneNode(true);
		console.log("doing이다");
		re_div.remove();

		document.getElementById("DONE").appendChild(cln);
	}

}


	   
</script>
</html>
