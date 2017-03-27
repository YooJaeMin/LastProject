package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.*;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.SearchDao;
import model.TestDao;

@Controller
public class RootController {
	@Autowired
	SearchDao sd;

	@Autowired
	TestDao td;

	@RequestMapping({ "/", "/index" })
	public ModelAndView indexHandle() {
		ModelAndView mav = new ModelAndView("t_main");
		List list1 = sd.realTimeRank();
		mav.addObject("realRank", list1);
		List list2 = sd.todayRank();
		mav.addObject("todayRank", list2);
		// - SKY_A01: 맑음			sunny-
		// - SKY_A02: 구름조금		cloudy
		// - SKY_A03: 구름많음		cloudy
		// - SKY_A04: 구름많고 비	rainy-	
		// - SKY_A05: 구름많고 눈	snowy-
		// - SKY_A06: 구름많고 비 또는 눈	snowy-
		// - SKY_A07: 흐림			cloudy
		// - SKY_A08: 흐리고 비		rainy-
		// - SKY_A09: 흐리고 눈		cloudy
		// - SKY_A10: 흐리고 비 또는 눈		rainy-
		// - SKY_A11: 흐리고 낙뢰	rainy-
		// - SKY_A12: 뇌우, 비		rainy-
		// - SKY_A13: 뇌우, 눈		snowy-
		// - SKY_A14: 뇌우, 비 또는 눈	snowy-
		
		
		return mav;
	}

	@RequestMapping("/test/insert/member")
	public ModelAndView test() throws IOException {
		ModelAndView mav = new ModelAndView("/");
		File f = new File("D:\\JM\\wordlist.txt");
		InputStreamReader isr = new InputStreamReader(new FileInputStream(f));
		BufferedReader br = new BufferedReader(isr);
		String pw = "123";
		Map map = new HashMap();
		map.put("pw", pw);
		map.put("profile", "/views/memberImg/dafault.png");
		String[] genders = { "F", "M" };
		String[] marrys = { "미혼", "기혼", "커플", "싱글" };

		for (int i = 0; i < 10000; i++) {
			int y = 40 + (int) (Math.random() * 78);
			int m = (int) (Math.random() * 11);
			int dd = 0;
			if (m == 1) {
				dd = 1 + (int) (Math.random() * 28);
			} else if (m == 0 || m == 2 || m == 4 || m == 6 || m == 7 || m == 9 || m == 11) {
				dd = 1 + (int) (Math.random() * 31);
			} else {
				dd = 1 + (int) (Math.random() * 30);
			}
			String id = br.readLine();
			map.put("nick", id);
			id += "@spoon.com";
			map.put("id", id);
			map.put("marry", marrys[(int) (Math.random() * 4)]);
			Date d = new Date(y, m, dd);
			map.put("birth", d);
			map.put("gender", genders[(int) (Math.random() * 2)]);
			td.insertOne(map);

		}
		return mav;
	}

	@RequestMapping("/member/create/review")
	public ModelAndView testReview() throws IOException {
		ModelAndView mav = new ModelAndView("/");
		Map map = new HashMap();
		List<Map> tel = td.getTel();
		List<Map> id = td.getId();
		String[] weathers = { "sunny", "snowy", "cloudy", "rainy" };
		String[] types = { "single", "together", "couple", "family", "friend" };

		for (int i = 0; i < 100000; i++) {
			int y = 113 + (int) (Math.random() * 4);
			int m = (int) (Math.random() * 11);
			int dd = 0;
			if (m == 1) {
				dd = 1 + (int) (Math.random() * 28);
			} else if (m == 0 || m == 2 || m == 4 || m == 6 || m == 7 || m == 9 || m == 11) {
				dd = 1 + (int) (Math.random() * 31);
			} else {
				dd = 1 + (int) (Math.random() * 30);
			}
			Map innerMap = tel.get((int) (Math.random() * 8581));
			String telNum = (String) innerMap.get("tel");
			String idid = (String) id.get((int) (Math.random() * 10000)).get("ID");
			map.put("id", idid);
			Date d = new Date(y, m, dd);

			map.put("eat_date", d);
			map.put("tel", telNum);
			map.put("hit", (int) (Math.random() * 100));

			int clean_s = 1 + (int) (Math.random() * 5);
			int taste_s = 1 + (int) (Math.random() * 5);
			int price_s = 1 + (int) (Math.random() * 5);
			int good_s = 1 + (int) (Math.random() * 5);
			int location_s = 1 + (int) (Math.random() * 5);
			double avg_s = (clean_s + taste_s + price_s + good_s + location_s) / 5.0;
			String type = types[(int) (Math.random() * 5)];
			String weather = weathers[(int) (Math.random() * 4)];
			if (m != 0 && m != 1 && m != 10 && m != 11) {
				while (weather.equals("snowy")) {
					weather = weathers[(int) (Math.random() * 4)];
				}
			}
			map.put("clean_s", clean_s);
			map.put("taste_s", taste_s);
			map.put("price_s", price_s);
			map.put("good_s", good_s);
			map.put("location_s", location_s);
			map.put("avg_s", avg_s);
			map.put("weather", weather);
			map.put("type", type);
			String content = weather.equals("sunny") ? "날씨 좋은 날 "
					: weather.equals("cloudy") ? "구름낀 날" : weather.equals("rainy") ? "비오는 날" : "눈오는 날";
			// String[] types =
			// {"single","together","couple","family","friend"};
			content += type.equals("single") ? "혼자서 "
					: type.equals("together") ? "회식으로 "
							: type.equals("couple") ? "데이트 하면서 " : type.equals("family") ? "가족들이랑 " : "친구들이랑 ";
			List list = (List) innerMap.get("item");
			String item = "";
			try {
				item = (String) list.get((int) (Math.random() * list.size()));
			} catch (Exception e) {
				item = "단무지";
			}

			content += item + "을 먹었는데 ";
			if (avg_s < 2) {
				content += "정말 별로 였다.";
			} else if (avg_s < 3) {
				content += "그저 그랬다.";
			} else if (avg_s < 4) {
				content += "먹을만 했다.";
			} else {
				content += "정말 맛있었다. 강추!!";
			}
			map.put("content", content);

			td.insertReview(map);
		}

		return mav;
	}

	@RequestMapping("/modi/loc")
	public ModelAndView locModi() {
		ModelAndView mav = new ModelAndView();
		JSONParser jsonParser = new JSONParser();

		List<Map> list = td.modifyLoc();
		List<Map> tempList = new ArrayList();
		elementLoof: for (Map map : list) {
			try {
				
				String[] adressArr = ((String) map.get("adress")).split("\\s");
				String adress = "";
				int ch = 0;
				for (String chip : adressArr) {
					if (ch >= 4)
						break;
					adress += chip+"+";
					ch++;
				}
				String target = "https://maps.googleapis.com/maps/api/geocode/json?address=" + adress
						+ "&key=AIzaSyC4Ao4DNSHj_KEDrTLzVUsyGxoemaZJeRA&language=ko";
				// 요청보내는 방법은 꽤 많다.
				// System.out.println(target);
				URL url = null;
				try {
					url = new URL(target);
				} catch (IOException e1) {
					e1.printStackTrace();
					continue elementLoof;
				}

				BufferedReader br = null;
				try {
					br = new BufferedReader(new InputStreamReader(url.openStream()));
				} catch (IOException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
					continue elementLoof;

				}
				String outstr = "";
				while (true) {
					String str = null;
					try {
						str = br.readLine();
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
						continue elementLoof;
					}
					if (str == null)
						break;
					// out.println(str);
					outstr += str;
				}

				try {

					// JSON데이터를 넣어 JSON Object 로 만들어 준다.
					JSONObject jsonObject = (JSONObject) jsonParser.parse(outstr);
					JSONArray resultArray = (JSONArray) jsonObject.get("results");
					if (resultArray.size() != 0) {
						JSONObject resultObject = (JSONObject) jsonParser.parse(resultArray.get(0).toString());
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
						map.put("lng", lng);
						map.put("lat", lat);
					}
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					try {
						JSONObject jsonObject = (JSONObject) jsonParser.parse(outstr);
						String ss = (String) jsonObject.get("status");
						if (ss.equals("OVER_QUERY_LIMIT")) {
							break elementLoof;
						}
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						continue elementLoof;
					}
					continue elementLoof;
				}
				// System.out.println(innerMap.toString());
				tempList.add(map);
			} catch (Exception e) {
				e.printStackTrace();
				continue;
			}


		}
		td.modifyFinal(list);
		return mav;
	}
}