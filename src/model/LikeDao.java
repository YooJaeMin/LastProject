package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

@Service
public class LikeDao {
	@Autowired
	SqlSessionFactory factory;
	
	public String allLike(Map map){
		SqlSession session = factory.openSession();
		int r = 0;
		String result="false";
		try{
			System.out.println(map);
			map.put("good", 1);
			System.out.println(map);
			r = session.insert("like.insert",map);
			session.commit();
			
			if(r==1){
				result="like";
			}
		}catch (Exception e) {
			e.printStackTrace();
			try{
				r = session.delete("like.delete",map);
				session.commit();
				if(r==1){
					result="delete";
				}
			} catch(Exception e2){
				e.printStackTrace();
				return result;
			}

			return result;
		}finally{
			session.close();
		}
		return result;	
		
	}
	public List<HashMap> getliekN(Map map){
		List<HashMap> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			/*list = session.selectList("")*/
		}catch (Exception e){
			
		}finally{
			session.close();
		}
		return null;
		
	}
	
	
}
