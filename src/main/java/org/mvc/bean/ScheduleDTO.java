package org.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ScheduleDTO {
	private int id;
	private String m_id;
	private String c_id;
	private String title;
	private Date start;
	private Date end;
	private String color;
	private String c_nick;
	
	private String start_date;
	private String start_time;
	private String end_date;
	private String end_time;
}
