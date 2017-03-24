package model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParser;

@Service
public class NaverBlogDao {

	public Map getBlogData(String text) {
	        String clientId = "WTSpbzT1tpWir6Lw4yHO";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "LAZiJgoHVo";//애플리케이션 클라이언트 시크릿값";
	        JSONParser jsonParser = new JSONParser();
	        Map map = new HashMap();
	        try {
	            text = URLEncoder.encode(text, "UTF-8");
	            String display="&display="+50;
	            
	            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+display; // json 결과
	            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            JSONObject json = (JSONObject) jsonParser.parse(response.toString());
	            
//	            System.out.println(json.toJSONString());
	            
	            map.put("total", (long)json.get("display"));
	            map.put("itemList", (List) json.get("items"));
	            
	            
	        } catch (Exception e) {
	        	e.printStackTrace();
	
	        }
	        return map;
	    }
}
