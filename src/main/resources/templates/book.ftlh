<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1><hr>
<h3>Забронировать номер</h3>
<form action="/booking/create/${room.id}" method="post" enctype="multipart/form-data">
    Начало: <input type="date" value="${localDate}" min="${localDate}" name="dataStart"/><br><br>
    Конец: <input type="date" value="${localDate2}" min="${localDate2}" name="dataEnd"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Забронировать номер"/>
</form>

</body>
</html>