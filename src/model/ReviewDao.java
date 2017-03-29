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

	public boolean insertBasic(Map map) {
		SqlSession session = factory.openSession();
		try {
			int i = session.insert("review.insertDetails", map);
			session.commit();
			if (i == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				int j = session.update("review.updateDetails", map);
				if (j == 1)
					return true;
				else
					return false;
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			session.close();
		}
		return false;

	}
	
	public boolean insertDetail(Map map) {
		SqlSession session = factory.openSession();
		try {
			int i = session.insert("review.insertBasic", map);
			if (i == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				int j = session.update("review.updateDetails", map);
				if (j == 1)
					return true;
				else
					return false;
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			session.close();
		}
		return false;

	}
}
