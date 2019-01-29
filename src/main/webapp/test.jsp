<%@page import="com.fasterxml.jackson.core.type.TypeReference"%>
<%@page import="kr.or.project2.todolist.dto.TodoDto"%>
<%@page import="com.fasterxml.jackson.databind.JsonNode"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page isELIgnored ="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%

ObjectMapper mapper = new ObjectMapper();
String todo_Json = request.getAttribute("todo_list").toString();
System.out.println("TODO" + todo_Json);

String doing_Json = request.getAttribute("doing_list").toString();
System.out.println("DOING" + doing_Json);

String done_Json = request.getAttribute("done_list").toString();
System.out.println("DONE" + done_Json);


List<TodoDto> TODO = new ArrayList<TodoDto>();

TODO = mapper.readValue(todo_Json,List.class);

request.setAttribute("todolist",TODO);
System.out.println(TODO.toString());
//JsonNode obj = mapper.readTree((String)request.getAttribute("todolist"));
//request.setAttribute("todo_list",obj);
//System.out.println("request todolist 읽기 " + obj);

//TodoDto[] dto = mapper.readValue(dtoJson,TodoDto[].class);

//List<TodoDto> dto = mapper.readValue(dtoJson,new TypeReference<List<TodoDto>>(){});

//System.out.println("dto 는? " + dto.toString());

//request.setAttribute("todo_list",dto.toString());
%>
<!-- TODO 밑에 링크 공부 -->
<!--  http://www.java67.com/2016/10/3-ways-to-convert-string-to-json-object-in-java.html -->
<!-- https://www.journaldev.com/2324/jackson-json-java-parser-api-example-tutorial#jackson-json-java-parser -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<c:forEach  items="${todolist}" var="tododto">

<c:out value="${fn:length(tododto)}" />

<td><c:out value="${tododto.id}"/></td>
<td><c:out value="${tododto.name}"/></td>
<td><c:out value="${tododto.regdate}"/></td>
<td><c:out value="${tododto.title}"/></td>
<td><c:out value="${tododto.type}"/></td>
</c:forEach>

</body>
</html>