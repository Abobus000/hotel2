<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1>
<hr>
    <h3>Удалить номер?</h3>
<form action="/room/booking/delete/${id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Удалить бронирования"/>
</form>
<form action="/room/delete/${id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Удалить"/>
</form>
</body>
</html>