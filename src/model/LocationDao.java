package model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

@Service
public class LocationDao {
	public Map googleLocation(String keyword){
		Map innerMap = new HashMap();
		keyword = keyword.replaceAll(" ", "+");
		String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + keyword
				+ "&key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&language=ko";
		// 요청보내는 방법은 꽤 많다.
		// System.out.println(target);
		URL url = null;
		System.out.println(target);
		try{
			url = new URL(target);
		} catch(IOException e1 ){
			e1.printStackTrace();
			innerMap.put("lng", 0);
			innerMap.put("lat", 0);
		}
		

		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(url.openStream()));
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
			innerMap.put("lng", 0);
			innerMap.put("lat", 0);			
		}
		String outstr = "";
		while (true) {
			String str = null;
			try {
				str = br.readLine();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				innerMap.put("lng", 0);
				innerMap.put("lat", 0);
			}
			if (str == null)
				break;
			// out.println(str);
			outstr += str;
		}

		try {

			JSONParser jsonParser = new JSONParser();

			// JSON데이터를 넣어 JSON Object 로 만들어 준다.
			JSONObject jsonObject = (JSONObject) jsonParser.parse(outstr);
			JSONArray resultArray = (JSONArray) jsonObject.get("results");
			if (resultArray.size() != 0) {
				JSONObject resultObject = (JSONObject) jsonParser
						.parse(resultArray.get(0).toString());
				// System.out.println(resultObject.toString());
				JSONObject geoMetryObject = (JSONObject) resultObject.get("geometry");
				// System.out.println(geoMetryObject.toString());
				JSONObject locationObject = (JSONObject) geoMetryObject.get("location");
				// System.out.println(locationObject.toString());
				// System.out.println("lat ==
				// "+latObject.toString());
				Double lng = (Double) locationObject.get("lng");
				Double lat = (Double) locationObject.get("lat");
				// System.out.println("lng ==
				// "+lngObject.toString());
				// location의 배열을 추출
				innerMap.put("lng", lng);
				innerMap.put("lat", lat);
			} else {
				innerMap.put("lng", 0);
				innerMap.put("lat", 0);
			}

		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			innerMap.put("lng", 0);
			innerMap.put("lat", 0);
		}
		System.out.println("google Location innerMap : "+innerMap.toString());
		return innerMap;
	}
}
