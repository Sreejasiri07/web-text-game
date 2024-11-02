<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web_text_game.Adventurer" %>
<jsp:useBean id="adv" class="web_text_game.AdventureModel" scope="session"/>
<% 	
	HttpSession ses=request.getSession();
	Adventurer adventurer=new Adventurer("adventurer");
	ses.setAttribute("adventurer",adventurer);
	response.sendRedirect("index.jsp");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>