<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
</head>
<body>

<c:if test="${message ne null}">
  <p>${message}</p>
</c:if>

<div style="border: 1px black solid; width: 200px">
  <form action="/login" method="post">
    Email: <br>
    <input type="text" name="email" /><br><br>
    Password: <br><br>
    <input type="password" name="password" /><br><br>
    <a href = "/register.jsp">Register</a> <input type="submit" value="Login">

  </form>
</div>
</body>
</html>