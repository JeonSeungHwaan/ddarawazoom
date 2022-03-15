package org.mvc.service;

import java.util.List;

import org.mvc.bean.CoachInfoDTO;
import org.mvc.bean.NoticeDTO;
import org.mvc.bean.Notice_CDTO;
import org.mvc.bean.UserInfoDTO;
import org.mvc.mybatis.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Setter(onMethod_=@Autowired)
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeDTO> noticeList(int startRow, int endRow) {
		return mapper.noticeList(startRow, endRow);
	}

	@Override
	public int noticeCount() {
		return mapper.noticeCount();
	}

	@Override
	public int noticeWrite(NoticeDTO noticeDTO) {
		return mapper.noticeWrite(noticeDTO);
	}

	@Override
	public NoticeDTO getNotice(NoticeDTO noticeDTO) {
		return mapper.getNotice(noticeDTO);
	}
	
	@Override
	public int noticeUpdate(NoticeDTO noticeDTO) {
		return mapper.noticeUpdate(noticeDTO);
	}

	@Override
	public int noticeDelete(int num) {
		return mapper.noticeDelete(num);
	}

	@Override
	public int noticeViewCount(int num) {
		return mapper.noticeViewCount(num);
	}

	@Override
	public int commentWrite(Notice_CDTO notice_CDTO) {
		return mapper.commentWrite(notice_CDTO);
	}

	@Override
	public int commentCount(int num) {
		return mapper.commentCount(num);
	}

	@Override
	public List<Notice_CDTO> getCommentList(int num, int startRow, int endRow) {
		return mapper.getCommentList(num, startRow, endRow);
	}

	@Override
	public int deletedChange(int c_num) {
		return mapper.deletedChange(c_num);
	}
	
	@Override
	public int commentDeletedCancell(int c_num) {
		return mapper.commentDeletedCancell(c_num);
	}
	
	@Override
	public Notice_CDTO getComment(int c_num) {
		return mapper.getComment(c_num);
	}

	@Override
	public int commentUpdate(Notice_CDTO notice_CDTO) {
		return mapper.commentUpdate(notice_CDTO);
	}

	@Override
	public int insertReComment(Notice_CDTO notice_CDTO) {
		return mapper.insertReComment(notice_CDTO);
	}
	
	@Override
	public List<Notice_CDTO> getAllComment(int startRow, int endRow) {
		return mapper.getAllComment(startRow, endRow);
	}

	@Override
	public int getcommentCount() {
		return mapper.getcommentCount();
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
	public List<NoticeDTO> searchNoticeList(String category, String input, int startRow, int endRow) {
		return mapper.searchNoticeList(category, input, startRow, endRow);
	}

	@Override
	public int searchCount(String category, String input) {
		return mapper.searchCount(category, input);
	}
	
	@Override
	public List<Notice_CDTO> searchCommentList(String category, String input, int startRow, int endRow) {
		return mapper.searchCommentList(category, input, startRow, endRow);
	}

	@Override
	public int searchCommentCount(String category, String input) {
		return mapper.searchCommentCount(category, input);
	}

}
