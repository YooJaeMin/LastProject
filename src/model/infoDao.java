package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class infoDao {
	@Autowired
	SqlSessionFactory factory;
	
	public List<HashMap> getInfo(Map map){
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList<>();
		try{
			System.out.println("infoDao 넘어온 값: "+ map);
			list = session.selectList("member.info",map);
			System.out.println("infoDao 결과값 : "+ list);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
}
