package model;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class SearchDao {
	@Autowired
	MongoTemplate template;
	@Autowired
	LocationCalculator lc;
	
	public List doSearch(Map map){
		List list = new ArrayList();
		list = template.findAll(Map.class,"food");
		List newList = new ArrayList();
		newList = lc.calDistance((double)map.get("lat"), (double)map.get("lng"), list);
		return newList;
	}
	
	public List realTimeRank(){
		List list = new ArrayList();
		Criteria criteria = Criteria.where("date").gte(System.currentTimeMillis()-3*60*60*1000);
		
		AggregationOperation ao1 = Aggregation.match(criteria);
		AggregationOperation ao2 = Aggregation.group("keyword").count().as("cnt");
		AggregationOperation ao3 = Aggregation.sort(Direction.DESC, "cnt");
		AggregationOperation ao4 = Aggregation.limit(10);

		
		Aggregation aggr = Aggregation.newAggregation(ao1,ao2,ao3,ao4);
		
		AggregationResults<Map> result = template.aggregate(aggr,"searchKey",Map.class );
		list = result.getMappedResults();
		
		return list;
	}
	
	public List todayRank(){
		List list = new ArrayList();

		Date date = new Date();
		Date date2 = new Date(date.getYear(),date.getMonth(),date.getDate());
		
		Criteria criteria = Criteria.where("date").gte(date2.getTime());
		
		AggregationOperation ao1 = Aggregation.match(criteria);
		AggregationOperation ao2 = Aggregation.group("keyword").count().as("cnt");
		AggregationOperation ao3 = Aggregation.sort(Direction.DESC, "cnt");
		AggregationOperation ao4 = Aggregation.limit(10);

		
		Aggregation aggr = Aggregation.newAggregation(ao1,ao2,ao3,ao4);
		
		AggregationResults<Map> result = template.aggregate(aggr,"storeRank",Map.class );
		list = result.getMappedResults();
		
		return list;
	}
	
	public void insertSearch(String keyword){
		Map map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("date", System.currentTimeMillis());
		template.insert(map, "searchKey");
	}
	
	public void insertLike(String keyword){
		Map map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("date", System.currentTimeMillis());
		template.insert(map, "storeRank");
	}
	
}
