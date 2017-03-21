package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FreeBoardDao {
	@Autowired
	SqlSessionFactory factory;
	
	public int cntAll() {
		SqlSession session = factory.openSession();
		int cnt = 0;
		try {
			cnt = session.selectOne("freeboard.cntAll");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return cnt;
	}
	
	public List<HashMap> getSome(Map map) {
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList<>();
		try {
			list = session.selectList("freeboard.listSome",map);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			session.close(); 
		}
		return list;
	}

	public int addNew(Map map) {
		SqlSession session = factory.openSession();
		int rst = 0; 
		try {
			System.out.println("addNew="+map);
			rst=session.insert("freeboard.addNew",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return rst;
	}

	@SuppressWarnings("rawtypes")
	public List<HashMap> listAll(Map map) {
		SqlSession session = factory.openSession();
		List<HashMap> list = new ArrayList<>();
		try {
			list = session.selectList("freeboard.listAll",map);
			session.commit();	
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	public HashMap getOneInDetail(Map map) {
		SqlSession session = factory.openSession();
		HashMap one = null;
		try {
			one = (HashMap)session.selectOne("freeboard.getOneInDetail",(int)map.get("num"));
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
		}
		return one;
	}
}
