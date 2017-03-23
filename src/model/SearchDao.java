package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationOperation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class SearchDao {
	@Autowired
	MongoTemplate template;
	@Autowired
	LocationCalculator lc;
	@Autowired
	SqlSessionFactory factory;

	public List mongoWithSql(List<Map> list) {
		List tempList = new ArrayList();
		SqlSession session = factory.openSession();
		try {
			for (Map map : list) {

				List sqlList = session.selectList("review.reviewResult", map);
				int hitCnt = session.selectOne("store.hitCnt", map);
				int avg = session.selectOne("review.avgResult", map);
				map.put("sqlInfo", sqlList);
				map.put("avg", avg);
				map.put("hitCnt", hitCnt);
				tempList.add(map);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return tempList;
	}

	public List rankFilter(List<Map> list) {

		Collections.sort(list, new Comparator<Map>() {
			public int compare(Map o1, Map o2) {
				// o1이 더작으면 -1 (우선순위)
				// o2가 더작으면 1 (우선순위)
				if ((int) o1.get("avg") > (int) o2.get("avg")) {
					return 1;
				} else if ((int) o1.get("avg") < (int) o2.get("avg")) {
					return -1;
				} else {
					if ((int) o1.get("hitCnt") > (int) o2.get("hitCnt")) {
						return 1;
					} else if ((int) o1.get("avg") < (int) o2.get("hitCnt")) {
						return -1;
					} else
						return 0;
				}
			}
		});

		return list;
	}

	public List tagSearch(String selectedTag) {
		List list = template.findAll(Map.class, "food");
		List tempList = new ArrayList();
		outerLoof: for (int i = 0; i < list.size(); i++) {
			Map innerMap = (Map) list.get(i);
			List typeList = (List) innerMap.get("type");
			for (int j = 0; j < typeList.size(); j++) {
				String tag = (String) typeList.get(j);
				if (tag.equals(selectedTag)) {
					tempList.add(list.get(i));
					continue outerLoof;
				}
			}

			try {
				List tagList = (List) innerMap.get("tag");
				for (int j = 0; j < tagList.size(); j++) {
					String tag = (String) tagList.get(j);
					if (tag.equals(selectedTag)) {
						System.out.println(tagList.toString());
						tempList.add(list.get(i));
						continue outerLoof;
					}
				}
			} catch (Exception e) {
				continue outerLoof;
			}
		}
		System.out.println(tempList.toString());
		return tempList;
	}

	public List titleSearch(Map map) {
		List list = template.findAll(Map.class, "food");
		String[] words = ((String) map.get("keyword")).split("\\s");
		List tempList = new ArrayList();
		outerLoof: for (int i = 0; i < list.size(); i++) {
			Map innerMap = (Map) list.get(i);
			String title = (String) innerMap.get("title");
			for (String word : words) {
				if (title.contains(word)) {
					tempList.add(innerMap);
					break;
				}
			}
		}
		System.out.println(tempList.toString());
		return tempList;
	}

	public List doSearch(Map map) {
		List list = new ArrayList();
		list = template.findAll(Map.class, "food");
		List newList = new ArrayList();
		try {
			newList = lc.calDistance((double) map.get("lat"), (double) map.get("lng"), list);
		} catch (Exception e) {
			System.out.println("double터짐");
			try {
				newList = lc.calDistance((int) map.get("lat"), (int) map.get("lng"), list);
			} catch (Exception e2) {
				System.out.println("int터짐");
			}
		}
		List filterList = doFilter(newList, map);

		return filterList;
	}

	public List doFilter(List list, Map map) {
		String[] keyword = ((String) map.get("keyword")).split("\\s");
		List filterList = new ArrayList();
		if (keyword.length != 1) {
			outterLoof: for (int i = 0; i < list.size(); i++) {
				Map innerMap = (Map) list.get(i);

				List typeList = (List) innerMap.get("type");
				try {
					for (int j = 0; j < typeList.size(); j++) {
						String type = (String) typeList.get(j);
						for (String key : keyword) {
							if (key.equals(type)) {
								filterList.add(innerMap);
								continue outterLoof;
							}
						}
					}
				} catch (Exception e) {
					continue;

				}

				List tagList = (List) innerMap.get("tag");
				try {
					for (int j = 0; j < tagList.size(); j++) {
						String tag = (String) tagList.get(j);
						for (String key : keyword) {
							if (key.equals(tag)) {
								filterList.add(innerMap);
								continue outterLoof;
							}
						}
					}
				} catch (Exception e) {
					continue;
				}

				List itemList = (List) innerMap.get("item");
				try {
					for (int j = 0; j < itemList.size(); j++) {
						String item = (String) itemList.get(j);
						for (String key : keyword) {
							if (key.equals(item)) {
								filterList.add(innerMap);
								continue outterLoof;
							}
						}
					}
				} catch (Exception e) {
					continue;

				}

			}
		} else {
			filterList = list;
		}

		return filterList;

	}

	public List storeDetail(Map map) {
		Query query = new Query();
		query.addCriteria(Criteria.where("tel").is((String) map.get("tel")));

		List result = template.find(query, Map.class, "food");
		return result;
	}

	public List realTimeRank() {
		List list = new ArrayList();
		Criteria criteria = Criteria.where("date").gte(System.currentTimeMillis() - 3 * 60 * 60 * 1000);

		AggregationOperation ao1 = Aggregation.match(criteria);
		AggregationOperation ao2 = Aggregation.group("keyword").count().as("cnt");
		AggregationOperation ao3 = Aggregation.sort(Direction.DESC, "cnt");
		AggregationOperation ao4 = Aggregation.limit(5);

		Aggregation aggr = Aggregation.newAggregation(ao1, ao2, ao3, ao4);

		AggregationResults<Map> result = template.aggregate(aggr, "searchKey", Map.class);

		list = result.getMappedResults();

		return list;
	}

	public List todayRank() {
		List list = new ArrayList();

		Date date = new Date();
		Date date2 = new Date(date.getYear(), date.getMonth(), date.getDate());

		Criteria criteria = Criteria.where("date").gte(date2.getTime());

		AggregationOperation ao1 = Aggregation.match(criteria);
		AggregationOperation ao2 = Aggregation.group("keyword").count().as("cnt");
		AggregationOperation ao3 = Aggregation.sort(Direction.DESC, "cnt");
		AggregationOperation ao4 = Aggregation.limit(5);

		Aggregation aggr = Aggregation.newAggregation(ao1, ao2, ao3, ao4);

		AggregationResults<Map> result = template.aggregate(aggr, "storeRank", Map.class);
		list = result.getMappedResults();

		return list;
	}

	public void insertSearch(String keyword) {
		Map map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("date", System.currentTimeMillis());
		template.insert(map, "searchKey");
	}
	public List reviewList(Map map){
		SqlSession session = factory.openSession();
		List list = null;
		try {
			list = session.selectList("review.reviewResult", map);
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

}
