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
	
	// 전체 데이터 갯수
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
	
	// 일부분의 데이터를 리스트화
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

	// 데이터 등록 처리 
	//(Map에 설정된 데이터를 TABLE에 insert 처리 후 결과 int 반환)
	public int addNew(Map map) {
		SqlSession session = factory.openSession();
		int rst = 0; // 디폴트 : 0
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

	// 모든 데이터를 리스트화 처리 
	//(Table의 각 로우정보를 HashMap에 담아서 List 형 컬렉션화)
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

	// 데이터 하나를 Map화 시켜주는 메서드(전달받은 PK의 데이터를 Map형화)
	public HashMap getOneInDetail(Map map) {
		SqlSession session = factory.openSession();
		HashMap one = null;
		try {
			one = (HashMap)session.selectList("freeboard.getOneInDetail",map);
			session.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
		}
		return one;
	}
}
