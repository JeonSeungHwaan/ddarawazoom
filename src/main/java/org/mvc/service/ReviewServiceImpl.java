package org.mvc.service;

import java.util.List;

import org.mvc.bean.ReviewDTO;
import org.mvc.mybatis.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Setter(onMethod_=@Autowired)
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewDTO> reviewList(int startRow, int endRow) {
		return mapper.reviewList(startRow, endRow);
	}

	@Override
	public int reviewCount() {
		return mapper.reviewCount();
	}

	@Override
	public int managerReviewChange(int review_num) {
		return mapper.managerReviewChange(review_num);
	}

	@Override
	public int managerChangeCancell(int review_num) {
		return mapper.managerChangeCancell(review_num);
	}

	@Override
	public int managerReviewDelete(int review_num) {
		return mapper.managerReviewDelete(review_num);
	}

}
