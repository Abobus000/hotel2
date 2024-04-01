<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
        <hr>
        <h3>Изменить номер</h3>
        <form action="/room/redaction/${id}" method="post" enctype="multipart/form-data">
            Описание объявления: <input type="text" name="description"/><br><br>
            Цена: <input type="number" name="price"/><br><br>
            Вместимость: <input type="number" name="place"/><br><br>
            Номер: <input type="text" name="number"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Изменить номер"/>
        </form>
</body>
</html>