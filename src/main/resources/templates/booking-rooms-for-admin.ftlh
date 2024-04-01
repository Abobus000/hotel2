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
<h4>Забронированные номера:</h4>
    <#list rooms as room>
        <br>
        <b>Номер: ${room.number}   Цена: ${room.price}  Вместимость:${room.place} </b><br>
            <table border="1">
                <tr>
                    <th>Стоимость</th>
                    <th>Дата начала</th>
                    <th>Дата окончания</th>
                    <th>Номер телефона </th>
                    <th>Пользователь</th>
                    <th>Отменить бронирование</th>
                </tr>
               <#list room.getBooking() as booking>
                <tr>
                      <#if booking.status==1>
                <th>${booking.cost} </th>
                <th>${booking.dataStart}</th>
                <th>${booking.dataEnd}</th>
                <th>${booking.user.phoneNumber}</th>
                <th>
                          <form action="/user/${booking.user.id}" method="get">
                              <input type="hidden" name="_csrf" value="${_csrf.token}">
                              <input type="submit" value="Перейти к профилю">
                          </form>
                </th>
                <th>
                    <form action="/booking/cancel/${booking.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Отменить">
                    </form>
                </th>
                </tr>
                      </#if>
               </#list>
            </table>
    <#else>
        <h4>Нет забронированных номеров</h4>
    </#list>
</table>
</body>
</html>