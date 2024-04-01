<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1>
<hr>
<#if user.isAdmin()>
    <a href="/admin">Кабинет администратора</a>
    <a href="/bookings">Личный кабинет</a>
</#if>
<a href="/" >Вернуться на главную</a>

<hr>
<h4>Свободные номера:</h4>
    <table border="1">
        <tr>
            <th>Номер</th>
            <th>Стоимость</th>
            <th>Вместимость</th>
            <th>Комната</th>
        </tr>
        <#list rooms as room>
            <tr>
                <th>${room.number} </th>
                <th>${room.price}</th>
                <th>${room.place}</th>
                <th>
                    <form action="/room/${room.id}" method="get">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Подробнее">
                    </form>
                </th>
                </tr>
<#else>
    <h4>Нет забронированных номеров</h4>
</#list>
</table>
</body>
</html>