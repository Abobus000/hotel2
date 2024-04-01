<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1><hr>
<h4>Подробная информация о номере</h4>
<#list images as img>
    <img src="/images/${img.id}" height="100px"/><br><br>
</#list>

<b>Описание номера: </b>${room.description}<br>
<b>Цена: </b>${room.price}<br>
<b>Вместимость: </b>${room.place}<br>
<b>Номер: </b>${room.number}<br>
<h3>Бронирование номера</h3>
<b>Начало: </b>${booking.dataStart}<br>
<b>Конец: </b>${booking.dataEnd}<br>
<b>Конец: </b>${booking.cost}<br>
<a href="/booking/create/${room.id}">Забронировать еще раз</a>

</body>
</html>