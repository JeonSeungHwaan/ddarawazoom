package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.CoachCareerDTO;
import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;
import org.mvc.bean.QnADTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.VisitorDTO;
import org.mvc.bean.ZoomDTO;

public interface ManagerMapper {

	// 등록된 모든 코치 정보
	public List<CoachInfoDTO> getAllCoachInfo();
	
	// 등록된 모든 코치의 수
	public int countAllCoach();
	
	// 코치 한 명의 정보
	public CoachInfoDTO coachInfo(String c_id);
	
	// 코치 한 명의 경력정보
	public List<CoachCareerDTO> coachCareer(String c_id);
	
	// 코치가 등록한 강의 정보
	public List<ZoomDTO> getCoachClass(String c_id);
	
	// 코치 강의 삭제
	public int deleteClass(int num);
	
	// 코치 강의 복구
	public int restoreClass(int num);
	
	// 코치 상태 변경
	public int changeStatus(CoachInfoDTO dto);
	
	// 전체 멤버 수
	public int countAllUser();
	
	// 멤버 한 명의 정보
	public UserInfoDTO userInfo(String id);
	
	// 멤버 비밀번호 변경
	public int updateUserPw(UserInfoDTO userDTO);
	
	// 멤버 탈퇴
	public int userDelete(String id);
	
	// 일반 가입 멤버 리스트
	public List<UserInfoDTO> getUserInfo();
	
	// 일반 가입 멤버 수
	public int userCount();
	
	// 오늘의 신규 가입자 리스트
	public List<UserInfoDTO> newUser();
	
	// 신규 가입자 수
	public int newUserCount();
	
	// 탈퇴 멤버 
	public List<UserInfoDTO> getDeleteUser();
	
	// 탈퇴 멤버 수
	public int getDeleteUserCount();
	
	// 카카오톡 가입 멤버 리스트
	public List<UserInfoDTO> getKakaoUser();
	
	// 카카오톡 가입 멤버 수
	public int kakaoUserCount();
	
	// 네이버 가입 멤버 리스트
	public List<UserInfoDTO> getNaverUser();
	
	// 네이버 가입 멤버 수
	public int naverUserCount();
	
	// 멤버 검색 리스트
	public List<UserInfoDTO> searchUserList(
			@Param("category") String category,
			@Param("input") String input,
			@Param("startRow") int startRow,
			@Param("endRow") int endRow);
	
	// 검색 결과 수
	public int searchCount(
			@Param("category") String category,
			@Param("input") String input);

	// 관리자페이지 강의삭제
	public int zoomClassDelete(Long num);
	
	// 관리자페이지 검색된 게시물리스트
	public List<ZoomDTO> zoomSearchList(@Param("startRow") int startRow, @Param("endRow")int endRow, @Param("sort")String sort, @Param("search")String search);
	
	// 관리자페이지 검색된 게시물수
	public int zoomSearchCount(@Param("sort")String sort, @Param("search")String search);
	 
	// Q&A 질문 삭제
	public int deleteQnA(int q_num);
	
	// Q&A 상단 고정 여부
	public int pinUpdate(QnADTO dto);
	
	// 오늘의 방문자 수
	public int todayVisitorCount();
	
	// 일반 방문자 수
	public int visitorCount();
	
	// 카카오톡 방문자 수
	public int kakaoVisitorCount();
	
	// 네이버 방문자 수
	public int naverVisitorCount();
	
	// 멤버 방문 수
	public int memberVisitorCount();
	
	// 코치 방문 수
	public int coachVisitorCount();
	
	// 총 누적 방문 수
	public int totalVisitorCount();
	
	// 날짜로 로그인한 멤버 리스트
	public List<VisitorDTO> searchVisitorList(String visitDate);

	// 모든 공지글
	public List<NoticeDTO> noticeList();
	
	// 공지의 모든 댓글
	public List<Notice_CDTO> getCommentList();
	
	// 댓글 검색
	public List<Notice_CDTO> searchCommentList(@Param("category") String category, @Param("input") String input);
	
}
