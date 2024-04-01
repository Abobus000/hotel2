<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1>
<hr>
<h5>Цена</h5>
    <form action="/search" method="post">
        От: <input type="number" name="priceFrom" min="1" value="1"/><br><br>
        До: <input type="number" name="priceBefore" min="1" value="195000"/><br><br>
        <hr>
        <h5>Время</h5>
        С: <input type="date" name="dateFrom" value="${localDate}" min="${localDate}"/><br><br>
        По: <input type="date" name="dateBefore" value="${localDate2}" min="${localDate2}"/><br><br>
        <hr>
        Вместимость: <input type="number" name="place" min="1" value="1"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Найти"/>
    </form>
<a href="/">Вернуться на главную</a>
<hr>
</body>
</html>