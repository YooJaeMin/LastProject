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

	public void modifyFinal(List<Map> list) {
		Update update = new Update();
		Query query = null;
		for (Map map : list) {

			try {
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
	
	public List adressGet(){
		List<Map> list = new ArrayList<>();
		list = template.find(new Query(), Map.class, "food");
		
		for(int index =0; index < list.size(); index++){
			Map map = list.get(index);
			String adress = (String)map.get("adress");
			String[] adressAr = adress.split("\\s");
			String temp ="";
			for(int i = 0; i <adressAr.length; i++){
				if(i==4) break;
				temp += adressAr[i]+" ";
			}
			map.put("adress", temp);
			list.set(index, map);
		}
		return list;
	}
	
	public void insertMongo(){
		String[] loc = {"개포동","논현동","대치동","도곡동","삼성동","세곡동","수서동","강남구 신사동","압구정동",
				"역삼동","일원동","청담동","강일동","고덕동","길동","둔촌동","명일동","상일동","성내동","암사동",
				"천호동","미아동","번제동","삼각산동","서울 삼양동","송중동","서울 송천동","수유동","우이동",
				"인수동","가양동","공항동","등촌동","발산동","방화동","염창동","우장산동","화곡동","낙성대동",
				"서울 난곡동","난향동","서울 남현동","대학동","서울 미성동","보라매동","관악구 삼성동",
				"서울 조원동","서림동","서원동","성현동","신림동","관악구 신사동","관악구 신원동","은천동",
				"인헌동","서울 조원동","서울 중앙동","서울 청룡동","서울 청림동","행운동","광장동","구의동",
				"서울 군자동","서울 능동","자양동","중곡동","화양동","가리봉동","개봉동","고척동","구로동",
				"수궁동","신도림동","오류동","가산동","독산동","시흥동","공릉동","상계동","월계동","중계동",
				"하계동","도봉동","방학동","쌍문동","창동","답십리동","용신동","이문동","장안동","전농동",
				"제기동","청량리동","회기동","휘경동","노량진동","서울 대방동","사당동","상도동","신대방동",
				"서울 흑석동","공덕동","서울 대흥동","서울 도화동","망원동","서울 상암동","서울 서강동",
				"서울 서교동","성산동","서울 신수동","아현동","연남동","염리동","서울 용강동","서울 합정동",
				"남가좌동","북가좌동","북아현동","서울 신촌동","서울 연희동","천연동","충현동","홍은동",
				"서울 내곡동","반포동","방배동","서초동","양재동","잠원동","금호동","마장동","사근동","성수동",
				"서울 송정동","옥수동","왕십리동","용답동","응봉동","행당동","길음동","돈암동","서울 동선동",
				"서울 보문동","삼선동","석관동","서울 성북동","안암동","월곡동","장위동","정릉동","종암동",
				"가락동","거여동","마천동","문정동","방이동","삼전동","석촌동","송파동","서울 오금동",
				"서울 오륜동","서울 위례동","잠실동","서울 장지동","풍납동","목동","신월동","서울 신정동",
				"당산동","대림동","서울 도림동","문래동","신길동","양평동","서울 여의동","영등포동","나영동",
				"서울 보광동","서빙고동","서울 용문동","용산2가동","원효로동","이촌동","이태원동","청파동",
				"한강로동","한남동","효창동","후암동","갈현동","서울 구산동","녹번동","대조동","불광동",
				"수색동","신사동","역촌동","응암동","서울 증산동","진관동","가희동","교남동","무악동",
				"서울 부암동","서울 사직동","삼청동","승인동","서울 이화동","종로동","창신동","청운효자동",
				"평창동","혜화동","광희동","다산동","동화동","명동","소공동","서울 신당동","약수동","을지로동",
				"장충동","중림동","청구동","필동","황학동","서울 회현동","망우동","면목동","묵제동","상봉동",
				"신내동","중화동"};
		String[] foods = { "냉면", "파스타", "해장국", "한정식", "자장면", "스시", "삼겹살", "한우",
				"떡볶이", "태국음식", "쌀국수", "커리", "메밀국수",
				"피자", "뷔페", "감자탕", "치킨", "칼국수", "보쌈", "족발", "죽","샐러드","김치찌개","된장찌개","쭈꾸미",
				"회","덮밥","브런치","햄버거","청국장","짬뽕","라멘","스테이크","순두부찌개","월남쌈","애프터눈티세트","돈까스","무한리필"
				};
		Map map = new HashMap<>();
//		
		for(int i = 0; i<100000; i++){
			int y = 113 + (int) (Math.random() * 4);
			int m = (int) (Math.random() * 11);
			int dd = 0;
			if (m == 1) {
				dd = 1 + (int) (Math.random() * 28);
			} else if (m == 0 || m == 2 || m == 4 || m == 6 || m == 7 || m == 9 || m == 11) {
				dd = 1 + (int) (Math.random() * 31);
			} else {
				dd = 1 + (int) (Math.random() * 30);
			}
			Date d = new Date(y, m, dd);
			String key = loc[(int)(Math.random()*loc.length)]+" ";
			key += foods[(int)(Math.random()*foods.length)];
			map.put("date", d);
			map.put("keyword", key);
			template.insert(map, "searchKey");
		}

	}

}
