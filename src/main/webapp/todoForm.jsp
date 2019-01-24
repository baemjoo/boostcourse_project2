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
<body id=register_wrap>

<form action="./add" method="post">
<!-- 전체 페이지 div -->
<div class="register_form">
  <div class="regis_header">
    할일 등록
  </div>
  <div class="regis_content">
    <p>어떤일인가요?</p>
    <input type="text" name="title" placeholder="예시) 세탁소가기 (24자)" maxlength="24" size="48">
    <br>
    <p>누가 할일인가요>?</p>
    <input type="text" name="name" placeholder="홍길동" maxlength="8" size="20">
    <br>
    <p>우선순위를 선택하세요</p>
    <input type="radio" id="p1" name="sequence" value="1">
    <label for="p1">1순위</label>
    <input type="radio" id="p2" name="sequence" value="2">
    <label for="p2">2순위</label>
    <input type="radio" id="p3" name="sequence" value="3">
    <label for="p3">3순위</label>
    <br>
    <br>
    <button id="backbtn" class="backbtn" type="button" name="button">< 이전</button>
    <button class="btn" type="submit">제출</button>
    <button class="btn" type="reset">내용지우기</button>
  </div>
</div>
</form>
</body>

<script>
<!-- main화면으로 돌아가기 -->
var backbutton = document.getElementById("backbtn");
backbutton.addEventListener("click",function(){
	location.href="./main"
});
</script>
</html>
    