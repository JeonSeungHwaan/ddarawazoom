package org.mvc.service;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mvc.bean.ReviewDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;

public interface ZoomService {
	
	// 강의페이지 리스트
	public List<ZoomDTO> zoomList(@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	// 강의수
	public int zoomCount();
	
	// 강의등록
	public int zoomInsert(ZoomDTO dto);
	
	// 강의삭제
	public int zoomDelete(int num); 
	
	// 강의수정
	public int zoomUpdate(ZoomDTO dto);
	
	// 강의이미지수정
	public int imgUpdate(ZoomDTO dto); 
	
	// 조회수
	public int zoomReadcount(int num);
	
	// 강의상세페이지 
	public ZoomDTO zoomContent(int num);
	
	// 검색페이지 리스트
	public List<ZoomDTO> searchList(@Param("category") String category, @Param("input") String input, 
			@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	// 검색된 게시물수
	public int searchCount(@Param("category") String category, @Param("input") String input);  
	
	// 페이관련
	public int getPrice(String merchant_Uid); 

	// 강의상세페이지 후기리스트
	public List<ReviewDTO> reviewList(@Param("class_num") int class_num, @Param("startRow") int startRow, @Param("endRow")int endRow); 
	
	// 강의상세페이지 후기등록
	public int reInsert(ReviewDTO dto);
	
	// 후기수
	public int reCount(int num);
	
	// 사용자정보
	public UserInfoDTO getUserInfo(String id);  
		
} 