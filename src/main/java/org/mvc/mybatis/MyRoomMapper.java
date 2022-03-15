package org.mvc.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.VodDTO;
import org.mvc.bean.ZoomDTO;

public interface MyRoomMapper {

	// 마이 프로필 데이터 가져오기
	public UserInfoDTO getMyProfile(String id);
	
	// 최근 바디 프로필 데이터 가져오기
	public List<BodyProfileDTO> getBodyProfile(String id);
	
	// 바디 프로필 리스트 데이터 가져오기
	public List<BodyProfileDTO> bodyList(String id);
	
	// 마이 프로필 수정
	public int myUpdate(UserInfoDTO userDTO);
	
	// 바디 프로필 작성
	public int bodyWrite(BodyProfileDTO bodyDTO);
	
	// 수정에 필요한 바디 프로필 데이터 가져오기
	public BodyProfileDTO getBodyInfo(BodyProfileDTO bodyDTO);
	
	// 바디 프로필 수정
	public int bodyUpdate(BodyProfileDTO bodyDTO);
	
	// 바디 프로필 삭제
	public int bodyDelete(int b_num);

	// 멤버 정보 데이터 가져오기
	public UserInfoDTO getUserInfo(String id);
	
	// 멤버 정보 수정
	public int updateInfo(UserInfoDTO userDTO);
	
	// 멤버 프로필 이미지 수정
	public int updateImg(UserInfoDTO userDTO);
		
	// 멤버 탈퇴를 위한 패스워드 체크
	public String pwCheck(String id);
	
	// 멤버 탈퇴
	public int statusChange(String id);
	
	// 멤버 일정 데이터 데이터 가져오기
	public ArrayList<ScheduleDTO> getAllClass(String id);
	
	public int getClassNum(String title);
	
	public int countClassNum(String title);
	
	// Zoom 관심등록 데이터 가져오기
	public ArrayList<ZoomDTO> likeZoomList(String id);
	
	// Zoom 관심 체크 여부 확인
	public int zoomLikeCheck(
			@Param("id") String id,
			@Param("zoom_num") Long num);
	
	// Zoom 관심 등록
	public int zoomLikeWrite(
			@Param("id") String id,
			@Param("zoom_num") int num);
	
	// Zoom 관심 등록 해제
	public int zoomLikeDelete(
			@Param("id") String id,
			@Param("zoom_num") int num);
	
	// Zoom 관심 등록 갯수
	public int zoomLikeCount(String id);
	
	// 작성한 리뷰 가져오기
	public List<ReviewDTO> getReview(
			@Param("class_num") Long num,
			@Param("id") String id);
	
	// 작성한 리뷰 갯수
	public int reviewCount(String id);
	
	// 수정에 필요한 리뷰 데이터 가져오기
	public ReviewDTO getMyReview(ReviewDTO reviewDTO);
	
	// 리뷰 수정
	public int updateReview(ReviewDTO reviewDTO);
	
	// 리뷰 삭제
	public int deleteReview(ReviewDTO reviewDTO);
	
	// 결제 내역 출력
	public List<PaymentDTO> getPayment(String id);
}
