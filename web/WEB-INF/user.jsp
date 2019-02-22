<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home</title>
</head>
<body>


<div style="float: left;width: 40%;">
    <div>
        <img src="/getImage?picName=<c:out value="${user.picUrl}"/>" width="200"/>
    </div>
    <c:out value="${user.name}"/> &nbsp; <c:out value="${user.surname}"/>
</div>
<div style="float: left;width: 55%;">
    All Users:
    <table style="border:1px black solid">
        <tr>
            <td>Name</td>
            <td>Surname</td>
            <td>Picture</td>
            <td>Action</td>
        </tr>
        <c:forEach var="user" items="${notFriends}">

            <tr>
                <td>${user.name}
                </td>
                <td>${user.surname}
                </td>
                <td><img src="/getImage?picName=${user.picUrl}" width="100"/></td>
                <td><a href="/user/request?id=${user.id}">send friend request</a></td>
            </tr>
        </c:forEach>
    </table>

    Friend Requests:
    <table style="border:1px black solid">
        <tr>
            <td>Name</td>
            <td>Surname</td>
            <td>Picture</td>
            <td>Action</td>
        </tr>
        <c:forEach var="user" items="${request}">

            <tr>
                <td>${user.name}
                </td>
                <td>${user.surname}
                </td>
                <td><img src="/getImage?picName=${user.picUrl}" width="100"/></td>
                <td><a href="/user/addFriend?id=${user.id}">accept</a> Or
                    <a href="/user/deleteRequest?id=${user.id}">reject</a></td>
            </tr>
        </c:forEach>
    </table>


    Friends:
    <table style="border:1px black solid">
        <tr>
            <td>Name</td>
            <td>Surname</td>
            <td>Picture</td>
            <td>Action</td>
        </tr>
        <c:forEach var="user" items="${allFriends}">

            <tr>

                <td>${user.name}
                </td>
                <td>${user.surname}
                </td>
                <td><img src="/getImage?picName=${user.picUrl}" width="100"/></td>
                <td><a href="/user/removeFriend?id=${user.id}">delete from friend list</a></td>
            </tr>
        </c:forEach>

    </table>

</div>
</body>
</html>