<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web_text_game.Location" %>
<%@ page import="web_text_game.Room" %>
<%@ page import="web_text_game.Thing" %>
<jsp:useBean id="adventurer" class="web_text_game.Adventurer" scope="session"/>
<jsp:useBean id="adv" class="web_text_game.AdventureModel" scope="session"/>

<%
    Location currentLoc = adventurer.getLocation();
    String inventoryOutput = adventurer.viewAdventurerInventory();
    String roomContentOutput = "";
    String message = "";

    String thingParam = request.getParameter("Thing");
    if (thingParam != null) {
        int dropThing = Integer.parseInt(thingParam);
        Thing item = adventurer.getInventoryItem(dropThing);
        if (item != null && currentLoc instanceof Room) {
            ((Room) currentLoc).addObject(item);
            adventurer.drop(item);
            roomContentOutput = ((Room) currentLoc).viewRoomContent();
            message = "You have dropped the item!";
        } else {
            message = "No item found at that number.";
        }
    }
%>
<!DOCTYPE html>
<html>
<body>
    <h3>Drop Command</h3>
    <p><%= message %></p>
    <div>Inventory: <%= inventoryOutput %></div>
    <form action="DropCommand.jsp" method="post">
        <label>Enter item number to drop:</label>
        <input type="number" name="Thing" placeholder="0/1/2/3" required>
        <input type="submit" value="Drop">
    </form>
    <div>Room Contents After Drop: <%= roomContentOutput %></div>
    <form action="index.jsp" method="post">
        <input type="submit" value="Return to Main Menu">
    </form>
</body>
</html>
