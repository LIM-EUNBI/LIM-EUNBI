package com.hotel.app;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	ArrayList<RoomType> getRoomType(); 
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname, int roomtype, int howmany, int howmuch);
	void doUpdateRoom(int roomcode, String roomname, int roomtype, int howmany, int howmuch);
	ArrayList<Roominfo> searchRoom(String checkin, String checkout, int typecode);
	void bookRoom(int roomcode, String period1, String period2,int people_num, int total_price, String username, String user_phone);
	ArrayList<BookUser> showBooking();
}
