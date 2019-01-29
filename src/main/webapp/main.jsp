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
	List<TodoDto> DOING = new ArrayList<TodoDto>();
	List<TodoDto> DONE = new ArrayList<TodoDto>();

	//TODO = mapper.readValue(todo_Json, List.class);
	DOING = mapper.readValue(doing_Json, List.class);
	DONE = mapper.readValue(done_Json, List.class);

	request.setAttribute("todolist", TODO);
	request.setAttribute("doinglist", DOING);
	request.setAttribute("donelist", DONE);
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
					<c:forEach items="${todolist}" var="tododto">
						<div class="todo_html">
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
									<button type="button" name="todo_doing">→</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- DOING -->
				<div class="section">
					<div class="title">DOING</div>
					<c:forEach items="${doinglist}" var="doingdto">
						<div class="doing_html">
							<div class="todo-list">
								<div class="todo-list-title">${doingdto.title}</div>
								<div class="todo-list-content">
									등록날짜 :
									<fmt:parseDate value="${doingdto.regdate}" var="formatdate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${formatdate}" pattern="yyyy.MM.dd"/>
									<c:out value="${doingdto.name}" />
									우선순위
									<c:out value="${doingdto.sequence}" />
									&ensp;
									<button type="button" name="todo_doing">→</button>
								</div>
							</div>
					</c:forEach>
				</div>
			</div>

			<!-- DONE -->
			<div class="section">
				<div class="title">DONE</div>
				<c:forEach items="${donelist}" var="donedto">
					<div class="done_html">
						<div class="todo-list">
							<div class="todo-list-title">${donedto.title}</div>
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
		<!-- content -->
	</div>
	<!-- container -->
	</div>
	<!-- wrap -->
</body>

<script>
function alert_click() {
	location.href = "./form"
}
	

var xmlhttp = new XMLHttpRequest();

function updateDate(id,type){
	
}
</script>
</html>
