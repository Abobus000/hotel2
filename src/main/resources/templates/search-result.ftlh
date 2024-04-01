<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1>
<h4>Подходящие номера:</h4>
<#list rooms as room>
    <div>
        <p>   <br><br>   <img src="/images/${room.getPreviewImageId()}" height="100px"/><br><br>
            <b>Цена: </b>${room.price}<br>
            <b>Вместимость: </b>${room.place}<br>
            | <a href="/room/${room.id}">Посмотреть номер</a> </p>
    </div>
<#else>
    <h3>Подходящих номеров не найдено</h3>
</#list>
<a href="/">Вернуться на главную</a>
</body>
</html>