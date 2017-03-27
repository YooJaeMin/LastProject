package model;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.apache.commons.collections.Factory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class WeatherInformer {
	@Autowired
	SqlSessionFactory factory;
	
	@Autowired
	MongoTemplate template;
	
	public Map service() {
		Map rst = new HashMap<>();
		try {
			URL url = new URL("http://apis.skplanetx.com/weather/current/hourly?lon=127.1125567&village=&county=&lat=37.493293&city=&version=1");
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
					con.setRequestProperty("appkey", "5a1ef36f-c029-334b-a907-005880c2f5f3");
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
					String code =(String)sky.get("code");
				Map temperature =(Map)((Map)li.get(0)).get("temperature");
					String tc =(String)temperature.get("tc");
				rst.put("code", code);
				rst.put("status", name);	
				rst.put("temp", tc);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rst;
	}
	
	public List<HashMap> getWeather(Map weather){
		List<HashMap> list  = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			System.out.println("dao"+weather);
			list = session.selectList("weather.infoGet",weather);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public List getTel(List<HashMap> list) {
		
		for(int i =0; i<list.size(); i++){
			HashMap map = list.get(i);
			Query query = new Query(Criteria.where("tel").is((String)map.get("TEL")));
			Map innerMap = template.findOne(query, Map.class, "food");
			map.put("title", (String)innerMap.get("title"));
			list.set(i,map);
			
		}

		
		return list;
	}
	
}
