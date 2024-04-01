<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1><hr>
<h4>Подробная информация о номере</h4>
<#list images as img>
    <img src="/images/${img.id}" height="400px"/><br><br>
</#list>
Описание номера: </b>${room.description}<br>
<b>Цена: </b>${room.price}<br>
<b>Вместимость: </b>${room.place}<br>
<b>Номер: </b>${room.number}<br>
<hr>
<a href="/booking/create/${room.id}">Забронировать</a>
</body>
</html>