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
public class RecommendDao {
	@Autowired
	SqlSessionFactory factory;
	
	@Autowired
	MongoTemplate template;	
	public List<HashMap> getRecommendInfo(Map map){
		List<HashMap> list  = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			System.out.println("dao"+map);
			list = session.selectList("recommend.infoGet",map);
			System.out.println("getRecommendInfo결과"+list);
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
