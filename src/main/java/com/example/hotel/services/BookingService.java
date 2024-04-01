package com.example.hotel.services;
import com.example.hotel.models.Booking;
import com.example.hotel.models.Room;
import com.example.hotel.models.User;
import com.example.hotel.repositories.BookingRepository;
import com.example.hotel.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
/**
 * Класс для работы с бронированиями.
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class BookingService {

    /** Репозиторий бронирований */
    private final BookingRepository bookingRepository;

    /** Репозиторий пользователей */
    private final UserRepository userRepository;

    /**
     * Функция поиска активных броней
     * @return возвращает список активных броней
     * @param rooms - список броней
     */
    public List<Booking> listBookingForActive(List<Room> rooms ) {
        List<Booking> bookingList=new ArrayList<>();
        for(Room room:rooms)
        {
            for(Booking booking:room.getBooking()) {
                if (booking.getStatus()==1)
                {
                    bookingList.add(booking);
                }
            }
        }
        return bookingList;
    }

    /**
     * Функция полученя всех броней
     * @return возвращает список броней
     */
    public List<Booking> listBooking( ) {
        return bookingRepository.findAll();
    }


    /**
     * Функция сохранения броней
     * @return возвращает бронь
     * @param booking - бронь
     * @param dataStart - дата начала
     * @param dataEnd - дата окончания
     * @param room - номер
     */
    public Booking createBooking(Booking booking, Date dataStart, Date dataEnd, Room room) {
        booking.setDataStart(dataStart);
        booking.setDataEnd(dataEnd);
        long diffInMillies = Math.abs(dataEnd.getTime() - dataStart.getTime());
        long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
        booking.setUser(getUserByPrincipal());
        booking.setCost(room.getPrice()*diff);
        booking.setStatus(1);
        booking.setRoom(room);
        return bookingRepository.save(booking);
    }

    /**
     * Функция определения пользователя
     * @return возвращает текущего пользователя
     */
    public User getUserByPrincipal( ) {
        return userRepository.findByEmail(SecurityContextHolder.getContext().getAuthentication().getName());
    }

    /**
     * Функция удаления номера
     * @param id - айди номера
     */
    public void deleteBooking(Long id) {
        bookingRepository.delete(bookingRepository.getById(id));
    }

    /**
     * Функция отмены бронирования
     * @param id - айди брони
     * @return возвращает отмененную бронь
     */
    public Booking cancelBooking(Long id) {
        bookingRepository.getById(id).setStatus(0);
       return editBooking(bookingRepository.getById(id));

    }

    /**
     * Функция отмены списка бронирования
     * @param bookingList - брони
     */
    public void cancelListBooking(List<Booking> bookingList) {
        for(Booking booking: bookingList) {
            booking.setStatus(0);
            editBooking(booking);
        }
    }

    /**
     * Функция удаления списка бронирования
     * @param bookingList - брони
     */
    public void deleteListBooking(List<Booking> bookingList) {
        for(Booking booking: bookingList) {
           deleteBooking(booking.getId());
        }
    }

    /**
     * Функция удаления списка бронирования
     * @param booking - бронь
     * @return возвращает измененную бронь
     */
    public Booking editBooking(Booking booking) {
        return bookingRepository.save(booking);
    }

    /**
     * Функция поиска бронирования
     * @param id - айди брони
     * @return возвращает бронь
     */
    public Booking getBookingById(Long id) {
        return bookingRepository.findById(id).orElse(null);
    }
}
