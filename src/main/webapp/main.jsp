<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>boostcourse_project1_index</title>

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

				<!-- TODO -->
				<div class="section">
					<div class="title">TODO</div>
						<div class="todo_html">
						</div>
				</div>

				<!-- DOING -->
				<div class="section">
					<div class="title">DOING</div>
						<div class="doing_html">
						</div>
				</div>

				<!-- DONE -->
				<div class="section">
					<div class="title">DONE</div>
					 	<div class="done_html">
						</div>
				</div>

			</div>
			<!-- content -->
		</div>
		<!-- container -->
	</div>
	<!-- wrap -->
</body>

<!-- TODO DOING template -->
<script id="template-list-item-withbtn" type="text/template">
  <div class="todo-list">
    <div class="todo-list-title">
      	{title}
    </div>
    <div class="todo-list-content">
      등록날짜 : {regdate} {name} 우선순위 {sequence} &ensp;  <button type="button" name="todo_doing">→</button>
    </div>
  </div>
</script>

<!-- DONE template -->
<script id="template-list-item-nobtn" type="text/template">
  <div class="todo-list">
    <div class="todo-list-title">
      	{title}
    </div>
    <div class="todo-list-content">
      등록날짜 : {regdate} {name} 우선순위 {sequence} &ensp;
    </div>
  </div>
</script>

<script>

var data = request.getParamater("todolist");
System.out.println("todolist "+ data);

function makeTemplate(data) {
	var with_btn = document.getElementById("template-list-item-withbtn").innerHTML;
	var no_btn = document.getElementById("template-list-item-nobtn").innerHTML;

	var re_todo = "";
	var re_doging = "";
	var re_done = "";

	for (var i = 0; i < data.length; i++) {
		if (data[i].type === "TODO") {
			re_todo += with_btn.replace("{title}", data[i].title)
								.replace("{regdate}", data[i].regdate)
								.replace("{name}",data[i].name)
								.replace("{sequence}", data[i].sequence);

				break;
		} else if (data[i].type === "DOING") {
			re_doing += with_btn.replace("{title}", data[i].title)
								.replace("{regdate}", data[i].regdate)
								.replace("{name}",data[i].name)
								.replace("{sequence}", data[i].sequence);

				break;
		} else {
			re_done += no_btn.replace("{title}", data[i].title)
							.replace("{regdate}", data[i].regdate)
							.replace("{name}",data[i].name)
							.replace("{sequence}", data[i].sequence);

				break;
		
		}
	}
	document.querySelector(".todo_html").innerHTML = re_todo;
	document.querySelector(".doing_html").innerHTML = re_todo;		
	document.querySelector(".done_html").innerHTML = re_todo;
}
	

function alert_click() {
	location.href = "./form"
}
</script>
</html>
