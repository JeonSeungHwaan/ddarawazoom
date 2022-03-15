package org.mvc.service;

import java.util.List;

import org.mvc.bean.ReviewDTO;

public interface ReviewService {

	// 리뷰 가져오기
	public List<ReviewDTO> reviewList(int startRow, int endRow);
	
	// 리뷰 수
	public int reviewCount();
	
	// 관리자 리뷰 경고
	public int managerReviewChange(int review_num);
		
	// 관리자 리뷰 경고 취소
	public int managerChangeCancell(int review_num);
	
	// 관리자 리뷰 삭제
	public int managerReviewDelete(int review_num);
}
