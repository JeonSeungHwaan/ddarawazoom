package org.mvc.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
 
//사용자 정보 가져오기
//아이디, 비밀번호, 이메일, 닉네임, 가입날짜, 사진, 회원등급
public class UserInfoDTO {
	
	private String id;
	private String pw;
	private String email;
	private String nick;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private String img;
	private String status;
	
	private String name;
	private String gender;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	private String tel;
	
	private String temp_pw;
}