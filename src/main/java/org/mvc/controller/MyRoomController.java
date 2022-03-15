package org.mvc.controller;


import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.FileInfo;
import org.mvc.bean.LikeDTO;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.MyRoomService;
import org.mvc.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/myroom")
public class MyRoomController {
	
	@Autowired
	private MyRoomService service;
	
	@Autowired
	private PaymentService servicePayment;
	
	@Autowired
	private FileInfo fileInfo;
	
//================= 멤버 결재 내역 출력 =================//
	@RequestMapping("/payment")
	public String payment (Model model, HttpSession session) {
		log.info("	-----CT-----> my payment");
		
		// id 확인
		String id = (String)session.getAttribute("id");

		// 거래 건수
		int orderCount = servicePayment.getMyOerderCount(id);
		
		// 내 결제 내역 출력
		if (orderCount > 0) {
			List<PaymentDTO> paymentList = servicePayment.getPaymentMyList(id);
			model.addAttribute("payment", paymentList);
			model.addAttribute("orderCount", orderCount);
		} else {
			model.addAttribute("orderCount", orderCount);
		}
				
		return "/myroom/payment/myPayment";
	}
  
	@RequestMapping("/paymentSearch")
	public String paymentSearch (Model model, String category, String input, HttpSession session) {
		log.info("	-----CT-----> my payment");
		
		// id 확인
		String id = (String)session.getAttribute("id");

		// 거래 건수
		int orderCount = servicePayment.getSearchMyOerderCount(id, category, input);
		
		// 내 결제 내역 출력
		if (orderCount > 0) {
			List<PaymentDTO> paymentList = servicePayment.getSearchPaymentMyList(id, category, input);
			model.addAttribute("payment", paymentList);
			model.addAttribute("orderCount", orderCount);
		} else {
			model.addAttribute("orderCount", orderCount);
		}
				
		return "/myroom/payment/myPaymentSearch";
	}
  
//================= 마이룸 메인 화면 =================//
	@RequestMapping()
	public String myroomMain(HttpSession session, Model model, ZoomDTO zoomDTO) {
		log.info("	-----CT----->myroomMain");
		
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("myPayment", service.getPayment(id));
		model.addAttribute("userInfo", service.getMyProfile(id));
		model.addAttribute("bodyProfileDTO", service.getBodyProfile(id));
		model.addAttribute("reviewList" , service.getReview(zoomDTO.getNum(), id));

		return "/myroom/main";
	}


//================= 멤버 관련 코드 시작 =================//
	
	// 회원정보 페이지
	@RequestMapping("/userInfo")
	public String userInfo(HttpSession session, Model model) {
		log.info("	-----CT----->userInfo");
		
		String id = (String)session.getAttribute("id");

		model.addAttribute("userInfo", service.getUserInfo(id));
		
		return "/myroom/userinfo/info";
	}
	
	// 회원정보 수정
	@RequestMapping("/infoUpdate")
	public String userInfoUpdate(UserInfoDTO userDTO, HttpSession session, Model model) {
		log.info("	-----CT----->infoUpdate");

		String id = (String)session.getAttribute("id");
		
		model.addAttribute("userInfo", service.getUserInfo(id));
		
		return "/myroom/userinfo/infoUpdate";
	}
	
	// 회원 정보 수정 동작
	@RequestMapping("/infoUpdateData")
	public @ResponseBody int infoUpdateData(@RequestBody UserInfoDTO userDTO, HttpSession session) {
		log.info("	-----CT----->infoUpdateData");
		
		int result = 0;
		
		String id = (String)session.getAttribute("id");
		
		userDTO.setId(id);
		
		result = service.updateInfo(userDTO);
		
		return result;
	}
	
	// 프로필 이미지 수정
	@RequestMapping("/imgUpdate")
	public String imgUpdate(UserInfoDTO userDTO, HttpSession session, Model model) {
		log.info("	-----CT----->imgUpdate");
		
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("userInfo", service.getUserInfo(id));
		
		return "/myroom/userinfo/imgUpdate";
	}
	
	// 프로필 사진 등록 동작
	@RequestMapping("/imgUpdatePro")
	public @ResponseBody int imgUpdatePro(UserInfoDTO userDTO, MultipartFile save, HttpSession session) {
		log.info("	-----CT----->imgUpdatePro");
		
		String id = (String)session.getAttribute("id");
		
		userDTO.setId(id);
		
		int result = 0;
		
		String file = fileInfo.imgUpload(save, id);
		if(file != null) {
			userDTO.setImg(file);
			result = service.updateImg(userDTO);
		}
		return result;
	}
	
	// 탈퇴 페이지
	@RequestMapping("/userDelete")
	public String userDelete() {
		log.info("	-----CT----->userDelete");
		
		return"/myroom/userinfo/userDelete";
	}
	
	// 탈퇴 동작
	@RequestMapping("/userDeletePro")
	public @ResponseBody int userDelete(UserInfoDTO userDTO, HttpSession session) {
		log.info("	-----CT----->userDeletePro");

		String id = (String)session.getAttribute("id");
		
		int result = 0;

		String pw = service.pwCheck(id);
		
		if(pw.equals(userDTO.getPw())) {
			result = service.statusChange(id);
			session.invalidate(); // session 삭제
		}
		
		return result;
	}
//================= 멤버 관련 코드 종료 =================//
	


//================= 멤버 일정 코드 시작 =================//
	
	// 등록 수업 일정 페이지
	@RequestMapping("/class")
	public String memberClass() {
		log.info("	-----CT----->class");

		return "/myroom/class/class";
	}
	
	// 수업 리스트
	@RequestMapping("/getClass")
	public @ResponseBody ArrayList<ScheduleDTO> getClass(HttpSession session, Model model){
		log.info("	-----CT----->getClass");

		String id = (String)session.getAttribute("id");
		
		return service.getAllClass(id);
	}
	
	@RequestMapping("/getClassNum")
	public @ResponseBody int getClassNum(String title) {
		int result = 0;
		
		if(service.countClassNum(title) == 0) {
			result = 0;
		} else {
			result = service.getClassNum(title);
		}
		
		return result;
	}
//================= 멤버 일정 코드 끝 =================//
		
		
	
//================= 바디 프로필 관련 코드 시작 =================//
	
	// 바디프로필 페이지
	@RequestMapping("/bodyprofile")
	public String bodyprofile(HttpSession session, Model model) { 
		log.info("	-----CT----->/bodypfile/bodyprofile");

		String id = (String)session.getAttribute("id");

		model.addAttribute("userInfo", service.getMyProfile(id));
		model.addAttribute("bodyProfileDTO", service.getBodyProfile(id));
		model.addAttribute("bodyList", service.bodyList(id));
		model.addAttribute("number", 1);
		
		return "/myroom/bodyprofile/content";
	}
	
	// 마이프로필 수정
	@RequestMapping("/bodyprofile/myUpdate")
	public String myUpdate(HttpSession session, Model model) {
		log.info("	-----CT----->/bodypfile/myUpdate");

		String id = (String)session.getAttribute("id");
		
		model.addAttribute("userInfo", service.getMyProfile(id));
		
		return "/myroom/bodyprofile/myUpdate";
	}
	
	// 마이프로필 수정 동작
	@RequestMapping("/bodyprofile/myUpdatePro")
	public String myUpdatePro(HttpSession session, UserInfoDTO userDTO, MultipartFile save, Model model) {		
		log.info("	-----CT----->/bodypfile/bodyUpdatePro");

		String id = (String)session.getAttribute("id");
		
		userDTO.setId(id);
	
		String  file = fileInfo.imgUpload(save, id);
		if(file != null) {
			userDTO.setImg(file);
			model.addAttribute("result", service.myUpdate(userDTO));
		}
		model.addAttribute("id", userDTO.getId());
		
		return "/myroom/bodyprofile/myUpdatePro";
	}
	
	// 바디프로필 작성
	@RequestMapping("/bodyprofile/bodyWrite")
	public String bodyWrite(HttpSession session, Model model) {
		log.info("	-----CT----->/bodypfile/bodyWrite");
		
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("bodyProfileDTO", service.getBodyProfile(id));

		return "/myroom/bodyprofile/bodyWrite";
	}
	
	// 바디프로필 작성 동작
	@RequestMapping("/bodyprofile/bodyWritePro")
	public String bodyWritePro(BodyProfileDTO bodyDTO, MultipartFile save, HttpSession session, Model model) {
		log.info("	-----CT----->/bodypfile/bodyWritePro");

		String id = (String)session.getAttribute("id");
		
		bodyDTO.setB_id(id);
		
		String  file = fileInfo.imgUpload(save, id);
		if(file != null) {
			bodyDTO.setB_img(file);
			model.addAttribute("result",service.bodyWrite(bodyDTO));
		}
		model.addAttribute("b_id", bodyDTO.getB_id());

		return "/myroom/bodyprofile/bodyWritePro";
	}
	
	// 바디프로필 수정
	@RequestMapping("/bodyprofile/bodyUpdate")
	public String bodyUpdate(BodyProfileDTO bodyDTO, HttpSession session, Model model) {
		log.info("	-----CT----->/bodypfile/bodyUpdate");

		String id = (String)session.getAttribute("id");
		
		bodyDTO.setB_id(id);
		
		model.addAttribute("bodyProfileDTO", service.getBodyInfo(bodyDTO));

		return "/myroom/bodyprofile/bodyUpdate";
	}
	
	// 바디프로필 수정 동작
	@RequestMapping("/bodyprofile/bodyUpdatePro")
	public String bodyUpdatePro(BodyProfileDTO bodyDTO,  MultipartFile save, HttpSession session, Model model) {
		log.info("	-----CT----->/bodypfile/bodyUpdatePro");

		String id = (String)session.getAttribute("id");
		
		bodyDTO.setB_id(id);
		
		String num = Integer.toString(bodyDTO.getB_num()); // num  String 형변환 
	
		String  file = fileInfo.imgUpload(save, num);
		if(file != null) {
			bodyDTO.setB_img(file);
			model.addAttribute("result", service.bodyUpdate(bodyDTO));
		}
		
		return "/myroom/bodyprofile/bodyUpdatePro";
	}
	
	// 바디프로필 삭제
	@RequestMapping("/bodyprofile/bodyDelete")
	public String bodyDelete(int b_num, Model model) {
		log.info("	-----CT----->/bodypfile/bodyDelete");

		model.addAttribute("b_num",b_num);
		
		return "/myroom/bodyprofile/bodyDelete";
	}
	
	// 바디프로필 삭제 동작
	@RequestMapping("/bodyprofile/bodyDeletePro")
	public String bodyDeletePro(int b_num, Model model) {
		log.info("	-----CT----->/bodypfile/bodyDeletePro");
		
		model.addAttribute("result",service.bodyDelete(b_num));
		
		return "/myroom/bodyprofile/bodyDeletePro";
	}

//================= 바디 프로필 그래프 출력 =================//
	
	// 바디프로필 그래프
	@RequestMapping("/getBodyList")
	public @ResponseBody List<BodyProfileDTO> getBodyList(Model model, HttpSession session){
		log.info("	-----CT----->getBodyList");
		
		String id = (String)session.getAttribute("id");
		
		//		=========== 날짜 포맷을 mm월 dd일로 바꾼 후 view로 보내는 코드 ===========		//
		
		List<BodyProfileDTO> list = service.bodyList(id); // list 변수에 DB에서 가져온 값을 대입
		List<BodyProfileDTO> resultList = new ArrayList<BodyProfileDTO>(); // view로 보낼 리스트 선언
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일"); // 변경할 날짜 포맷 선언 후 생성
		for(BodyProfileDTO dto : list) { // DB에서 가져온 값을 하나씩 꺼내옴
			String date = sdf.format(dto.getB_date()); // dto안의 b_date의 포맷 변경 후 String 변수에 대입
			
			if(date.substring(4, 5).equals("0")) { // date문자열이(만약 날짜의 월)이 0으로 시작한다면
				StringBuffer dateDelete = new StringBuffer(date);
				date = dateDelete.deleteCharAt(4).toString(); // 문자열 0을 제거 (1번째 index부터 문자열을 잘라냄)
				
				if(date.substring(7, 8).equals("0")) { // 만약 날짜의 일이 0으로 시작한다면 (문자열의 3번째 index가 0이라면)
					 // 문자열을 삭제하는 함수를 사용하기 위해 StringBuffer 클래스 생성
					date = dateDelete.deleteCharAt(7).toString(); // 문자열 0을 제거 (3번째 index를 제거) 후 date 변수에 대입
				}
			}
			dto.setParse_date(date); // 위에서 변환한 날짜를 dto안에 대입
			resultList.add(dto); // view로 보낼 리스트에 dto 대입
		}
		model.addAttribute("bodyList", resultList);
		
		return resultList;
	}
//================= 바디 프로필 관련 코드 종료 =================//

	
	
//================= 관심 페이지 관련 코드 시작 =================//
	
	// 관심 등록 페이지
	@RequestMapping("/locker")
	public String locker() {
		log.info("	-----CT----->locker");
		
		return "/myroom/locker/locker";
	}
	
	// 관심Zoom 페이지
	@RequestMapping("/likeZoom")
	public String likeZoom(String pageNum, HttpSession session, Model model) {
		log.info("	-----CT----->likeZoom");

		String id = (String)session.getAttribute("id");
		
		int count = 0;
		count = service.zoomLikeCount(id);
		
		model.addAttribute("zoomList", service.likeZoomList(id));
		model.addAttribute("count" , count);
		
		return "/myroom/locker/likeZoom";
	}
	
	// Zoom 관심등록
	@RequestMapping("/likeZoom_in")
	public @ResponseBody int zoomLikeWrite(HttpSession session, @RequestBody LikeDTO likeDTO) {
		log.info("	-----CT----->likeZoom_in");
		
		int result = 0;
		
		String id = (String)session.getAttribute("id");
		
		likeDTO.setId(id);
		result = service.zoomLikeWrite(id, likeDTO.getZoom_num());
		
		return result;
	}
	
	// Zoom 관심 제거
	@RequestMapping("/likeZoom_out")
	public @ResponseBody int zoomLikeDelete(HttpSession session, @RequestBody LikeDTO likeDTO) {
		log.info("	-----CT----->likeZoom_out");
		
		int result = 0;
		
		String id = (String)session.getAttribute("id");
		
		likeDTO.setId(id);
		result = service.zoomLikeDelete(id, likeDTO.getZoom_num());
		
		return result;
	}
	
//================= 관심 관련 코드 종료 =================//

	
	
//================= 멤버 리뷰 관련 코드 시작 =================//
	
	// 리뷰 페이지
	@RequestMapping("/review")
	public String memberReview(ZoomDTO zoomDTO, HttpSession session, Model model, String pageNum) {
		log.info("	-----CT----->review");
		
		String id = (String)session.getAttribute("id");
		
		int count = 0;
		
		count = service.reviewCount(id);
		
		List<ReviewDTO> reviewList = null;
		if(count > 0) {
			reviewList = service.getReview(zoomDTO.getNum(), id);
		}
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("count", count);
		return "/myroom/review/review";
	}
	
	// 리뷰 수정 페이지
	@RequestMapping("/reviewUpdate")
	public String reviewUpdate(HttpSession session, Model model, ReviewDTO reviewDTO) {
		log.info("	-----CT----->coachInfoUpdate");
		
		String id = (String)session.getAttribute("id");
		
		reviewDTO.setId(id);
		model.addAttribute("review" , service.getMyReview(reviewDTO));
		
		return "/myroom/review/reviewUpdate";
	}
	
	// 리뷰 업데이트 동작
	@RequestMapping("/reviewUpdateData")
	public @ResponseBody int reviewUpdatePro(HttpSession session, @RequestBody ReviewDTO reviewDTO) {
		log.info("	-----CT----->reviewUpdateData");

		int result = 0;
		
		String id = (String)session.getAttribute("id");
		
		reviewDTO.setId(id);
		result = service.updateReview(reviewDTO);
		
		return result;
	}
	
	// 리뷰 삭제
	@RequestMapping("/reviewDelete")
	public @ResponseBody int reviewDelete(HttpSession session, @RequestBody ReviewDTO reviewDTO) {
		log.info("	-----CT----->reviewDelete");

		int result = 0;
		
		String id = (String)session.getAttribute("id");
		
		reviewDTO.setId(id);
		result = service.deleteReview(reviewDTO);
		
		return result;
	}
//================= 멤버 리뷰 관련 코드 종료 =================//
	

}
	