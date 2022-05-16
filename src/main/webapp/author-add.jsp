<%--
  Created by IntelliJ IDEA.
  User: georgemarianmihailescu
  Date: 16.05.2022
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add author</title>
    <link rel="stylesheet" href="styles/main.css"/>
</head>
<body>
<div class="form-wrapper">
    <form class="form" method="post" action="add-author">
        <label for="name" >Name</label>
        <input id="name" type="text" name="name" />
        <label for="age" >Age</label>
        <input id="age" type="text" name="age" />

        <input type="submit" value="Add author"/>
    </form>
</div>
</body>
</html>
