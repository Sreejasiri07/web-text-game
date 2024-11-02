<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web_text_game.Location" %>
<%@ page import="web_text_game.Room" %>
<%@ page import="web_text_game.Thing" %>
<jsp:useBean id="adventurer" class="web_text_game.Adventurer" scope="session"/>

<%
    String inventoryOutput = adventurer.viewAdventurerInventory();
    String message = "";

    String thingParam = request.getParameter("Thing");
    if (thingParam != null) {
        int useThing = Integer.parseInt(thingParam);
        Thing item = adventurer.getInventoryItem(useThing);
        if (item != null) {
            adventurer.drop(item);  // Modify if 'use' has different logic
            message = "You have used the item!";
        } else {
            message = "No item found at that number.";
        }
    }
%>
<!DOCTYPE html>
<html>
<body>
    <h3>Use Command</h3>
    <p><%= message %></p>
    <div>Inventory: <%= inventoryOutput %></div>
    <form action="UseCommand.jsp" method="post">
        <label>Enter item number to use:</label>
        <input type="number" name="Thing" placeholder="0/1/2/3" required>
        <input type="submit" value="Use">
    </form>
    <form action="index.jsp" method="post">
        <input type="submit" value="Return to Main Menu">
    </form>
</body>
</html>
