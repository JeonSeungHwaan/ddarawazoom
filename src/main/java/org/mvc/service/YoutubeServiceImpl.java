package org.mvc.service;

import java.util.List;

import org.mvc.bean.YoutubeDTO;
import org.mvc.mybatis.YoutubeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class YoutubeServiceImpl implements YoutubeService {
	
	@Setter(onMethod_=@Autowired)
	private YoutubeMapper mapper;
	
	//===== 동영상 입력 =====//
	@Override
	public int insertVideo(YoutubeDTO dto) {
		return mapper.insertVideo(dto);
	}

	//===== 동영상 리스트 =====// 
	@Override
	public List<YoutubeDTO> getVideoList(int firstRownum, int lastRownum) {
		return mapper.getVideoList(firstRownum, lastRownum);
	}

	@Override
	public List<YoutubeDTO> getManageVideoList(int firstRownum, int lastRownum) {
		return mapper.getManageVideoList(firstRownum, lastRownum);
	}
	
	@Override
	public List<YoutubeDTO> getSearchVideoList(String input, int firstRownum, int lastRownum) {
		return mapper.getSearchVideoList(input, firstRownum, lastRownum);
	}
	
	@Override
	public List<YoutubeDTO> getManageSearchVideoList(String input, int firstRownum, int lastRownum) {
		return mapper.getSearchVideoList(input, firstRownum, lastRownum);
	}

	//===== 동영상 삭제 =====//
	@Override
	public int deleteVod(int vnum) {
		return mapper.deleteVod(vnum);
	}

	@Override
	public int changeStatusVod(int vnum, String status) {
		return mapper.changeStatusVod(vnum, status);
	}
	
	//===== 동영상 갯수 관련 =====//
	@Override
	public int vodCount() {
		return mapper.vodCount();
	}
	
	@Override
	public int vodOnCount() {
		return mapper.vodOnCount();
	}
	
	@Override
	public int vodOffCount() {
		return mapper.vodOffCount();
	}

	@Override
	public int vodSearchCount(String input) {
		return mapper.vodSearchCount(input);
	}

	@Override
	public int vodOnSearchCount(String input) {
		return mapper.vodOnSearchCount(input);
	}

	

	
}
