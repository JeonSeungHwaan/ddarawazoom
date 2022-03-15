package org.mvc.service;

import java.util.List;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;
import org.mvc.bean.QnADTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.VisitorDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.mybatis.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerMapper mapper;

	@Override
	public List<CoachInfoDTO> getAllCoachInfo() {
		return mapper.getAllCoachInfo();
	}

	@Override
	public int countAllCoach() {
		return mapper.countAllCoach();
	}

	@Override
	public CoachInfoDTO coachInfo(String c_id) {
		return mapper.coachInfo(c_id);
	}

	@Override
	public List<CoachCareerDTO> coachCareer(String c_id) {
		return mapper.coachCareer(c_id);
	}

	@Override
	public List<ZoomDTO> getCoachClass(String c_id) {
		return mapper.getCoachClass(c_id);
	}

	@Override
	public int deleteClass(int num) {
		return mapper.deleteClass(num);
	}

	@Override
	public int restoreClass(int num) {
		return mapper.restoreClass(num);
	}

	@Override
	public int changeStatus(CoachInfoDTO dto) {
		return mapper.changeStatus(dto);
	}

	@Override
	public int countAllUser() {
		return mapper.countAllUser();
	}

	@Override
	public UserInfoDTO userInfo(String id) {
		return mapper.userInfo(id);
	}

	@Override
	public int updateUserPw(UserInfoDTO userDTO) {
		return mapper.updateUserPw(userDTO);
	}

	@Override
	public int userDelete(String id) {
		return mapper.userDelete(id);
	}

	@Override
	public List<UserInfoDTO> getUserInfo() {
		return mapper.getUserInfo();
	}

	@Override
	public int userCount() {
		return mapper.userCount();
	}
	
	@Override
	public List<UserInfoDTO> newUser() {
		return mapper.newUser();
	}
	
	@Override
	public int newUserCount() {
		return mapper.newUserCount();
	}

	@Override
	public List<UserInfoDTO> getDeleteUser() {
		return mapper.getDeleteUser();
	}

	@Override
	public int getDeleteUserCount() {
		return mapper.getDeleteUserCount();
	}

	@Override
	public List<UserInfoDTO> getKakaoUser() {
		return mapper.getKakaoUser();
	}

	@Override
	public int kakaoUserCount() {
		return mapper.kakaoUserCount();
	}

	@Override
	public List<UserInfoDTO> getNaverUser() {
		return mapper.getNaverUser();
	}

	@Override
	public int naverUserCount() {
		return mapper.naverUserCount();
	}

	@Override
	public List<UserInfoDTO> searchUserList(String category, String input, int startRow, int endRow) {
		return mapper.searchUserList(category, input, startRow, endRow);
	}

	@Override
	public int searchCount(String category, String input) {
		return mapper.searchCount(category, input);
	}

	public int zoomClassDelete(Long num) {
		return mapper.zoomClassDelete(num);
	}

	@Override
	public List<ZoomDTO> zoomSearchList(int startRow, int endRow, String sort, String search) {
		return mapper.zoomSearchList(startRow, endRow, sort, search);
	}
	
	@Override
	public int zoomSearchCount(String sort, String search) {
		return mapper.zoomSearchCount(sort, search); 
	}

	@Override
	public int deleteQnA(int q_num) {
		return mapper.deleteQnA(q_num);
	}

	@Override
	public int pinUpdate(QnADTO dto) {
		return mapper.pinUpdate(dto);
	}

	@Override
	public int todayVisitorCount() {
		return mapper.todayVisitorCount();
	}

	@Override
	public int visitorCount() {
		return mapper.visitorCount();
	}

	@Override
	public int kakaoVisitorCount() {
		return mapper.kakaoVisitorCount();
	}

	@Override
	public int naverVisitorCount() {
		return mapper.naverVisitorCount();
	}

	@Override
	public int memberVisitorCount() {
		return mapper.memberVisitorCount();
	}

	@Override
	public int coachVisitorCount() {
		return mapper.coachVisitorCount();
	}

	@Override
	public int totalVisitorCount() {
		return mapper.totalVisitorCount();
	}

	@Override
	public List<VisitorDTO> searchVisitorList(String visitDate) {
		return mapper.searchVisitorList(visitDate);
	}

	@Override
	public List<NoticeDTO> noticeList() {
		return mapper.noticeList();
	}

	@Override
	public List<Notice_CDTO> getCommentList() {
		return mapper.getCommentList();
	}

	@Override
	public List<Notice_CDTO> searchCommentList(String category, String input) {
		return mapper.searchCommentList(category, input);
	}
  
}
