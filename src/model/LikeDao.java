package model;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

@Service
public class LikeDao {
	@Autowired
	MongoTemplate template;
	
	public void allLike(Map map){
		template.insert(map, "storeRank");
	}
}
