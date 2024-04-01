package com.example.hotel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
/**
 * Класс для запуска приложения на Spring.
 * @author Ирина Кол
 */
@SpringBootApplication
public class HotelApplication {
	/**
	 * Функция запуска приложения
	 */
	public static void main(String[] args) {
		SpringApplication.run(HotelApplication.class, args);
	}
}
