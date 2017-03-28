package model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class infoDao {
	@Autowired
	SqlSessionFactory factory;
	
	@Autowired
	MongoTemplate template;
	
	public List<HashMap> getInfo(Map map){
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList<>();
		try{
			
			list = session.selectList("member.info",map);
	
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	public int infoUpdate(Map map){
		SqlSession session = factory.openSession();
		int r=0;
		String favor ="";
		List list = (List)map.get("favor");
		
		for(int i=0;i<list.size();i++){
			favor+=(" "+list.get(i));
		}
		System.out.println(favor);
		map.put("favor", favor);
		
		try{
			/*r=session.update("info.update",map);*/
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			session.close();
		}
		return r;
	}
	
	public List<Map> bucketList(String id){
		List list = new ArrayList<>();
		SqlSession session = factory.openSession();
		Map map = new HashMap<>();
		map.put("id", id);
		try{
			list = session.selectList("info.bucket", map);
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			session.close();
		}
		list = addOnBucket(list);
		return list;
	}
	
	public List<Map> addOnBucket(List<Map> list){

		for(int i = 0; i<list.size(); i++){
			Map innerMap = list.get(i);
			String tel = (String) innerMap.get("TEL");
			Query query = new Query(Criteria.where("tel").is(tel));
			Map mongoMap = template.findOne(query, Map.class, "food");
			String title = (String) mongoMap.get("title");
			innerMap.put("title", title);
			List typeList = (List)mongoMap.get("type");
			String type = (String)typeList.get(0);
			innerMap.put("type", type);
			String img = (String)((List)mongoMap.get("img")).get(0);
			
			
			
//			double avg = Double.parseDouble(String.format("%.2f",Double.parseDouble((String) innerMap.get("AVG"))));
//			innerMap.put("AVG",avg);
			innerMap.put("img", img);
			String adress=(String) mongoMap.get("adress");
			innerMap.put("adress", adress);
			
			list.set(i, innerMap);
		}
		return list;
	}
	
	public List<Map> reviewList(String id){
		List list = new ArrayList<>();
		SqlSession session = factory.openSession();
		Map map = new HashMap<>();
		map.put("id", id);
		try{
			list = session.selectList("info.review", map);
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			session.close();
		}
		list = addOnReview(list);
		return list;
	}
	
	public List<Map> addOnReview(List<Map> list){

		for(int i = 0; i<list.size(); i++){
			Map innerMap = list.get(i);
			String tel = (String) innerMap.get("TEL");
			Query query = new Query(Criteria.where("tel").is(tel));
			Map mongoMap = template.findOne(query, Map.class, "food");
			String title = (String) mongoMap.get("title");
			innerMap.put("title", title);
			
			String weather = (String)innerMap.get("WEATHER");
			if(weather.equals("sunny")) weather = "해가 쨍~ 한날";
			else if(weather.equals("cloudy")) weather = "구름이 뭉게뭉게한 날";
			else if(weather.equals("rainy")) weather = "비가 주륵주륵 오는 날";
			else if(weather.equals("snowy")) weather = "눈이 펑펑오는 날";
			innerMap.put("WEATHER", weather);

			String type = (String)innerMap.get("TYPE");
			if(type.equals("single")) type = "혼자서";
			else if(type.equals("couple")) type = "연인과 함께";
			else if(type.equals("family")) type = "가족과 함께";
			else if(type.equals("together")) type = "회식으로";
			else if(type.equals("friend")) type = "친구와 함께";
			innerMap.put("TYPE", type);
			SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일");
			Date eat_date =  (Date)innerMap.get("EAT_DATE");
			String date = sdf.format(eat_date);
			innerMap.put("EAT_DATE", date);
			
			list.set(i, innerMap);
		}
		return list;
	}
}
