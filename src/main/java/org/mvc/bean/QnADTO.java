package org.mvc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class QnADTO {
	private int q_num;
	private String writer;
	private String title;
	private String content;
	private String pin;
	private int ref;
	private String status;
	private Date regdate;
	private int readcount;
	private int re_step;
}
