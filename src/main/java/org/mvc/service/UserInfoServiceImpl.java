package org.mvc.service;

import java.util.List;

import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.QnADTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.mybatis.UserInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
  
public class UserInfoServiceImpl implements UserInfoService{
	
	@Setter(onMethod_=@Autowired) //mapper를 끌어다 놨다.
	private UserInfoMapper mapper;
	
	@Override
	public int insertUserInfo(UserInfoDTO dto) {
		return mapper.insertUserInfo(dto);
	}

	@Override
	public int getUserInfoCount(UserInfoDTO dto) {
		return mapper.getUserInfoCount(dto);
	}

	@Override
	public int kakaoInsert(UserInfoDTO dto) {
		return mapper.kakaoInsert(dto);
	}

	@Override
	public int kakaoCheck(UserInfoDTO dto) {
		return mapper.kakaoCheck(dto);
	}

	@Override
	public int naverInsert(UserInfoDTO dto) {
		return mapper.naverInsert(dto);
	}

	@Override
	public int naverCheck(UserInfoDTO dto) {
		return mapper.naverCheck(dto);
	}

	@Override
	public int coachCheck(CoachInfoDTO coachDTO) {
		return mapper.coachCheck(coachDTO);
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public String findId(UserInfoDTO dto) {
		return mapper.findId(dto);
	}

	@Override
	public int emailCheck(UserInfoDTO dto) {
		return mapper.emailCheck(dto);
	}

	@Override
	public int updatePw(UserInfoDTO dto) {
		return mapper.updatePw(dto);
	}

	@Override
	public int c_idCheck(String c_id) {
		return mapper.c_idCheck(c_id);
	}

	@Override
	public int coachInsert(CoachInfoDTO coachDTO) {
		return mapper.coachInsert(coachDTO);
	}

	@Override
	public int careerInsert(CoachCareerDTO careerDTO) {
		if(careerDTO.getCertificate() != null) {
			mapper.insertCertificate(careerDTO);
		}
		return mapper.careerInsert(careerDTO);
	}

	@Override
	public int coachImgUpload(CoachInfoDTO dto) {
		return mapper.coachImgUpload(dto);
	}

	@Override
	public int nickCheck(String nick) {
		return mapper.nickCheck(nick);
	}

	@Override
	public int c_nickCheck(String c_nick) {
		return mapper.c_nickCheck(c_nick);
	}

	@Override
	public List<CoachInfoDTO> getAllCoach() {
		return mapper.getAllCoach();
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
	public int loginCount(String id) {
		return mapper.loginCount(id);
	}

	@Override
	public int coachLoginCount(String id) {
		return mapper.coachLoginCount(id);
	}

	@Override
	public List<QnADTO> getQnAList(int startRow, int endRow) {
		return mapper.getQnAList(startRow, endRow);
	}

	@Override
	public int getQnACount() {
		return mapper.getQnACount();
	}

	@Override
	public UserInfoDTO getUserInfo(String id) {
		return mapper.getUserInfo(id);
	}

	@Override
	public CoachInfoDTO getCoachInfo(String c_id) {
		return mapper.getCoachInfo(c_id);
	}

	@Override
	public int getMaxNumber() {
		return mapper.getMaxNumber();
	}

	@Override
	public List<QnADTO> getContent(int q_num) {
		return mapper.getContent(q_num);
	}

	@Override
	public int insertQnA(QnADTO dto) {
		return mapper.insertQnA(dto);
	}

	@Override
	public void readcountUp(int q_num) {
		mapper.readcountUp(q_num);
	}

	@Override
	public int answerDone(int q_num) {
		return mapper.answerDone(q_num);
	}

	@Override
	public List<QnADTO> getQnASearchList(String category, String input, int startRow, int endRow) {
		return mapper.getQnASearchList(category, input, startRow, endRow);
	}

	@Override
	public int getQnASearchCount(String category, String input) {
		return mapper.getQnASearchCount(category, input);
	}
	
}
