package org.mvc.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.ClassApplyDTO;
import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;

public interface CoachRoomMapper {

	// 스케쥴 데이터 가져오기
	public ArrayList<ScheduleDTO> getAllSchedule(String id);
	
	// 스케쥴 작성
	public int insertSchedule(ScheduleDTO dto);
	
	// 스케쥴 삭제
	public int deleteSchedule(ScheduleDTO dto);
	
	// 스케쥴 수정
	public int updateSchedule(ScheduleDTO dto);
	
	// 수정할 스케쥴 가져오기
	public ScheduleDTO getSchedule(ScheduleDTO dto);
	
	// 코치 기본정보
	public CoachInfoDTO getCoachInfo(String id);
	
	// 모든 코치 경력정보
	public List<CoachCareerDTO> getAllCareerInfo(String id);
	
	// 경력 추가
	public int insertCareer(CoachCareerDTO dto);
	
	// 수정할 경력 정보
	public CoachCareerDTO getCareerInfo(CoachCareerDTO dto);
	
	// 경력 정보 수정
	public int updateCareer(CoachCareerDTO dto);
	
	// 경력 삭제
	public int deleteCareer(CoachCareerDTO dto);
	
	// 코치 정보수정
	public int updateInfo(CoachInfoDTO dto);
	
	// 코치 프로필사진 수정
	public int updateImg(CoachInfoDTO dto);
	
	// 코치소개 수정
	public int updateItroduce(CoachInfoDTO dto);
	
	// 해당 코치가 등록한 모든 수업 정보
	public List<ZoomDTO> getAllClass(@Param("c_id") String id,
								     @Param("startRow") int startRow,
								     @Param("endRow") int endRow);
	
	// 코치 수업 갯수
	public int getClassCount(String id);
	
	// 리뷰보기 버튼을 누른 수업 정보
	public ZoomDTO getClass(@Param("c_id") String c_id, @Param("num") Long num);
	
	// 수업에 작성된 리뷰
	public List<ReviewDTO> getReview(@Param("class_num") Long num, @Param("startRow") int stratRow, @Param("endRow") int endRow);
	
	// 해당 수업의 모든 리뷰 갯수
	public int reviewCount(Long num);
	
	// 해당 수업에 신청한 모든회원 목록
	public List<PaymentDTO> getApplyMember(PaymentDTO dto);
	
	// 해당 수업에 신청한 회원 수
	public int applyMemberCount(int c_num);
	
	// 최신 리뷰목록
	public List<ReviewDTO> getAllReview(String id);
	
	// 매출 정보
	public List<PaymentDTO> getAmount(@Param("c_id") String id,
								      @Param("startDate") String startDate,
									  @Param("endDate") String endDate);
	
	// 마이 프로필 데이터 가져오기
	public UserInfoDTO getMyProfile(String id);
		
	// 최근 바디 프로필 데이터 가져오기
	public List<BodyProfileDTO> getBodyProfile(String id);
		
	// 바디 프로필 리스트 데이터 가져오기
	public List<BodyProfileDTO> bodyList(String id);
}
