<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web_text_game.Adventurer" %>
<%@ page import="web_text_game.AdventureModel" %>
<jsp:useBean id="adventurer" class="web_text_game.Adventurer" scope="session"/>
<jsp:useBean id="adv" class="web_text_game.AdventureModel" scope="session"/>

<%
	Adventurer player = (Adventurer) session.getAttribute("adventurer");
	if (player== null) {
	    // Redirect to StartGame.jsp if session expired
	    response.sendRedirect("TextGame.jsp");
	    return;
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Text-Based Adventure Game</title>
</head>
<body>
    <h1>Welcome, <%= player.getName() %></h1>
	<p>Current Location: <%= player.getLocation() %></p>
    <form action="CommandHandler.jsp" method="post">
        <h3>Choose a command:</h3>
        <select name="command" required>
            <option value="">Select Command</option>
            <option value="Go">Go</option>
            <option value="Look">Look</option>
            <option value="Take">Take</option>
            <option value="Drop">Drop</option>
            <option value="Use">Use</option>
            <option value="Exit">Exit</option>
        </select>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
