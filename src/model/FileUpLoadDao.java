package model;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUpLoadDao{
	@Autowired
	ServletContext application;
	
	@Autowired
	SqlSessionFactory factory;
	public Map execute(MultipartFile file) throws Exception {
		Map result = new HashMap<>();
			long size = file.getSize();
			result.put("filesize", size);
			String orgName = file.getOriginalFilename();
			result.put("filename",orgName);
			String path = application.getRealPath("/views/memberImg");
			File dir = new java.io.File(path);
			if (!dir.exists())
				dir.mkdirs(); 
			String saveName = System.currentTimeMillis()+"_"+orgName;
			File dest = new File(path, saveName);
			file.transferTo(dest); 
			result.put("fileaddress", dest.getPath());
			result.put("filelink", "/views/memberImg/"+saveName);
			
		return result;
	}
	
	public int picSave(Map map){
		SqlSession session = factory.openSession();
		int r=0;
		try{
			r=session.update("picture.upload",map);
			System.out.println("PicSave결과"+r);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return r;
		
	}
	
	
	
	
}
