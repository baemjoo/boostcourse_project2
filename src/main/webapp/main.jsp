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
        <button type="button" class="headerbtn" onclick="alert_click()">새로운 TODO 등록</button>
    </div>
  </div>
</div>

<!-- container 영역-->
<div id="container">

<div id="content">

<!-- TODO -->
<div class="section">
  <div class="title">
  TODO
  </div>

  <div class="todo-list">
    <div class="todo-list-title">
      자바스크립트 공부하기
    </div>
    <div class="todo-list-content">
      등록날짜 : 2019.01.21 배명주 우선순위 2 &ensp;  <button type="button" name="todo_doing">→</button>
    </div>
  </div>

  <div class="todo-list">
    <div class="todo-list-title">
      자바스크립트 공부하기
    </div>
    <div class="todo-list-content">
      등록날짜 : 2019.01.21 배명주 우선순위 2 &ensp;  <button type="button" name="todo_doing">→</button>
    </div>
  </div>

  <div class="todo-list">
    <div class="todo-list-title">
      자바스크립트 공부하기
    </div>
    <div class="todo-list-content">
      등록날짜 : 2019.01.21 배명주 우선순위 2 &ensp;  <button type="button" name="todo_doing">→</button>
    </div>
  </div>
</div>  <!-- TODO section div-->

<!-- DOING -->
<div class="section">
  <div class="title">
    DOING
  </div>
</div>

<!-- DONE -->
<div class="section">
  <div class="title">
    DONE
  </div>
</div>

</div> <!-- content -->
</div> <!-- container -->
</div>  <!-- wrap -->
</body>

<script id ="template-list-item" type="text/template">

<li>
  <h4>{menu}</h4><p>{content}</p><div>{price}</div>
</li>
</script>

<script>

function alert_click(){
  location.href="./form"
}
</script>
</html>
