package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.YoutubeDTO;

public interface YoutubeMapper {
	
	// 동영상 입력
	public int insertVideo(YoutubeDTO dto);
	
	// 동영상 전체 리스트 가져오기
	public List<YoutubeDTO> getVideoList(@Param("firstRownum")int firstRownum, @Param("lastRownum")int lastRownum);
	public List<YoutubeDTO> getManageVideoList(@Param("firstRownum")int firstRownum, @Param("lastRownum")int lastRownum);
	public List<YoutubeDTO> getSearchVideoList(@Param("input")String input, @Param("firstRownum")int firstRownum, @Param("lastRownum")int lastRownum);
	public List<YoutubeDTO> getManageSearchVideoList(@Param("input")String input, @Param("firstRownum")int firstRownum, @Param("lastRownum")int lastRownum);
	
	// 동영상 삭제
	public int deleteVod(int vnum);
	
	// 동영상 상태 변경
	public int changeStatusVod(@Param("vnum")int vnum, @Param("status")String status);
	
	// 동영상 총 갯수
	public int vodCount();
	public int vodOnCount();
	public int vodOffCount();
	public int vodSearchCount (@Param("input")String input);
	public int vodOnSearchCount (@Param("input")String input);
}
