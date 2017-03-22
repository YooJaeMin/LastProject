package model;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import com.fasterxml.jackson.databind.ObjectMapper;

public class WeatherInformer {
	public Map service() {
		Map rst = new HashMap<>();
		try {
			URL url = new URL("http://apis.skplanetx.com/weather/current/hourly?lon=127.1125567&village=&county=&lat=37.493293&city=&version=1");
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
					con.setRequestProperty("appkey", "adfcc889-90df-3246-ab84-cd0af620e065");
				Scanner cin = new Scanner(con.getInputStream());
				StringBuilder sb = new StringBuilder();
				while(cin.hasNextLine()) {
					sb.append(cin.nextLine());
				}
				// System.out.println(sb.toString());
				Map map =new ObjectMapper().readValue(sb.toString(), Map.class); 
				List li = (List)(((Map)map.get("weather")).get("hourly"));
				Map sky =(Map)((Map)li.get(0)).get("sky");
					String name =(String)sky.get("name");
				Map temperature =(Map)((Map)li.get(0)).get("temperature");
					String tc =(String)temperature.get("tc");
				rst.put("status", name);	
				rst.put("temp", tc);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rst;
	}
	public static void main(String[] args) {
		Map map = new WeatherInformer().service();
		String s = (String)map.get("status");
		String t = (String)map.get("temp");
		System.out.println(s+"/"+t);
	}
}
