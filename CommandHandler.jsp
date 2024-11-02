<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web_text_game.Location" %>
<%@ page import="web_text_game.Adventurer" %>
<%@ page import="web_text_game.Room" %>
<%@ page import="web_text_game.Thing" %>
<jsp:useBean id="adventurer" class="web_text_game.Adventurer" scope="session"/>
<jsp:useBean id="adv" class="web_text_game.AdventureModel" scope="session"/>

<%
	Adventurer player = (Adventurer) session.getAttribute("adventurer");
	if (player== null) {
	    // Redirect to StartGame.jsp if session expired
	    response.sendRedirect("TextGame.jsp");
	    return;
	}
    String command = request.getParameter("command");
    if (command != null) {
        switch (command) {
            case "Go":
                response.sendRedirect("GoCommand.jsp");
                break;
            case "Look":
                response.sendRedirect("LookCommand.jsp");
                break;
            case "Take":
                response.sendRedirect("TakeCommand.jsp");
                break;
            case "Drop":
                response.sendRedirect("DropCommand.jsp");
                break;
            case "Use":
                response.sendRedirect("UseCommand.jsp");
                break;
            case "Exit":
                response.sendRedirect("ExitCommand.jsp");
                break;
            default:
                out.println("Invalid command.");
                break;
        }
    }
%>
