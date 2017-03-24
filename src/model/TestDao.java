package model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

import org.apache.commons.collections.Factory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.mongodb.WriteResult;

@Service
public class TestDao {

	@Autowired
	SqlSessionFactory factory;

	@Autowired
	MongoTemplate template;

	public boolean insertOne(Map map) {
		SqlSession session = factory.openSession();
		int i = 0;
		try {
			i = session.insert("member.normalCreate", map);
			session.commit();
			session.insert("member.normalDetail", map);
			session.commit();
		} catch (Exception e) {

		} finally {
			session.close();
		}
		if (i == 1)
			return true;
		else
			return false;

	}

	public List getId() {
		SqlSession session = factory.openSession();
		List list = null;
		try {
			list = session.selectList("member.All");
		} catch (Exception e) {

		} finally {
			session.close();
		}
		return list;
	}

	public List getTel() {
		List list = template.findAll(Map.class, "food");
		return list;
	}

	public void insertReview(Map map) {
		SqlSession session = factory.openSession();
		try {
			session.insert("review.insertDetails", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	public List modifyLoc() {
		Query query = new Query(Criteria.where("lat").is(0));
		List list = template.find(query, Map.class, "food");
		return list;
	}

	public void modifyFinal(List list) {
		Update update = new Update();
		Map map = null;
		Query query = null;
		for (int i = 0; i < list.size() - 1; i++) {

			try {
				map = (Map) list.get(i);
				query = new Query(Criteria.where("tel").is((String) map.get("tel")));

				try {
					update.set("lat", (double) map.get("lat"));
					update.set("lng", (double) map.get("lng"));
				} catch (Exception e) {
					update.set("lat", 0);
					update.set("lng", 0);
				}
			} catch (Exception e) {
				e.printStackTrace();
				continue;
			}
			template.updateFirst(query, update, "food");

		}

	}

}
