package org.mvc.controller;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mvc.bean.FileInfo;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.CoachRoomService;
import org.mvc.service.MyRoomService;
import org.mvc.service.PaymentService;
import org.mvc.service.UserInfoService;
import org.mvc.service.ZoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
 
@Slf4j
@Controller
@RequestMapping("/ddarawazoom")   
public class ZoomController { 
	
	@Autowired
	private ZoomService service;

	@Autowired
	private MyRoomService myService;
	
	@Autowired
	private PaymentService servicePayment;
	
	@Autowired
	private CoachRoomService coachService;
	
	@Autowired
	private FileInfo fileInfo;   
	
	// ======= zoom강의 메인페이지(리스트) ======= //
	@RequestMapping("zoom")
	public String main(String pageNum, Model model,  HttpSession session, HttpServletRequest request) {
		log.info(" -----CT-----> Main "); 
		
		String id = (String)session.getAttribute("id");
		log.info("아이디=" + id);
		
		String c_id = (String)session.getAttribute("c_id"); 
		log.info("코치아이디=" + c_id); 
		
		int pageSize = 9;
		if (pageNum == null) {
		    pageNum = "1";
		}
	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number= 0;
			
	    count = service.zoomCount();
	    List zoomList = null;
	    if (count > 0) {
	    	zoomList = service.zoomList(startRow, endRow);
	 
	    	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	    	int startPage = (int)(currentPage/10)*10+1;
	    	int pageBlock = 10;
	    	int endPage = startPage + pageBlock - 1;
	    	if (endPage > pageCount) {
	    		endPage = pageCount;
	    	}
	    	model.addAttribute("startPage", startPage);
	    	model.addAttribute("endPage", endPage);
	    	model.addAttribute("pageCount", pageCount);
	    }  
	    
	    number = count - (currentPage-1) * pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("zoomList", zoomList);	
	    
	    return "/zoom/class/zclass";	
	}
	
	// ======= zoom강의 등록페이지 ======= //
	@RequestMapping("/zwriteForm")
	public String zwriteForm(HttpSession session, Model model) {
		log.info(" -----CT-----> writeForm ");
		
		String c_id = (String)session.getAttribute("c_id");
		log.info("코치아이디=" + c_id); 
		model.addAttribute("coachInfo" , coachService.getCoachInfo(c_id));
		
		return "/zoom/class/zwriteForm"; 
	} 
		
	@RequestMapping("/zwritePro")
	public String zwritePro(ZoomDTO dto, Model model) {
		log.info(" -----CT-----> writePro ");
		
		Date now = new Date();
	    SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	    String nowDate = format.format(now);

		dto.setMerchant_uid("ddz" + nowDate); 
		model.addAttribute("result" , service.zoomInsert(dto));
		log.info("dto=" + dto);
		
		return "/zoom/class/zwritePro"; 
	}
	
	// ======= zoom강의 삭제페이지 ======= //
	@RequestMapping("/zdeleteForm")
	public String zdeleteForm(@ModelAttribute("num") int num, HttpSession session, Model model) {
		log.info(" -----CT-----> deleteForm ");
		log.info("num=" + num);
		
		model.addAttribute("zoom" , service.zoomContent(num));
	
		return "/zoom/class/zdeleteForm";
	}
	
	@RequestMapping("zdeletePro")
	public String zdeletePro(int num, Model model) {
		log.info(" -----CT-----> deletePro ");
		log.info("num=" + num + "삭제");
		
		model.addAttribute("result" , service.zoomDelete(num));
		
		return "/zoom/class/zdeletePro";
	}
	
	// ======= zoom강의 수정페이지 ======= //
	@RequestMapping("zupdateForm")
	public String zupdateForm(int num, ZoomDTO dto, Model model) {
		log.info(" -----CT-----> UpdateForm ");
		log.info("num=" + num);
		
		model.addAttribute("ZoomDTO" , service.zoomContent(num));
		
		return "/zoom/class/zupdateForm"; 
	}
	
	@RequestMapping("zupdatePro")
    public String zupdatePro(ZoomDTO dto, Model model) {
        log.info(" -----CT-----> updatePro "); 
        
        model.addAttribute("num" , dto.getNum());
    	model.addAttribute("result" , service.zoomUpdate(dto));
    	log.info("dto=" + dto);
    	
		return "/zoom/class/zupdatePro"; 
	}
	
	// ======= zoom강의실 입장페이지 ======= //
	// 1. 
	// 1 -> 2로 이동
	@RequestMapping("/zclassroom")
	public String zclassroom(Model model, HttpSession session) {
		log.info(" -----CT-----> zclassroom 1 "); 
		String id = (String)session.getAttribute("id");
		model.addAttribute("userInfo", myService.getUserInfo(id));
		return "/zoom/class/zclassroom"; 	
	}
	
	// 2.
	@RequestMapping("/zclassroom2")
	public String zclassroom2() {
		log.info(" -----CT-----> zclassroom 2 "); 
		
		return "/zoom/class/zclassroom2"; 	 
	}
	
	// ======= zoom 내 강의실 페이지 ======= //
	@RequestMapping("/myclassroom")
	public String myclassroom(Model model, HttpSession session) {
		log.info(" -----CT-----> myclassroom "); 
		
		String id = (String)session.getAttribute("id"); 
		
		List<PaymentDTO> PaymentMyList = servicePayment.getPaymentMyList(id);
		model.addAttribute("payment", PaymentMyList); 
		
		return "/zoom/class/myclassroom";
	}
	
	// ======= 조회수 더하기(redirect zclasscontent) ======= //
	@RequestMapping("zoomReadcount")
	public String zoomReadcount(int num, RedirectAttributes rttr) {
		log.info(" -----CT-----> Readcount ");
		
		service.zoomReadcount(num);
		rttr.addAttribute("num" , num); 
		
		return "redirect:/ddarawazoom/zclasscontent";    
	}
	
	// ======= 이미지 업데이트 ======= //
	@RequestMapping("/imgUpdate")
	public String imgUpdate(int num, Model model) {
		log.info(" -----CT-----> imgUpdate ");
		
		model.addAttribute("zoomContent" , service.zoomContent(num));
		
		return "/zoom/class/imgUpdate";
	}
	
	@RequestMapping("/imgUpdatePro")
	public String imgUpdatePro(ZoomDTO dto, MultipartFile save, Model model) {
		log.info(" -----CT-----> imgUpdatePro ");
		
		String fileName = fileInfo.classImgUpload(save, dto.getNum()); 	
		if(fileName != null) {
			dto.setImg(fileName);
			model.addAttribute("result" , service.imgUpdate(dto)); 
		}
		model.addAttribute("num" , dto.getNum());
		
		return "/zoom/class/imgUpdatePro";   
	}
	
	// ======= zoom강의 상세페이지 ======= //
	@RequestMapping("/zclasscontent")
	public String zclasscontent(String pageNum, ZoomDTO dto, int num, Model model, HttpSession session, HttpServletRequest request) { 
		log.info(" -----CT-----> zoomClassContent "); 
			
		String id = (String)session.getAttribute("id");
		log.info("아이디=" + id);
		
		String c_id = (String)session.getAttribute("c_id"); 
		log.info("코치아이디=" + c_id);
		
		if(id != null && c_id == null) {
			model.addAttribute("result" , myService.zoomLikeCheck(id , dto.getNum()));
			model.addAttribute("userInfo", service.getUserInfo(id)); 
		}
		
		int pageSize = 5; 
		if (pageNum == null) {
		    pageNum = "1"; 
		} 
	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    
	    count = service.reCount(num);
	    log.info("reCount" , count);
	    List reviewList = null;
	    if (count > 0) {
	    	reviewList = service.reviewList(num, startRow, endRow); 
	    
	    	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);	   
	    	int startPage = (int)(currentPage/10)*10+1;
	    	int pageBlock = 10;
	    	int endPage = startPage + pageBlock - 1;
	    	if (endPage > pageCount) {
	    		endPage = pageCount;
	    	}
	    	model.addAttribute("startPage", startPage);
	    	model.addAttribute("endPage", endPage);
	    	model.addAttribute("pageCount", pageCount);
	    }
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("reviewList", reviewList);
	    model.addAttribute("zoomContent" , service.zoomContent(num));
	    // 총 결제 갯수
	    model.addAttribute("cnt", servicePayment.getOerderCount());
	    
		return "/zoom/class/zclasscontent";   
	} 
	
	// ======= zoom강의 후기등록 ======= //
	@RequestMapping("re_writeForm")
	public String re_writeForm() {
		log.info(" -----CT-----> re_writeForm "); 
		
		return "/zoom/class/zclasscontent"; 
	}
	
	@RequestMapping("re_writePro")
	public String re_writePro(ReviewDTO dto, Model model) {
		log.info(" -----CT-----> re_writePro "); 
		
		model.addAttribute("num" , dto.getClass_num());  
		model.addAttribute("result" , service.reInsert(dto)); 
		
		return "/zoom/class/re_writePro"; 
	}
	
	// ======= zoom강의 검색페이지 ======= //
	@RequestMapping("/searchClass")
	public String searchClass(String category, String input, String pageNum, Model model) {
		log.info(" -----CT-----> searchClass ");
		log.info("category="+category+"input="+input);

		int pageSize = 9;
		if (pageNum == null) {
		    pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number= 0;

	    count = service.searchCount(category, input);
	    log.info("searchCount" , count);
	    List zoomList = null;
	    if (count > 0) {
	    	zoomList = service.searchList(category, input, startRow, endRow);
	    }

	    if(count > 0) {
	    	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	    	int startPage = (int)(currentPage/10)*10+1;
	    	int pageBlock = 10;
	    	int endPage = startPage + pageBlock - 1;
	    	if (endPage > pageCount) {
	    		endPage = pageCount;
	    	}
	    	model.addAttribute("startPage", startPage);
	    	model.addAttribute("endPage", endPage);
	    	model.addAttribute("pageCount", pageCount);
	    } 

	    number = count - (currentPage-1) * pageSize;

	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("startRow", startRow);
	    model.addAttribute("endRow", endRow);
	    model.addAttribute("count", count);
	    model.addAttribute("number", number);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("zoomList", zoomList);
	    model.addAttribute("category", category);
	    model.addAttribute("input", input);
	 	    
		return "/zoom/class/searchClass";
	}
	
	// ======= 메인 소개페이지 ======= //
	@RequestMapping("intro")
	public String intro() {
		log.info(" -----CT-----> intro "); 
		
		return "/intro/intro"; 
	}
}	