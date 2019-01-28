<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.or.project2.todolist.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
ObjectMapper objectMapper = new ObjectMapper();
//List<TodoDto> list = objectMapper.writerWithType(List<TodoDto.class>);
%>
<!-- TODO 밑에 링크 공부 -->
<!--  http://www.java67.com/2016/10/3-ways-to-convert-string-to-json-object-in-java.html -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% int count=0; %>
<c:forEach  items="{$todolist}" var="tododto">
<c:forEach  items="{$tododto}" var="dto">
<li>${dto}</li>
</c:forEach>
</c:forEach>
</body>
</html>