package org.mvc.service;

import java.util.List;

import org.mvc.bean.YoutubeDTO;


public interface YoutubeService {
		
	// 동영상 입력
	public int insertVideo(YoutubeDTO dto);
	
	// 동영상 전체 리스트
	public List<YoutubeDTO> getVideoList(int firstRownum, int lastRownum);
	public List<YoutubeDTO> getManageVideoList(int firstRownum, int lastRownum);
	public List<YoutubeDTO> getSearchVideoList (String input, int firstRownum, int lastRownum);
	public List<YoutubeDTO> getManageSearchVideoList(String input, int firstRownum, int lastRownum);
	
	// 동영상 삭제
	public int deleteVod (int vnum);
	
	// 동영상 상태 변경
	public int changeStatusVod(int vnum, String status);
	
	// 동영상 총 갯수
	public int vodCount ();
	public int vodOnCount ();
	public int vodOffCount ();
	public int vodSearchCount (String input);
	public int vodOnSearchCount (String input);
}
