package org.mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.mvc.bean.BodyProfileDTO;
import org.mvc.bean.PaymentDTO;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.ScheduleDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.VodDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.mybatis.MyRoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;


@Service
public class MyRoomServiceImpl implements MyRoomService {

// 바디프로필 관련
	@Setter(onMethod_=@Autowired)
	private MyRoomMapper mapper;

	@Override
	public UserInfoDTO getMyProfile(String id) {
		return mapper.getMyProfile(id);
	}
	
	@Override
	public List<BodyProfileDTO> getBodyProfile(String id) {
		return mapper.getBodyProfile(id);
	}
	
	@Override
	public List<BodyProfileDTO> bodyList(String id){
		return mapper.bodyList(id);
	}
	
	@Override
	public int myUpdate(UserInfoDTO userDTO) {
		return mapper.myUpdate(userDTO);
	}

	@Override
	public int bodyWrite(BodyProfileDTO bodyDTO) {
		return mapper.bodyWrite(bodyDTO);
	}

	@Override
	public BodyProfileDTO getBodyInfo(BodyProfileDTO bodyDTO) {
		return mapper.getBodyInfo(bodyDTO);
	}
	
	@Override
	public int bodyUpdate(BodyProfileDTO bodyDTO) {
		return mapper.bodyUpdate(bodyDTO);
	}

	@Override
	public int bodyDelete(int b_num) {
		return mapper.bodyDelete(b_num);
	}

	
//  멤버 정보 관련
	@Override
	public UserInfoDTO getUserInfo(String id) {
		return mapper.getUserInfo(id);
	}

	@Override
	public int updateInfo(UserInfoDTO userDTO) {
		return mapper.updateInfo(userDTO);
	}

	@Override
	public int updateImg(UserInfoDTO userDTO) {
		return mapper.updateImg(userDTO);
	}
	
	@Override 
	public String pwCheck(String id) {
		return mapper.pwCheck(id);
	}
	
	@Override
	public int statusChange(String id) {
		return mapper.statusChange(id);
	}
	
// 멤버 일정 관련
	@Override
	public ArrayList<ScheduleDTO> getAllClass(String id) {
		return mapper.getAllClass(id);
	}

	
// 관심 등록 관련
	@Override
	public ArrayList<ZoomDTO> likeZoomList(String id) {
		return mapper.likeZoomList(id);
	}

	@Override
	public int zoomLikeCheck(String id, Long num) {
		return mapper.zoomLikeCheck(id, num);
	}

	@Override
	public int zoomLikeWrite(String id, int num) {
		return mapper.zoomLikeWrite(id, num);
	}

	@Override
	public int zoomLikeDelete(String id, int num) {
		return mapper.zoomLikeDelete(id, num);
	}
	
	@Override
	public int zoomLikeCount(String id) {
		return mapper.zoomLikeCount(id);
	}
	
// 리뷰 관련
	@Override
	public List<ReviewDTO> getReview(Long num, String id) {
		return mapper.getReview(num, id);
	}

	@Override
	public int reviewCount(String id) {
		return mapper.reviewCount(id);
	}

	@Override
	public ReviewDTO getMyReview(ReviewDTO reviewDTO) {
		return mapper.getMyReview(reviewDTO);
	}
	
	@Override
	public int updateReview(ReviewDTO reviewDTO) {
		return mapper.updateReview(reviewDTO);
	}

	@Override
	public int deleteReview(ReviewDTO reviewDTO) {
		return mapper.deleteReview(reviewDTO);
	}

	
// 결제 내역 관련
	@Override
	public List<PaymentDTO> getPayment(String id){
		return mapper.getPayment(id);
	}

	@Override
	public int getClassNum(String title) {
		return mapper.getClassNum(title);
	}

	@Override
	public int countClassNum(String title) {
		return mapper.countClassNum(title);
	}
}
