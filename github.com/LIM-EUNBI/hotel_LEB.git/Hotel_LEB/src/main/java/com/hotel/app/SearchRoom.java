package com.hotel.app;

public class SearchRoom {
	private String name;
	private int roomcode;
	public SearchRoom() {
	}
	public SearchRoom(String name, int roomcode) {
		this.name = name;
		this.roomcode = roomcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	};
	
}
