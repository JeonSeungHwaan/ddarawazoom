package org.mvc.controller;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.FileInfo;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.QnADTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.UserEmailService;
import org.mvc.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class MainController {

	@Autowired //service 끌어다 놨다.
	private UserInfoService service;
	
	@Autowired
	private UserEmailService emailService;
	
	@Autowired
	private FileInfo fileInfo;
	
	@RequestMapping
	public String main() {
		log.info("	-----CT----->main Page");
		return "/main/main";
	}
	
	@RequestMapping("/login")
	public String login() {
		log.info("	-----CT----->login Page");
		return "/main/login/login";
	}
	
	
	@RequestMapping("/loginPro")
	public String loginPro(UserInfoDTO userDTO, CoachInfoDTO coachDTO, HttpSession session, Model model) {
		log.info("	-----CT----->loginPro Page");
		System.out.println(userDTO);
		System.out.println(coachDTO);
		
		int result = 0;
		
		if(service.getUserInfoCount(userDTO) == 1){
			if(userDTO.getId().equals("admin")) {
				result = 1;
				session.setAttribute("admin", userDTO.getId());
				model.addAttribute("result", result);
			} else {
				result = 1;
				service.loginCount(userDTO.getId());
				session.setAttribute("id", userDTO.getId());
				model.addAttribute("result", result);
			}
			
		} else {
			coachDTO.setC_id(userDTO.getId());
			coachDTO.setC_pw(userDTO.getPw());
			if(service.coachCheck(coachDTO) == 1) {
				result = 1;
				service.coachLoginCount(userDTO.getId());
				session.setAttribute("c_id", coachDTO.getC_id());
				model.addAttribute("result", result);
			}
		}
		
		return "/main/login/loginPro";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//로그아웃은 세션에 저장된 것을 지우면 된다.
		session.removeAttribute("id");
		session.removeAttribute("c_id");
		//세선에 저장된 모든 것을 지우고 세션을 초기화
		session.invalidate();
		log.info("	-----CT----->logout Page");
		return "/main/logout/logout";
	}
	
	@RequestMapping("/findIdPw")
	public String findid() {
		log.info("	-----CT----->findIdPw Page");
		return "/main/findidpw/findIdPw";
	}
	
	@RequestMapping("/findIdPro")
	public @ResponseBody String findIdPro(@RequestBody UserInfoDTO dto) {
		log.info("	-----CT----->findIdPro Page");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append(dto.getTel());
		sb.insert(3, "-");
		sb.insert(8, "-");
		
		dto.setTel(sb.toString());
		
		String result = null;
		result = service.findId(dto);
		
		return result;
	}
	
	@RequestMapping("/emailSend")
	public @ResponseBody int emailSend(String id, String email) {
		log.info("	-----CT----->emailSend Page");
		
		int result = 0;
		result = emailService.mailSendWithUserKey(id, email);
		
		return result;
	}
	
	@RequestMapping("/emailCheck")
	public @ResponseBody int emailCheck(@RequestBody UserInfoDTO dto) {
		log.info("	-----CT----->emailCheck Page");
		
		int result = 0;
		result = service.emailCheck(dto);
		
		return result;
	}
	
	@RequestMapping("/updatePw")
	public @ResponseBody int updatePw(UserInfoDTO dto, String pw1, String pw2) {
		log.info("	-----CT----->updatePw Page");
		
		int result = 0;
		if(pw1.equals(pw2)) {
			dto.setPw(pw1);
			result = service.updatePw(dto);
		}
		
		return result;
	}
	
	@RequestMapping("/idCheck")
	public @ResponseBody int idCheck(String id) {
		log.info("	-----CT----->idCheck");
		int result = 0;
		
		if(id == "" || id == null) {
			result = -1;
		} else {
			if(service.idCheck(id) == 1 || service.c_idCheck(id) == 1) {
				result = 1;
			}
		}
		
		return result;
	}
	
	@RequestMapping("/nickCheck")
	public @ResponseBody int nickCheck(String nick) {
		log.info("	-----CT----->nickCheck");
		int result = 0;
		
		if(nick == "" || nick == null) {
			result = -1;
		} else {
			if(service.nickCheck(nick) == 1 || service.c_nickCheck(nick) == 1) {
				result = 1;
			}
		}
		
		return result;
	}
	
	@RequestMapping("/signup")
	public String signup(UserInfoDTO dto) {
		
		log.info("------CT----->signupForm Page");
		return "/main/signup/signupForm";
	}
	
	@RequestMapping("/signupPro")
	public String signupPro(UserInfoDTO dto, Model model) {
		//if(service.UserInfo())
		log.info("------CT----->signupPro Page");
		System.out.println(dto);
		model.addAttribute("UserInfoDTO", service.insertUserInfo(dto));
		return "/main/signup/signupPro";
	}
	
	@RequestMapping("/coachsignup")
	public String coachsignup() {
		log.info("------CT----->coachsignup Page");
		return "/main/signup/coachsignupForm";
	}
	
	@RequestMapping("/coachsignupPro")
	public String coachsignupPro(CoachInfoDTO dto, Model model, MultipartFile save) {
		log.info("------CT----->coachsignupPro Page");
		log.info(""+dto);
		log.info(save.getOriginalFilename());
		
		int result = 0;
		result = service.coachInsert(dto);
		
		if(result == 1) {
			String file = fileInfo.imgUpload(save, dto.getC_id());
			if(file != null) {
				dto.setC_img(file);
				service.coachImgUpload(dto);
			}
			model.addAttribute("result", result);
			model.addAttribute("c_id", dto.getC_id());
		}
		return "/main/signup/coachsignupPro";
	}
	
	@RequestMapping("/coachCareerInsert")
	public @ResponseBody int coachCareerInsert(@RequestBody CoachCareerDTO dto) {
		log.info("------CT----->coachCareerInsert Page");
		log.info(""+dto);
		int result = 0;
		
		result = service.careerInsert(dto);
		
		return result;
	}
	
	@RequestMapping("/signupwelcome")
	public String signupwelcome() {
		log.info("------CT----->signupwelcome Page");
		return "/main/signup/signupwelcomeForm";
	}
	
	// ========= 카카오 로그인 ========= //
	@RequestMapping("/kakaoLogin")
	public @ResponseBody int kakaoLogin(@RequestBody UserInfoDTO dto, HttpSession session) {
		log.info("------CT----->kakaoLogin");
		log.info("======== kakao login data => "+dto);
		int result = 0;
		
		if(service.kakaoCheck(dto) == 1) {
			service.loginCount(dto.getId());
			session.setAttribute("id", dto.getId());
			result = 1;
		} else {
			service.loginCount(dto.getId());
			session.setAttribute("id", dto.getId());
			result = service.kakaoInsert(dto);
		}
		
		return result;
	}
	
	@RequestMapping("/naverLogin")
	public String naverLogin() {
		log.info("------CT----->kakaoLogin");
		return "/main/login/naverLogin";
	}
	
	@RequestMapping("/naverLoginPro")
	public @ResponseBody int naverLoginPro(@RequestBody UserInfoDTO dto, HttpSession session) {
		log.info("------CT----->kakaoLoginPro");
		log.info("======== naver login data => "+dto);
		int result = 0;
		
		if(service.naverCheck(dto) == 1) {
			service.loginCount(dto.getId());
			session.setAttribute("id", dto.getId());
			result = 1;
		} else {
			service.loginCount(dto.getId());
			session.setAttribute("id", dto.getId());
			result = service.naverInsert(dto);
		}
		
		return result;
	}

	@RequestMapping("/coachIntro")
	public String coachIntro(Model model) {
		log.info("------CT----->coachIntro");
		model.addAttribute("coachInfo", service.getAllCoach());
		return "/main/coachIntroduce/coachIntro";
	}
	
	@RequestMapping("/coachInfo")
	public String coachInfo(String c_id, Model model) {
		log.info("------CT----->coachInfo");
		
		model.addAttribute("coachInfo", service.coachInfo(c_id));
		model.addAttribute("number", 1);
		model.addAttribute("coachCareer", service.coachCareer(c_id));
		
		List<ZoomDTO> classList = service.getCoachClass(c_id);
		
		model.addAttribute("classNumber", 1);
		model.addAttribute("coachClass", classList);
		model.addAttribute("classCount", classList.size());
		
		return "/main/coachIntroduce/coachInfo";
	}

	@RequestMapping("/QnA")
	public String QnA(Model model, String pageNum) {
		log.info("------CT----->QnA");
		
		int pageSize = 10;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    
	    count = service.getQnACount();
	    System.out.println(count);
	    
	    model.addAttribute("count", count);
	    
	    List<QnADTO> qnaList = null;
	    if(count > 0) {
	    	qnaList = service.getQnAList(startRow, endRow);
	    	model.addAttribute("qnaList", qnaList);
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
	    System.out.println(qnaList);
	    number = count = (currentPage - 1) * pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("number", number);
	    
		return "/main/QnA/QnA";
	}
	
	@RequestMapping("/QnASearch")
	public String qnaSearch(Model model, String pageNum, String category, String input) {
		log.info("------CT----->qnaSearch");
		
		model.addAttribute("category", category);
		model.addAttribute("input", input);
		
		int pageSize = 10;
		if (pageNum == null) {
		    pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    int count = 0;
	    int number = 0;
	    
	    count = service.getQnASearchCount(category, input);
	    System.out.println(count);
	    
	    model.addAttribute("count", count);
	    
	    List<QnADTO> qnaList = null;
	    if(count > 0) {
	    	qnaList = service.getQnASearchList(category, input, startRow, endRow);
	    	model.addAttribute("qnaList", qnaList);
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
	    System.out.println(qnaList);
	    number = count = (currentPage - 1) * pageSize;
	    
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("number", number);
		
		return "/main/QnA/QnASearch";
	}
	
	@RequestMapping("/QnAWrite")
	public String QnAWrite(Model model, HttpSession session, int q_num) {
		log.info("------CT----->QnAWrite");
		
		String id = (String) session.getAttribute("id");
		String c_id = (String) session.getAttribute("c_id");
		
		if(id != null) {
			model.addAttribute("userInfo", service.getUserInfo(id));
		} else if(c_id != null) {
			model.addAttribute("coachInfo", service.getCoachInfo(c_id));
		}
		
		model.addAttribute("q_num", q_num);
		
		return "/main/QnA/QnAWrite";
	}
	
	@RequestMapping("/QnAWritePro")
	public @ResponseBody int QnAWritePro(@RequestBody QnADTO dto) {
		log.info("------CT----->QnAWritePro");
		int result = 0;
		
		System.out.println(dto);
		
		int q_num = dto.getQ_num();
		int ref;
		int re_step;
		
		if(q_num != 0) {
			ref = dto.getQ_num();
			re_step = 1;
			dto.setRef(ref);
			dto.setRe_step(re_step);
			service.answerDone(q_num);
			result = service.insertQnA(dto);
		} else {
			System.out.println(service.getMaxNumber());
			ref = service.getMaxNumber()+1;
			dto.setRef(ref);
			result = service.insertQnA(dto);
		}
		
		System.out.println(dto);
		
		return result;
	}
	
	@RequestMapping("/qnaRcUp")
	public String qnaRcUp(int q_num, RedirectAttributes rttr) {
		log.info("------CT----->QnAContent");
		service.readcountUp(q_num);
		rttr.addAttribute("q_num", q_num);
		return "redirect:/ddarawazoom/QnAContent";
	}
	
	@RequestMapping("/QnAContent")
	public String QnAContent(int q_num, Model model) {
		log.info("------CT----->QnAContent");
		List<QnADTO> list = service.getContent(q_num);
		model.addAttribute("content", list);
		return "/main/QnA/content";
	}
	
}
