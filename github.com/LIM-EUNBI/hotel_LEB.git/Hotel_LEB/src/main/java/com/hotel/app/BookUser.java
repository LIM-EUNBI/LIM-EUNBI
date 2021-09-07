package com.hotel.app;

public class BookUser {
	private int bookcode;
	private int roomcode;
	private int pcount;
	private String name;
	private String mobile;
	private String checkin;
	private String checkout;
	private int price;
	private String roomname;
	private String typename;
	
	public BookUser() {
	}
	public BookUser(int bookcode, int roomcode, int pcount, String name, String mobile, String checkin, String checkout,
			int price, String roomname, String typename) {
		this.bookcode = bookcode;
		this.roomcode = roomcode;
		this.pcount = pcount;
		this.name = name;
		this.mobile = mobile;
		this.checkin = checkin;
		this.checkout = checkout;
		this.price = price;
		this.roomname = roomname;
		this.typename = typename;
	}
	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}

	
}
