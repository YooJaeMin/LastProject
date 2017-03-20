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

	public int naverMamber(Map map) {
		SqlSession session = factory.openSession();
		int r = 0;
		try {
			r = session.insert("member.naverDetail", map);
			System.out.println("네이버멤버 가입 결과값 : "+r);
			session.commit();
		} catch (Exception e) {
//			e.printStackTrace();
			return r;
		} finally {
			session.close();
		}
		return r;
	}
	
	
	public String Mamber(Map map) {
		SqlSession session = factory.openSession();
		int r = 0;
		int r2 = 0;
		System.out.println(map.get("id"));
		System.out.println(map.get("pw"));
		map.put("profile", "/views/picture/default.jpg");
		try {
			r2 = session.insert("member.normalDetail",map);
			if(r2==1){
				r = session.insert("member.normalCreate", map);
			}
			System.out.println("일반멤버 가입  결과값 : "+r+"/"+r2);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		} finally {
			session.close();
		}
		if(r==1&&r2==1){
			return "succed";
		}else{
			return "fail";
		}
		
	}
	
	
	public boolean checkMember(Map map) {
		boolean flag = false;
		SqlSession session = factory.openSession();
		try {
			int r = session.selectOne("member.memberCountOne", map);
			if(r==1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			return flag;
		} finally {
			session.close();
		}
		return flag;
	}
	
	public boolean naverCheckMember(Map map) {
		boolean flag = false;
		SqlSession session = factory.openSession();
		try {
			int r = session.selectOne("member.naverCountOne", map);
			if(r==1)
				flag = true;
			else{
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return flag;
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
