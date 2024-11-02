<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="web_text_game.Location" %>
<%@ page import="web_text_game.Room" %>
<jsp:useBean id="adventurer" class="web_text_game.Adventurer" scope="session"/>

<%
    Location currentLoc = adventurer.getLocation();
    String roomContentOutput = "";
    String inventoryOutput = adventurer.viewAdventurerInventory();

    if (currentLoc instanceof Room) {
        roomContentOutput = ((Room) currentLoc).viewRoomContent();
    }
%>
<!DOCTYPE html>
<html>
<body>
    <h3>Look Command</h3>
    <div>Current Room Contents: <%= roomContentOutput %></div>
    <div>Inventory: <%= inventoryOutput %></div>
    <form action="index.jsp" method="post">
        <input type="submit" value="Return to Main Menu">
    </form>
</body>
</html>
