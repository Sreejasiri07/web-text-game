<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web_text_game.Location" %>
<%@ page import="web_text_game.Adventurer" %>
<%@ page import="web_text_game.Room" %>
<%@ page import="web_text_game.Thing" %>
<jsp:useBean id="adventurer" class="web_text_game.Adventurer" scope="session"/>
<jsp:useBean id="adv" class="web_text_game.AdventureModel" scope="session"/>

<%
    // Retrieve the adventurer's current location
    Adventurer player = (Adventurer) session.getAttribute("adventurer");
	if (player== null) {
	    // Redirect to StartGame.jsp if session expired
	    response.sendRedirect("TextGame.jsp");
	    return;
	}
    Location currentLoc = player.getLocation();
    String roomContentOutput = "";
    String inventoryOutput = "";
    String message = "";

    // Display contents of the current room, if it is a Room instance
    if (currentLoc instanceof Room) {
        roomContentOutput = ((Room) currentLoc).viewRoomContent();
    }

    // Get the item number input from the form submission
    String thingParam = request.getParameter("Thing");
    if (thingParam != null) {
        int takeThing = Integer.parseInt(thingParam);
        if (currentLoc instanceof Room) {
            Thing item = ((Room) currentLoc).getRoomItem(takeThing);
            if (item != null) {
                // Add item to inventory and update inventory output
                player.take(item);
                inventoryOutput = player.viewAdventurerInventory();
                message = "You have taken the item!";
            } else {
                message = "No item found at that number.";
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Take Command</title>
</head>
<body>
    <h3>Take Command</h3>
    
    <!-- Display current room contents -->
    <div>Room Contents: <%= roomContentOutput %></div>
    
    <!-- Display feedback message after attempting to take an item -->
    <p><%= message %></p>
    
    <!-- Form to take an item by entering its number -->
    <form action="TakeCommand.jsp" method="post">
        <label>Enter item number to take:</label>
        <input type="number" name="Thing" placeholder="0/1/2/3" required>
        <input type="submit" value="Take">
    </form>
    
    <!-- Display updated inventory -->
    <p>Current Inventory: <%= inventoryOutput %></p>
    
    <!-- Return to Main Menu button -->
    <form action="index.jsp" method="post">
        <input type="submit" value="Return to Main Menu">
    </form>
</body>
</html>
