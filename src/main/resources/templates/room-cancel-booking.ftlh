<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1>
<hr>
<#if boolean>
    <h4>Нет бронирований для данного номера</h4>
<#else>
    <h3>Отменить бронирования для номера?</h3>
    <form action="/room/cancel/delete/${id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Отменить все бронирования"/>
    </form>
</#if>
</body>
</html>