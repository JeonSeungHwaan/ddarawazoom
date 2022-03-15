package org.mvc.service;

import java.util.List;


import org.mvc.bean.ReviewDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.bean.ZoomDTO;
import org.mvc.mybatis.ZoomMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ZoomServiceImpl implements ZoomService{ 

	@Setter(onMethod_=@Autowired)
	private ZoomMapper mapper;
	
	// 강의페이지 리스트
	@Override
	public List<ZoomDTO> zoomList(int startRow, int endRow) {
		return mapper.zoomList(startRow, endRow);
	}
	
	// 강의수
	@Override
	public int zoomCount() {
		return mapper.zoomCount();
	}
	
	// 강의등록
	@Override
	public int zoomInsert(ZoomDTO dto) {
		return mapper.zoomInsert(dto);
	}
	
	// 강의삭제
	@Override
	public int zoomDelete(int num) {
		return mapper.zoomDelete(num);
	}
	
	// 강의수정
	@Override
	public int zoomUpdate(ZoomDTO dto) {   
		return mapper.zoomUpdate(dto);
	}
	
	// 강의이미지수정
	@Override
	public int imgUpdate(ZoomDTO dto) {
		return mapper.imgUpdate(dto);
	}
	
	// 조회수
	@Override
	public int zoomReadcount(int num) {
		return mapper.zoomReadcount(num);  
	}

	// 강의상세페이지
	@Override
	public ZoomDTO zoomContent(int num) { 
		return mapper.zoomContent(num); 
	}
	
	// 검색페이지 리스트
	@Override
	public List<ZoomDTO> searchList(String category, String input, int startRow, int endRow) {
		return mapper.searchList(category, input, startRow, endRow);
	}

	// 검색된 게시물수
	@Override
	public int searchCount(String category, String input) {
		return mapper.searchCount(category, input); 
	}
	
	// 페이관련
	@Override
	public int getPrice(String merchant_Uid) {
		return mapper.getPrice(merchant_Uid);
	}
	
	// 강의상세페이지 후기리스트
	@Override
	public List<ReviewDTO> reviewList(int class_num, int startRow, int endRow) { 
		return mapper.reviewList(class_num, startRow, endRow);  
	}

	// 강의상세페이지 후기등록
	@Override
	public int reInsert(ReviewDTO dto) {
		return mapper.reInsert(dto);
	}

	// 후기수
	@Override
	public int reCount(int num) {
		return mapper.reCount(num);  
	}

	// 사용자정보
	@Override
	public UserInfoDTO getUserInfo(String id) {
		return mapper.getUserInfo(id); 
	}

	
}
