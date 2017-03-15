package model;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginlogDao {
	@Autowired
	SqlSessionFactory factory;
	public int insertLoginlog(Map map) {
		SqlSession session = factory.openSession();
		int r = 0;
		try {
			r = session.insert("member.checklonginlog", map);
			session.commit();
		} catch (Exception e) {
			System.out.println("insertFBoard Err!!!");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return r;
	}

}
