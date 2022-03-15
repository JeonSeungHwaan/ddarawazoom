package org.mvc.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Component;

@Component
public class DateFormatChange {

	public String dateTimeFull(Date date) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA); 
	    String formattedDate = sdf.format(date);
	    return formattedDate;
	}
}
