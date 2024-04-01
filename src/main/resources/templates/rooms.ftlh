<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
    <style>
        #description {
            width: 400px; /* Ширина поля в пикселах */
            length: 200px;
        }
    </style>
</head>
<body>
<h1>HOTEL</h1>
<hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Кабинет администратора</a>
        <a href="/bookingRooms">Забронированные номера</a>
        <a href="/freeRooms">Свободные номера</a>
    </#if>
        <a href="/bookings">Личный кабинет</a>
<#else>
    <a href="/login">Войти</a></h1>
</#if>
<a href="/search">Поиск</a>
<hr>
<h4>Все номера:</h4>
<#list rooms as room>
    <div>
        <p> </b>
           <br><br>   <img src="/images/${room.getPreviewImageId()}" height="300px"/><br><br>
            <b>Цена: </b>${room.price}<br>
            <b>Номер: </b>${room.number}<br>
            <b>Вместимость: </b>${room.place}<br>
 | <a href="/room/${room.id}">Посмотреть номер</a> |
            <#if user.isAdmin()>
                <a href="/room/delete/${room.id}">Удалить номер</a> | <a href="/room/cancel/delete/${room.id}">Отменить бронирования</a> |
                <a href="/room/redaction/${room.id}">Изменить описание номера</a>
            </#if> </p>
    </div>
<#else>
    <h3>Номеров нет</h3>
</#list>
<#if user.email??>
<#if user.isAdmin()>
    <hr>
    <h3>Добавить новый номер</h3>
    <form action="/room/create/" method="post" enctype="multipart/form-data">
        Описание объявления: <input type="text" name="description" id="description"/><br><br>
        Цена: <input type="number" name="price" min="1"/><br><br>
        Вместимость: <input type="number" name="place" min="1"/><br><br>
        Номер: <input type="text" name="number"/><br><br>
        Первая фотография: <input type="file" name="file1"/><br><br>
        Вторая фотография: <input type="file" name="file2"/><br><br>
        Третья фотография: <input type="file" name="file3"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить номер"/>
    </form>
</#if>
</#if>
</body>
</html>