package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeDTO {
	
	private int num;
	private String title;
	private String content;
	private String writer_id;
	private String target_id;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private int viewcnt;
	private String img;
	private String pin;

}
