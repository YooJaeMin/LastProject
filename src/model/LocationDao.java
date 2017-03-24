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
		String [] keyArr = keyword.split("\\s");
		Loof:
		for(String key : keyArr){
			key += "+맛집";
			String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + key
					+ "&key=AIzaSyBS-83LLE8F1nvtVtsy1Adu-j4LeS9qAQg&language=ko";
			URL url = null;
//			System.out.println(target);
			try{
				url = new URL(target);
			} catch(IOException e1 ){
				e1.printStackTrace();
				continue Loof;
			}
			

			BufferedReader br = null;
			try {
				br = new BufferedReader(new InputStreamReader(url.openStream()));
			} catch (IOException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
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
					JSONArray addressArray = (JSONArray) resultObject.get("address_components");
//					System.out.println(addressArray.toJSONString());
					for(int i =0; i<addressArray.size(); i++){
						if(((JSONObject)addressArray.get(i)).get("short_name").toString().equals("KR")){
							JSONObject geoMetryObject = (JSONObject) resultObject.get("geometry");
							JSONObject locationObject = (JSONObject) geoMetryObject.get("location");
							
							Double lng = (Double) locationObject.get("lng");
							Double lat = (Double) locationObject.get("lat");
							
							// location의 배열을 추출
							innerMap.put("lng", lng);
							innerMap.put("lat", lat);
//							System.out.println("google Location innerMap : "+innerMap.toString());
							break Loof;
						}
					}
					
					
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
//			System.out.println("google Location innerMap : "+innerMap.toString());

		}

		// 요청보내는 방법은 꽤 많다.
		// System.out.println(target);
		return innerMap;
	}
}
