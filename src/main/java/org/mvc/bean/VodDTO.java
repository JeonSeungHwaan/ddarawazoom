package org.mvc.bean;

import lombok.Data;

@Data
public class VodDTO {
	private int num;
    private String url;
    private String category;
    private String title;
    private String time;
    private String difficulty;
    private String info;
    private int count;
}
