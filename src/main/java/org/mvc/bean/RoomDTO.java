package org.mvc.bean;

import lombok.Data;

@Data
public class RoomDTO {
	int roomNumber;
	String roomName;
	
	@Override
	public String toString() {
		return "Room [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
	}	
}