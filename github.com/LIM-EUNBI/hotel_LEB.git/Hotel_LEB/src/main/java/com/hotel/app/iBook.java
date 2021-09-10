package com.hotel.app;

import java.util.ArrayList;

public interface iBook {
	ArrayList<Roominfo> searchRoom(String checkin, String checkout, int typecode);
	void bookRoom(int roomcode, String period1, String period2,int people_num, int total_price, String username, String user_phone);
	ArrayList<BookUser> showBooking();
	ArrayList<BookUser> showRoomTypeBook(String checkin, String checkout, int typecode);
	void updateBook(int roomcode, String period1, String period2, int people_num, int total_price, String username, String user_phone, int bookcode );
	void deleteBook(int bookcode);
	ArrayList<BookUser> searchBook(String username);
}
