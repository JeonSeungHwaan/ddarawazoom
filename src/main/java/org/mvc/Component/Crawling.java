package org.mvc.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.mvc.bean.YoutubeDTO;

import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.net.HttpURLConnection;

@Component 
public class Crawling {

	private static String API_KEY="AIzaSyCcOEnQ6vwsnUcrMAXm-5e0nF3H-kCti0c";
	private static URL url = null;
	private static HttpURLConnection conn = null;
	private static StringBuffer sb = null;
	
	@Autowired
	private YoutubeDTO youtubeDTO;
	
	public JSONObject getJson(String urlGet) throws IOException, ParseException {
		sb = new StringBuffer();
		// 1.url 연결 
		url = new URL(urlGet);	
		conn = (HttpURLConnection) url.openConnection();	// url 연결 생성		
		conn.setRequestMethod("GET");	// request 방식 설정, 속성 설정
		conn.setRequestProperty("Content-type", "application/json");			
		conn.setDoOutput(true);			// json을 출력 가능 형태로 번경		

		// 2. json 데이터 담기
		InputStreamReader is = new InputStreamReader(conn.getInputStream(), "UTF-8");
		BufferedReader br = new BufferedReader(is);			
		while(br.ready()) {
			sb.append(br.readLine());
		}
		
		JSONObject resultAll = (JSONObject) new JSONParser().parse(sb.toString());			
		
		// 3. 연결 끊기
		conn.disconnect();
		
		return resultAll;
	}
	
	
	public List<String> getVideioId(String qurey, String maxResults) throws IOException, ParseException {
		String encodeQurey = URLEncoder.encode(qurey, "UTF-8");
		String encodemaxResults = URLEncoder.encode(maxResults, "UTF-8");
		
		String urlBase = "https://www.googleapis.com/youtube/v3/search?part=snippet";
		String urlGet = urlBase+"&q="+encodeQurey+"&maxResults="+encodemaxResults+"&key="+API_KEY;		
		
		JSONObject resultAll = getJson(urlGet);
		
		// 4. Json 파싱 --> 비디오 id만 가져옴
		JSONArray itemsArray = (JSONArray) resultAll.get("items");		

		List<String> videoIdList = new ArrayList<String>();
		for (int i=0; i<itemsArray.size(); i++) {
			JSONObject itemsObject = (JSONObject)itemsArray.get(i);
			JSONObject id = (JSONObject)itemsObject.get("id");
			String videoId = (String)id.get("videoId");
			videoIdList.add(videoId);
		}
		
		return videoIdList;
	}
	
	
	public YoutubeDTO getVideioInfo (String videoId) throws IOException, ParseException {	
		String encodeVideoId = URLEncoder.encode(videoId, "UTF-8");
		String urlBase="https://www.googleapis.com/youtube/v3/videos?part=snippet,player";
		String urlGet = urlBase + "&id=" + encodeVideoId + "&key=" + API_KEY;
	
		JSONObject resultAll = getJson(urlGet);

		// 4. Json 파싱 --> {,}(Object) [,](Array) --> 필요한 데이터 추출
		JSONArray itemsArray = (JSONArray) resultAll.get("items");
		JSONObject itemsObject= (JSONObject)itemsArray.get(0);
		JSONObject snippet = (JSONObject)itemsObject.get("snippet");
		JSONObject player = (JSONObject)itemsObject.get("player");
		JSONObject thumbnails = (JSONObject)snippet.get("thumbnails");
		JSONObject thumbnails_default = (JSONObject)thumbnails.get("default");
		JSONArray tagsArray = (JSONArray)snippet.get("tags");

		String videoid = (String)itemsObject.get("id");
		String title = (String)snippet.get("title");		
		String channelTitle = (String)snippet.get("channelTitle");		
		String embedHtml = (String)player.get("embedHtml");
		String thumbnail_url = (String)thumbnails_default.get("url");
		ArrayList<String> tags = new ArrayList<String>();
		if (tagsArray.size() <= 3) {
			for(int i=0; i<tagsArray.size(); i++) {
				tags.add((String) tagsArray.get(i));
			}
		}
		if (tagsArray.size() > 3) {
			Random random = new Random();		
			Set<Integer> idx = new HashSet<>(); // idx 랜덤 3개 -> tag 랜덤 3개 선택
			while (idx.size() < 3) { 
				int num = random.nextInt(tagsArray.size()); 
				idx.add(num); 
			}			
			Iterator<Integer> iterSet = idx.iterator();
			while(iterSet.hasNext()) {
				tags.add((String) tagsArray.get(iterSet.next()));
			}	
		}
			
		// 5. dto 세팅
		youtubeDTO.setVideoid(videoid);
		youtubeDTO.setTitle(title);
		youtubeDTO.setChanneltitle(channelTitle);
		youtubeDTO.setEmbedhtml(embedHtml);
		youtubeDTO.setThumbnail_url(thumbnail_url);
		youtubeDTO.setTag1(tags.get(0));
		youtubeDTO.setTag2(tags.get(1));
		youtubeDTO.setTag3(tags.get(2));
		
		return youtubeDTO;
	}
	
}
