package model;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

@Service
public class LocationCalculator {
	@Autowired
	MongoTemplate template;

	public List getAll() {

		List list = template.findAll(Map.class, "test");
		return list;
	}

	public List getLocation(double lat1, double lng1) {
		List list = template.findAll(Map.class);
		System.out.println(list.toString());
		list = calDistance(lat1, lng1, list);
		return list;
	}

	public List calDistance(double lat1, double lng1, List list) {

		double theta, dist;
		double lat2;
		double lng2;
		List newList = new ArrayList();
		for (int i = 0; i < list.size(); i++) {

			Map map = (Map) list.get(i);
			if (map == null)
				break;
			try {
				lat2 = (double) map.get("lat");
				lng2 = (double) map.get("lng");
			} catch (ClassCastException e) {
				lat2 = (int) map.get("lat");
				lng2 = (int) map.get("lng");
			}
			theta = lng1 - lng2;
			dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2))
					+ Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
			dist = Math.acos(dist);
			dist = rad2deg(dist);

			dist = dist * 60 * 1.1515;
			dist = dist * 1.609344; // 단위 mile 에서 km 변환.
			dist = dist * 1000.0; // 단위 km 에서 m 로 변환
			if (dist <= 1000){
				newList.add(map);
//				System.out.println(map.toString());
			}
			

		}
		return newList;
	}

	// 주어진 도(degree) 값을 라디언으로 변환
	private double deg2rad(double deg) {
		return (double) (deg * Math.PI / (double) 180d);
	}

	// 주어진 라디언(radian) 값을 도(degree) 값으로 변환
	private double rad2deg(double rad) {
		return (double) (rad * (double) 180d / Math.PI);
	}
}
