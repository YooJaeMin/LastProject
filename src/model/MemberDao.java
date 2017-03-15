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
public class MemberDao {
	@Autowired
	SqlSessionFactory factory;

	public int addMember(Map map) {
		SqlSession session = factory.openSession();
		int r = 0;
		try {
			r = session.insert("member.createOne", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return r;
	}
	
	public boolean checkMember(Map map) {
		boolean flag = false;
		SqlSession session = factory.openSession();
		try {
			// select mapper의 resultType은 데이터 한줄을 바꿀 객체 
			// select 를 사용할때 한줄이 나오면 selectOne ==> resultType
			//                    여러줄이 나오면 selectList ==> List<resultType> 
			int r = session.selectOne("member.checkCountOne", map);
			if(r==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return flag;
	}
	public List<HashMap> readinfo(Map map){
		List<HashMap> list = new ArrayList<>();
		SqlSession session = factory.openSession();
		try{
			list = session.selectList("member.infolist",map);
			System.out.println("reainfo"+list);
		}catch (Exception e){
			System.out.println("info.error");
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
}
