<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h2>Register:</h2>
<form action="/register" method="post" enctype="multipart/form-data">
    Name:<br>
    <input type="text" name="name"><br><br>
    Surname:<br>

    <input type="text" name="surname"><br><br>
    Email:<br>

    <input type="text" name="email"><br><br>
    Password:<br>

    <input type="password" name="password"><br><br>
    image:<br>
    <input type="file" name="picture"/><br>
    <a href = "/login.jsp">Login</a>
    <input type="submit" value="Register" style="margin-left: 56px">

</form>
</body>
</html>