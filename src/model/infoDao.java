package model;

import java.util.ArrayList;
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
	
		List list = (List)map.get("favor");
		map.put("favor", list.toString());
		
		try{
			r=session.update("info.update",map);
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
			list.set(i, innerMap);
		}
		return list;
	}
}
