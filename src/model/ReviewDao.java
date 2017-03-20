package model;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewDao {
	@Autowired
	SqlSessionFactory factory;

	public boolean insertOne(Map map) {
		SqlSession session = factory.openSession();
		try{			
			int i = session.insert("review.insertDetails", map);
			if (i == 0) {
				int j = session.update("review.updateDetails", map);
				if (j == 0) {
					return false;
				} else {
					return true;
				}
			} else {
				return true;
			}
		} catch(Exception e){
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}

	}
}
