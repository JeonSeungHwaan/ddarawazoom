package org.mvc.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class VisitorDTO {
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm")
	private Date v_date;
	private String id;
	private String c_id;

}
