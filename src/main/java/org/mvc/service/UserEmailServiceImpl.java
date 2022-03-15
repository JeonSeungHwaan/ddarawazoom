package org.mvc.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.mvc.mybatis.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class UserEmailServiceImpl implements UserEmailService {
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private UserInfoMapper mapper;
	
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// 회원가입 발송 이메일(인증키 발송)
	@Override
	public int mailSendWithUserKey( String user_id, String e_mail) {
		int result = 0;
		
		String key = getKey(false, 20);
		if(mapper.emailTemp(key, user_id, e_mail) == 1) {
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 ddarawazoom 입니다!</h2><br><br>" 
					+ "<h3>" + user_id + "님</h3>" + "<p>회원님의 인증번호는 아래와 같습니다.</p>" 
					+ "<p> 인증번호 : " + key + "</p>"
					+ "<p>(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)</p>";
			try {
				mail.setSubject("[본인인증] ddarawazoom님의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			result = 1;
		}
		
		return result;
	}

}
