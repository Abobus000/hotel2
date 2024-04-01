<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1><hr>
<h4>Отменить бронирование</h4>
<a href="/bookings">Вернуться в личный кабинет</a>
<form action="/booking/cancel/${id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Отменить бронирование"/>
</form>
<#if user.isAdmin()>
    <h4>Администратор: Удалить все бронирования</h4>
    <form action="/booking/delete/${id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Удалить бронирование"/>
    </form>
</#if>
</body>
</html>