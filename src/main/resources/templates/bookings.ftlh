<!DOCTYPE html>
<html>
<head>
    <title>HOTEL</title>
</head>
<body>
<h1>HOTEL</h1>
<h3>${user.name}</h3>
<b>Номер телефона: </b> ${user.phoneNumber}<br>
<b>Email: </b> ${user.email}<br>
<a href="/" >Вернуться на главную</a>
<hr>
<h4>Активное бронирование </h4>
<hr>
<#list user.getBooking() as booking>
    <div>
        <#if booking.status==1>
        <p> <b>Стоимость:${booking.cost}</b> <br>
            <b>Дата начала:${booking.dataStart}</b>  <br>
            <b>Дата окончания:${booking.dataEnd}</b> <br>
            | <a href="/booking/${booking.id}" >Посмотреть номер</a> | <a href="/booking/cancel/${booking.id}" >Отменить бронирование</a></p>
     </#if>
    </div>
<#else>
    <h3>Нет бронирований</h3>

</#list>
<hr>
<h4>Отменено</h4>
<hr>
<#list user.getBooking() as booking>
    <div>
        <#if booking.status==0>
            <p> <b>Стоимость:${booking.cost}</b> <br>
                <b>Дата начала:${booking.dataStart}</b>  <br>
                <b>Дата окончания:${booking.dataEnd}</b> <br> </p>
        </#if>
    </div>
<#else>
    <h3>Нет отмененных</h3>
</#list>
</body>
</html>