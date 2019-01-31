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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
						<div class="todo_html">
						<c:forEach items="${todo_list}" var="tododto">
							<div class="todo-list">
								<div class="todo-list-title">
									<c:out value="${tododto.title}" />
								</div>
								<div class="todo-list-content">
									등록날짜 :
									<fmt:parseDate value="${tododto.regdate}" var="formatdate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${formatdate}" pattern="yyyy.MM.dd"/>
									<c:out value="${tododto.name}" />
									우선순위
									<c:out value="${tododto.sequence}" />
									&ensp;
									<button type="button" class="typebtn" id="${tododto.id}" value="${tododto.type}">→</button>
								</div>
							</div>
						</c:forEach>
						</div>
					
				</div>

				<!-- DOING -->
				<div class="section">
					<div class="title">DOING</div>
						<div class="doing_html">
						<c:forEach items="${doing_list}" var="doingdto">
							<div class="todo-list">
								<div class="todo-list-title">
								<c:out value="${doingdto.title}"/>
								</div>
								<div class="todo-list-content">
									등록날짜 :
									<fmt:parseDate value="${doingdto.regdate}" var="formatdate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${formatdate}" pattern="yyyy.MM.dd"/>
									<c:out value="${doingdto.name}" />
									우선순위
									<c:out value="${doingdto.sequence}" />
									&ensp;
									<button type="button" class="typebtn" id="${doingdto.id}" value="${doingdto.type}">→</button>
								</div>
							</div>
						</c:forEach>
						</div>
				</div>
			

			<!-- DONE -->
			<div class="section">
				<div class="title">DONE</div>
					<div class="done_html">
					<c:forEach items="${done_list}" var="donedto">
						<div class="todo-list">
							<div class="todo-list-title">
							<c:out value="${donedto.title}"/>
							</div>
							<div class="todo-list-content">
								등록날짜 :
								<fmt:parseDate value="${donedto.regdate}" var="formatdate" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${formatdate}" pattern="yyyy.MM.dd"/>
								<c:out value="${donedto.name}" />
								우선순위
								<c:out value="${donedto.sequence}" />
								&ensp;
							</div>
						</div>
					</c:forEach>
					</div>
			</div>


		</div><!-- content -->
	</div><!-- container -->
</div><!-- wrap -->
</body>

<script>

<!-- TODO 입력 폼으로 이동-->
function alert_click() {
	location.href = "./form";
}

<!-- type update를 위한 btn-->
var type_btn = document.querySelectorAll(".typebtn");

for(var i=0;i<type_btn.length;i++)
{
	type_btn[i].addEventListener("click",function(){
		console.log("id : " +this.id + " /   type : " + this.value);
		console.log("clicked btn");
		
		ajax(this.id, this.type);
		
	});
}

<!-- type 변환을 위한 ajax-->
function ajax(id, type){
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     console.log(this.responseText);
	    }
	  };
	  var data = "{id:"+id+",type:"+type+"}";
	  xhttp.open("POST", "./type", true);
	  xhttp.setRequestHeader("Content-type", "application/json");
	  xhttp.send(data);
	}


	   
</script>
</html>
