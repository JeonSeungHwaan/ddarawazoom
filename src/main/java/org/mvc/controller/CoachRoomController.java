package org.mvc.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.ClassApplyDTO;
import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.FileInfo;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.service.CoachRoomService;
import org.mvc.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coachroom")
public class CoachRoomController {
   
	@Setter(onMethod_=@Autowired)
	private CoachRoomService service;
	
	@Autowired
	private PaymentService servicePayment;
	
	@Autowired
	private FileInfo fileInfo;
	
//  =========== 코치룸 메인화면 ===========  //	
	@RequestMapping()
	public String main(HttpSession session, Model model) {
		log.info("	-----CT----->coachMain");
		
		String c_id = (String)session.getAttribute("c_id");

		model.addAttribute("reviewList", service.getAllReview(c_id));
		
		return "/coachroom/main";
	}
	
//  =========== 코치정보 관련 코드 시작 ===========  //	
	@RequestMapping("/info")
	public String info(HttpSession session, Model model) {
		log.info("	-----CT----->coachInfo");
		String c_id = (String)session.getAttribute("c_id");
		
		model.addAttribute("coachInfo", service.getCoachInfo(c_id));
		model.addAttribute("coachCareer", service.getAllCareerInfo(c_id));
		// 경력이 여러개일 경우 앞의 갯수 카운팅을 위해 1을 넘김
		model.addAttribute("number", 1);
		
		return "/coachroom/coachinfo/info";
	}

	@RequestMapping("/infoUpdate")
	public String infoUpdate(HttpSession session, Model model) {
		log.info("	-----CT----->coachInfoUpdate");
		
		String c_id = (String)session.getAttribute("c_id");
		
		model.addAttribute("coachInfo", service.getCoachInfo(c_id));
		
		return "/coachroom/coachinfo/infoUpdate";
	}
	
	@RequestMapping("/infoUpdateData")
	public @ResponseBody int infoUpdateData(@RequestBody CoachInfoDTO dto, HttpSession session) {
		log.info("	-----CT----->infoUpdateData");
		log.info(""+dto);
		
		int result = 0;
		
		if(dto.getC_gender().equals("0")) {
			dto.setC_gender("남성");
		} else if(dto.getC_gender().equals("1")) {
			dto.setC_gender("여성");
		}
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		result = service.updateInfo(dto);
		
		return result;
	}
	
	@RequestMapping("/imgUpdate")
	public String imgUpdate() {
		log.info("	-----CT----->imgUpdate");
		return "/coachroom/coachinfo/imgUpdate";
	}
	
	@RequestMapping("/imgUpdatePro")
	public @ResponseBody int imgUpdatePro(CoachInfoDTO dto, MultipartFile save, HttpSession session) {
		log.info("	-----CT----->imgUpdatePro");
		log.info(""+save.getOriginalFilename());
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		int result = 0;
		
		String file = fileInfo.imgUpload(save, c_id);
		if(file != null) {
			dto.setC_img(file);
			result = service.updateImg(dto);
		}
		return result;
	}
	
	@RequestMapping("/careerInsert")
	public String careerInsert() {
		log.info("	-----CT----->careerInsert");
		return "/coachroom/coachinfo/careerInsert";
	}
	
	@RequestMapping("/careerInsertPro")
	public @ResponseBody int careerInsertPro(HttpSession session, @RequestBody CoachCareerDTO dto) {
		log.info("	-----CT----->careerInsertPro");

		int result = 0;
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		result = service.insertCareer(dto);
		
		return result;
	}
	
	@RequestMapping("/careerUpdate")
	public String careerUpdate(HttpSession session, Model model, CoachCareerDTO dto) {
		log.info("	-----CT----->careerUpdate");
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		model.addAttribute("coachCareer", service.getCareerInfo(dto));
		
		return "/coachroom/coachinfo/careerUpdate";
	}
	
	@RequestMapping("/careerUpdatePro")
	public @ResponseBody int careerUpdatePro(HttpSession session, @RequestBody CoachCareerDTO dto) {
		log.info("	-----CT----->careerUpdatePro");
		
		int result = 0;
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		result = service.updateCareer(dto);
		
		return result;
	}
	
	@RequestMapping("/careerDelete")
	public @ResponseBody int careerDelete(HttpSession session, @RequestBody CoachCareerDTO dto) {
		log.info("	-----CT----->careerDelete");
		
		int result = 0;
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		result = service.deleteCareer(dto);
		
		return result;
	}
	
	@RequestMapping("/introduceUpdate")
	public String introduceUpdate() {
		log.info("	-----CT----->introduceUpdate");
		return "/coachroom/coachinfo/introduceUpdate";
	}
	
	@RequestMapping("/introduceUpdatePro")
	public @ResponseBody int introduceUpdatePro(HttpSession session, @RequestBody CoachInfoDTO dto) {
		log.info("	-----CT----->introduceUpdatePro");
		log.info(""+dto);
		int result = 0;
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		result = service.updateItroduce(dto);
		
		return result;
	}
//  =========== 코치정보 관련 코드 종료 ===========  //	
	
//  =========== 스케줄 관련 코드 시작 ===========  //
	@RequestMapping("/schedule")
	public String coachSchedule() {
		log.info("	-----CT----->coachSchedule");
		
		return "/coachroom/schedule/schedule";
	}
	
	@RequestMapping("/getSchedule")
	public @ResponseBody ArrayList<ScheduleDTO> getSchedule(HttpSession session, Model model) {
		log.info("	-----CT----->getSchedule");
		String c_id = (String)session.getAttribute("c_id");
		
		return service.getAllSchedule(c_id);
	}
	
	@RequestMapping("/add_event")
	public String add_event() {
		log.info("	-----CT----->add_event");
		return "/coachroom/schedule/schedule_add";
	}
	
	@RequestMapping("/add_eventPro")
	public @ResponseBody int add_eventPro(@RequestBody ScheduleDTO dto, HttpSession session) throws ParseException {
		log.info("	-----CT----->add_eventPro");
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		// 날짜와 시간정보를 각각 String 값으로 받은 후 두개를 합쳐서 Date 타입으로 변환 후 데이터 삽입
		String startStr = dto.getStart_date() +" "+ dto.getStart_time();
		String endStr = dto.getEnd_date() + " " + dto.getEnd_time();
				
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		Date start = transFormat.parse(startStr);
		Date end = transFormat.parse(endStr);
				
		dto.setStart(start);
		dto.setEnd(end);
		
		int result = service.insertSchedule(dto);
		
		return result;
	}
	
	@RequestMapping("/schedule_popup")
	public String sechedule_popup(ScheduleDTO dto, Model model) {
		log.info("	-----CT----->schedule_popup");
		log.info(""+dto);
		model.addAttribute("dto", dto);
		return "/coachroom/schedule/schedule_popup";
	}
	
	@RequestMapping("/delete_event")
	public @ResponseBody int delete_event(int id) {
		log.info("	-----CT----->delete_event // id ----->"+id);
		
		ScheduleDTO dto = new ScheduleDTO();
		dto.setId(id);
		int result = service.deleteSchedule(dto);
		return result;
	}
	
	@RequestMapping("/update_schedule")
	public String update_schedule(HttpSession session, ScheduleDTO dto, Model model) {
		log.info("	-----CT----->update_schedule");
		log.info(""+dto.getId());
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		log.info(""+service.getSchedule(dto));
		
		model.addAttribute("schedule", service.getSchedule(dto));
		return "/coachroom/schedule/schedule_update";
	}
	
	@RequestMapping("/update_schedulePro")
	public @ResponseBody int update_schedulePro(@RequestBody ScheduleDTO dto, HttpSession session) throws ParseException {
		log.info("	-----CT----->update_schedulePro");
		log.info(""+dto);
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		// 날짜와 시간정보를 각각 String 값으로 받은 후 두개를 합쳐서 Date 타입으로 변환 후 데이터 삽입
		String startStr = dto.getStart_date() +" "+ dto.getStart_time();
		String endStr = dto.getEnd_date() + " " + dto.getEnd_time();
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		Date start = transFormat.parse(startStr);
		Date end = transFormat.parse(endStr);
		
		dto.setStart(start);
		dto.setEnd(end);
		
		int result = service.updateSchedule(dto);
		
		return result;
	}
//	=========== 스케줄 관련 코드 종료 ===========  //
	
//	=========== 리뷰관리 관련 코드 시작 ===========  //
	
	// 코치가 등록한 수업 목록
	@RequestMapping("/class")
	public String review(HttpSession session, Model model, String pageNum) {
		log.info("	-----CT----->class");
		
		String c_id = (String)session.getAttribute("c_id");
		
		int pageSize = 10;
		
		if (pageNum == null) {
		       pageNum = "1";
		}

	    int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		
		count = service.getClassCount(c_id);
		List classList = null;
		if(count > 0) {
			classList = service.getAllClass(c_id, startRow, endRow);
			
			int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
			 
	        int startPage = (int)(currentPage/10)*10+1;
			int pageBlock=10;
	        int endPage = startPage + pageBlock-1;
	        if (endPage > pageCount) endPage = pageCount;
	        
	        model.addAttribute("startPage", startPage);
	        model.addAttribute("endPage", endPage);
	        model.addAttribute("pageCount", pageCount);
		}
		
		model.addAttribute("classList", classList);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("count", count);
		
		return "/coachroom/list";
	}
	
	// 해당 수업의 리뷰 목록
	@RequestMapping("/reviewContent")
	public String content(ZoomDTO dto, String pageNum, Model model, HttpSession session) {
		log.info("	-----CT-----> review/content");
		
		String c_id = (String)session.getAttribute("c_id");
		
		dto.setC_id(c_id);
		
		int pageSize = 10;
		
		if (pageNum == null) {
		       pageNum = "1";
		}

	    int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		
		count = service.reviewCount(dto.getNum());
		List reviewList = null;
		if(count > 0) {
			reviewList = service.getReview(dto.getNum(), startRow, endRow);
			
	        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
			 
	        int startPage = (int)(currentPage/10)*10+1;
			int pageBlock=10;
	        int endPage = startPage + pageBlock-1;
	        if (endPage > pageCount) endPage = pageCount;
	        
	        model.addAttribute("startPage", startPage);
	        model.addAttribute("endPage", endPage);
	        model.addAttribute("pageCount", pageCount);
	        
	    }
		
		model.addAttribute("classContent", service.getClass(c_id, dto.getNum()));
		model.addAttribute("review", reviewList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		
		return "/coachroom/review/reviewPage";
	}
//	=========== 리뷰관리 관련 코드 종료 ===========  //	
	
//	=========== 회원관리 관련 코드 시작 ===========  //	
	@RequestMapping("/member")
	public String member(PaymentDTO dto, Model model, HttpSession session) {
		log.info("	-----CT-----> member/content");
		
		String c_id = (String)session.getAttribute("c_id");
		
		int num = Integer.parseInt(dto.getC_num());
		
		model.addAttribute("classContent", service.getClass(c_id, Long.valueOf(num)));
		model.addAttribute("member", service.getApplyMember(dto));
		model.addAttribute("count", service.applyMemberCount(num));
		
		return "/coachroom/member/memberPage";
	}
	
	@RequestMapping("/bodyprofile")
	public String bodyprofile(String id, Model model) { 
		log.info("	-----CT----->/bodypfile/bodyprofile");

		model.addAttribute("userInfo", service.getMyProfile(id));
		model.addAttribute("bodyProfileDTO", service.getBodyProfile(id));
		model.addAttribute("bodyList", service.bodyList(id));
		model.addAttribute("number", 1);
		
		return "/coachroom/member/content";
	}
	
	@RequestMapping("/getBodyList")
	public @ResponseBody List<BodyProfileDTO> getBodyList(Model model, String id){
		log.info("	-----CT----->getBodyList");
		log.info(id);
		
		//		=========== 날짜 포맷을 mm월 dd일로 바꾼 후 view로 보내는 코드 ===========		//
		
		List<BodyProfileDTO> list = service.bodyList(id); // list 변수에 DB에서 가져온 값을 대입
		List<BodyProfileDTO> resultList = new ArrayList<BodyProfileDTO>(); // view로 보낼 리스트 선언
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일"); // 변경할 날짜 포맷 선언 후 생성
		for(BodyProfileDTO dto : list) { // DB에서 가져온 값을 하나씩 꺼내옴
			String date = sdf.format(dto.getB_date()); // dto안의 b_date의 포맷 변경 후 String 변수에 대입
			
			if(date.substring(4, 5).equals("0")) { // date문자열이(만약 날짜의 월)이 0으로 시작한다면
				StringBuffer dateDelete = new StringBuffer(date);
				date = dateDelete.deleteCharAt(4).toString(); // 문자열 0을 제거 (4번째 index의 문자를 제거)
				
				if(date.substring(7, 8).equals("0")) { // 만약 날짜의 일이 0으로 시작한다면 (문자열의 3번째 index가 0이라면)
					 // 문자열을 삭제하는 함수를 사용하기 위해 StringBuffer 클래스 생성
					date = dateDelete.deleteCharAt(7).toString(); // 문자열 0을 제거 (3번째 index의 문자를 제거)
				}
			}
			dto.setParse_date(date); // 위에서 변환한 날짜를 dto안에 대입
			resultList.add(dto); // view로 보낼 리스트에 dto 대입
		}
		model.addAttribute("bodyList", resultList);
		
		return resultList;
	}
//	=========== 회원관리 관련 코드 종료 ===========  //	

	
//	=========== 코치 수입 관련 코드 시작 ===========  //
	@RequestMapping("/payment")
	public String payment (Model model, HttpSession session) {
		log.info("	-----CT-----> coach payment");
		
		// 코치 확인
		String c_id = (String)session.getAttribute("c_id");
		
		// 거래 건수
		int orderCount = servicePayment.getCoachOerderCount(c_id);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("orderPaidCount", servicePayment.getCoachOerderCountByStatus(c_id, "paid"));
		model.addAttribute("orderCreqCount", servicePayment.getCoachOerderCountByStatus(c_id, "creq"));
		model.addAttribute("orderCanclledCount", servicePayment.getCoachOerderCountByStatus(c_id, "cancelled"));
		
		// 코치별 결제 내역 출력
		List<PaymentDTO> paymentList = servicePayment.getPaymentCoachList(c_id);
		model.addAttribute("payment", paymentList);
		
		// 코치별 총 거래액, 환불액, 매출액
		DecimalFormat fmt = new DecimalFormat("###,###");
		int amount = 0;
		int cancelAmount = 0;
		
		if (orderCount > 0) {
			amount = servicePayment.getAmountCoach(c_id);
			cancelAmount = servicePayment.getCancelAmountCoach(c_id);
			String amountFmt = fmt.format(amount);
			String cancelAmoutFmt = fmt.format(cancelAmount);			
			model.addAttribute("amount", amountFmt);
			model.addAttribute("cancelAmount", cancelAmoutFmt);
		} else {
			model.addAttribute("amount", amount);
			model.addAttribute("cancelAmount", cancelAmount);
		}
		
		int sales = amount - cancelAmount;
		String salseFmt = fmt.format(sales);
		model.addAttribute("sales", salseFmt);
		
		return "/coachroom/payment/coachPayment";
	}
	
	@RequestMapping("/paymentSearch")
	public String paymentSearch (Model model, String category, String input, HttpSession session) {
		log.info("	-----CT-----> coach Search payment");
		
		// 코치 확인
		String c_id = (String)session.getAttribute("c_id");
		
		// 거래 건수
		int orderCount = servicePayment.getSearchCoachOerderCount(c_id, category, input);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("orderPaidCount", servicePayment.getSearchCoachOerderCountByStatus(c_id, "paid", category, input));
		model.addAttribute("orderCreqCount", servicePayment.getSearchCoachOerderCountByStatus(c_id, "creq", category, input));
		model.addAttribute("orderCanclledCount", servicePayment.getSearchCoachOerderCountByStatus(c_id, "cancelled", category, input));
		
		// 코치별 결제 내역 출력
		List<PaymentDTO> paymentList = servicePayment.getSearchPaymentCoachList(c_id, category, input);
		model.addAttribute("payment", paymentList);
		
		// 코치별 총 거래액, 환불액, 매출액
		DecimalFormat fmt = new DecimalFormat("###,###");
		int amount = 0;
		int cancelAmount = 0;
		
		if (orderCount > 0) {
			amount = servicePayment.getSearchAmountCoachTotal(c_id, category, input);
			cancelAmount = servicePayment.getSearchCancelAmountCoachTotal(c_id, category, input);
			String amountFmt = fmt.format(amount);
			String cancelAmoutFmt = fmt.format(cancelAmount);			
			model.addAttribute("amount", amountFmt);
			model.addAttribute("cancelAmount", cancelAmoutFmt);
		} else {
			model.addAttribute("amount", amount);
			model.addAttribute("cancelAmount", cancelAmount);
		}
		
		int sales = amount - cancelAmount;
		String salseFmt = fmt.format(sales);
		model.addAttribute("sales", salseFmt);
		
		return "/coachroom/payment/coachPaymentSearch";
	}

	// 월별 매출 이력
	@RequestMapping("/getPayment")
	public @ResponseBody Map<String, Integer> getPayment(HttpSession session) throws ParseException {
		log.info("	-----CT-----> getPayment");
		String c_id = (String)session.getAttribute("c_id");
		
		// view로 보낼 월별 매출을 저장한 HashMap 생성
		Map<String, Integer> payMap = new TreeMap<>();
		
		// 정확한 날짜계산을 위해 날짜포멧 객체 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		
		// String값으로 날짜 선언
		String startDate = null;
		String endDate = null;
		
		// 월별 계산을 위해 1월부터 12월까지 반복문 생성
		for(int i = 1; i <= 12; i++) {
			
			// 시작날짜와 종료날짜에 년도 대입
			startDate = "2022";
			endDate = "2022";
			// 시작날짜와 종료날짜에 월 대입
			startDate += "-" + i;
			endDate += "-" + (i+1);
			
			// 정확한 날짜를 위해 String 값을 날짜로 한 번 변환한 후
			Date parseStartDate = sdf.parse(startDate);
			Date parseEndDate = sdf.parse(endDate);
			// 변환한 날짜를 다시 String값에 대입
			startDate = sdf.format(parseStartDate);
			endDate = sdf.format(parseEndDate);
			log.info(startDate);
			log.info(endDate);
			
			// 해당 월의 총 수입을 담을 int값 선언
			int amount = 0;
			// startDate ~ endDate 범위의 날짜의 정보를 가져옴
			List<PaymentDTO> payList = service.getAmount(c_id, startDate, endDate);
			// 가져온 정보를 for문을 돌려서 amount 변수에 전부 더함
			for(PaymentDTO payDTO : payList) {
				amount += payDTO.getAmount();
			}
			// view로 보낼 HashMap에 날짜와 총 수입을 담음
			if(i < 10) {
				payMap.put("0"+i+"월", amount);
			} else {
				payMap.put(i+"월", amount);
			}
			
			log.info(""+amount);
			
		}
		
		log.info(""+payMap);
		return payMap;
	}
//	=========== 코치 수입 관련 코드 종료 ===========  //
	
}
