package org.mvc.bean;

import lombok.Data;

@Data
public class ReviewDTO {
	private int class_num;
	private int review_num;
	private String id;
	private String nick;
	private String title;
	private String content;
	private int grade;
	private String deleted;
}