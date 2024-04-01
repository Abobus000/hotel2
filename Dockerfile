# Используем базовый образ с установленной Java
FROM openjdk:11-jre-slim

# Устанавливаем переменную среды для указания директории приложения
ENV APP_HOME /app

# Создаем директорию для приложения
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Копируем JAR-файл в контейнер
COPY target/buysell-0.0.1-SNAPSHOT.jar $APP_HOME/app.jar

# Устанавливаем переменную среды для указания настройки Spring для использования H2
ENV SPRING_PROFILES_ACTIVE h2

# Экспонируем порт, на котором работает приложение
EXPOSE 8080

# Команда для запуска приложения
CMD ["java", "-jar", "app.jar"]
