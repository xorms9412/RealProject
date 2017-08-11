package com.spring.main.util;

import java.io.File;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUtil {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//파일 다운로드 및 삭제시 활용
	String fullpath="D:/Spring/Spring2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/LastTalentForm/resources/upload/";
	
	
	//파일 업로드
	public String upload(MultipartHttpServletRequest multi, String fileName) {
		
		String newFileName=null;
		
		//저장 경로
		String root = multi.getSession().getServletContext().getRealPath("/");
		logger.info(root);
		String path = root+"resources/upload/";		
		//경로 생성
		File dir = new File(path);
		if(!dir.isDirectory()){
			logger.info("폴더 없음 생성 시작");
			dir.mkdir();
		}		
		//파일 가져옴
		Iterator<String> files = multi.getFileNames();//저장한 파일들의 이름을 files 안에 넣는다.
		//파일 -> 메모리
		while(files.hasNext()){//files가 존재한다면
			String uploadFile = files.next();//uploadFile에 저장한다 
			MultipartFile mFile = multi.getFile(uploadFile);//그 저장한 것을 mFile안에다 저장
			//새파일 생성
			newFileName = System.currentTimeMillis()+"."
					+fileName.substring(fileName.lastIndexOf(".")+1);
			logger.info("저장 파일 명 : "+newFileName);
			
			//메모리 -> 새파일
			try {
				mFile.transferTo(new File(path+newFileName));
				System.out.println(path+newFileName);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}		
		return newFileName;
	}

	//파일 삭제
	public int delete(String fileName) {		
		int succcess = 0;		
		try{
			String delName = fullpath+fileName;
			logger.info(delName);
			File file = new File(delName);
			if(file.exists()){
				file.delete();			
			}else{
				logger.info("이미 삭제된 파일");
			}	
			succcess = 1;
		}catch(Exception e){
			System.out.println(e.toString());
		}		
		return succcess;
	}
	//파일 삭제
		public int tpdel(String fileName) {		
			int tpsucccess = 0;		
			try{
				String delName = fullpath+fileName;
				logger.info(delName);
				File file = new File(delName);
				if(file.exists()){
					file.delete();			
				}else{
					logger.info("이미 삭제된 파일");
				}	
				tpsucccess = 1;
			}catch(Exception e){
				System.out.println(e.toString());
			}		
			return tpsucccess;
		}

}
