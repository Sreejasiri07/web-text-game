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
    Location currentLoc = player.getLocation();
    String direc = request.getParameter("direction");
    String output;
	System.out.println(direc != null);
    if (direc != null) {
        boolean pathExists = adv.checkPathExist(direc, currentLoc);
        if (pathExists) {
            Location newLoc = adv.adventurerNextLocation(direc, currentLoc);
            player.setLocation((Room) newLoc);
            output = "Moved to the new location.";
        } else {
            output = "Here is Water or Wall. You can't move in this direction.";
        }
    } else {
        output = "No direction provided.";
    }
%>
<!DOCTYPE html>
<html>
<body>
    <p>Current Location: <%= currentLoc %></p>
    <p><%= output %></p>
    <form action="GoCommand.jsp" method="post">
        <input type="hidden" name="command" value="Go">
        <label>Direction (for 'Go' command):</label>
        <input type="text" name="direction" placeholder="north/south/east/west" required>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
