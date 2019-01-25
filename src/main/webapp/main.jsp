<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>boostcourse_project1_index</title>
<script>

</script>
<style>
</style>
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

				<c:forEach var="tododto" items="{$todolist}">
					<!-- TODO -->
					<div class="section">
						<div class="title">TODO</div>
						<div class="todo_html">
							<c:if test="${tododto.type eq 'TODO'}">
								<div class="todo-list">
									<div class="todo-list-title">${tododto.title}</div>
									<div class="todo-list-content">
										등록날짜 : ${tododto.regdate} ${tododto.name} 우선순위 ${tododto.sequence} &ensp;
										<button type="button" name="todo_doing">→</button>
									</div>
								</div>
							</c:if>
						</div>
					</div>

					<!-- DOING -->
					<div class="section">
						<div class="title">DOING</div>
						<div class="doing_html">
							<c:if test="${tododto.type ==DOING}">
								<div class="todo-list">
									<div class="todo-list-title">${tododto.title}</div>
									<div class="todo-list-content">
										등록날짜 : ${tododto.regdate} ${tododto.name} 우선순위 ${tododto.sequence} &ensp;
										<button type="button" name="todo_doing">→</button>
									</div>
								</div>
							</c:if>
						</div>
					</div>

					<!-- DONE -->
					<div class="section">
						<div class="title">DONE</div>
						<div class="done_html">
							<c:if test="${tododto.type ==DONE}">
								<div class="todo-list">
									<div class="todo-list-title">${tododto.title}</div>
									<div class="todo-list-content">
										등록날짜 : ${tododto.regdate} ${tododto.name} 우선순위 ${tododto.sequence} &ensp;
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</c:forEach>

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
</script>
</html>
