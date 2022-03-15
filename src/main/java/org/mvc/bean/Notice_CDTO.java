package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Notice_CDTO {
	
	private int c_num;
	private int num;
	private String writer_id;
	private String content;
	private int ref;
	private int re_step;
	private int re_level;
	private String deleted;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
}
