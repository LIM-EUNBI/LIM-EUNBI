package com.hotel.app;

public interface iMember {
	void doJoin(String name, String loginid, String passcode, String mobile);
	int selectOne(String loginid, String passcode);
}
