package org.mvc.bean;


import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileInfo {

  // 파일 확장자 확인 메소드
	public boolean fileTypeCheck(MultipartFile file, String type) {
		boolean result = false;
		
		String fileType = file.getContentType().split("/")[0];
		if(fileType.equals(type)) {
			result = true;
		}
		return result;
	}

	
	// 이미지 업로드 메소드
	public String imgUpload(MultipartFile save, String name) {
		// HttpServletRequest 객체를 직접적으로 생성함
		// 파라미터를 최소한으로 받기 위함
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder
															.getRequestAttributes())
															.getRequest();
		
		String fileName = null;
		
		if(fileTypeCheck(save, "image")) {
			String orgName = save.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf(".")); 
			fileName = name + ext;
			String path = req.getSession().getServletContext().getRealPath("/resources/image/upload");
			
			File f = new File(path+"//"+fileName);
			try {
				save.transferTo(f);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return fileName;
	}
	
	
	// 이미지 업로드 메소드
		public String classImgUpload(MultipartFile save, Long num) {
			// HttpServletRequest 객체를 직접적으로 생성함
			// 파라미터를 최소한으로 받기 위함
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder
																.getRequestAttributes())
																.getRequest();
			
			String fileName = null;
			
			if(fileTypeCheck(save, "image")) {
				String orgName = save.getOriginalFilename();
				String ext = orgName.substring(orgName.lastIndexOf(".")); 
				fileName = num + ext;
				String path = req.getSession().getServletContext().getRealPath("/resources/coach/img"); 
				
				File f = new File(path+"//"+fileName);
				try {
					save.transferTo(f);
				}catch(Exception e) { 
					e.printStackTrace();
				}
			}
			return fileName; 
		}
	}

