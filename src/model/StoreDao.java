package model;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class StoreDao {
	@Autowired
	MongoTemplate template;
	
	public List find() {
		List list = new ArrayList<>();
		Query query = new Query();
		Criteria criteria = new Criteria("gender");
		criteria.is("male");
		//조건 설정 ( {"gender":"male"})
		
		Criteria criteria2 = new Criteria("taste");
		criteria2.in("진보","보수");
		//조건 설정 ( {"taste":{"$in":["진보","보수"]}})
		
		query.addCriteria(criteria);
		query.addCriteria(criteria2);
		
		list = template.find(query, Map.class,"infos");
		//쿼리, 뽑아낼 형태, collection명
		//template.count 도 똑같은 형태
		
		return list;
	}

}
