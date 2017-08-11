package com.spring.main.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ProfileFileUtil {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//파일 다운로드 및 삭제시 활용
	String fullpath="D:/Spring/Spring2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/00_Sex/resources/profilePhotos/";

	//파일 업로드
	public String upload(MultipartHttpServletRequest multi, String fileName) {
		
		String newFileName=null;
		
		//저장 경로
		String root = multi.getSession().getServletContext().getRealPath("/");
		logger.info(root);
		String path = root+"resources\\profilePhotos\\";
		//경로 생성
		File dir = new File(path);
		if(!dir.isDirectory()){
			logger.info("폴더 없음 생성 시작");
			dir.mkdir(); //폴더 생성 메소드
		}
		//파일 가져옴
		Iterator<String> files = multi.getFileNames();
		//파일 -> 메모리
		while(files.hasNext()){ //파일이 있는 경우
			String uploadFile = files.next(); 
			MultipartFile mFile = multi.getFile(uploadFile); //파일을 메모리에 담기	
			//새파일 생성
			newFileName = System.currentTimeMillis()+"." //새파일 이름이 중복되지 않기 위해 실시간을 이름으로 지정
					+fileName.substring(fileName.lastIndexOf(".")+1); //가져왔던 파일의 확장자만 따와서 새파일에 붙이기
			logger.info("저장 파일 명 : "+newFileName);
			
			//메모리 -> 새파일
			try {
				mFile.transferTo(new File(path+newFileName)); //저장 경로에 새파일 이름으로 가져온 파일을 저장
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}		
		return newFileName; //저장 경로가 아닌 새파일 이름만 반환
	}

	//파일 삭제
	public int delete(String fileName) {		
		int succcess = 0;		
		try{
			String delName = fullpath+fileName; //파일이 있는 경로 + 새 파일 이름
			logger.info(delName);
			File file = new File(delName);
			if(file.exists()){ //해당 경로에 해당 파일이 있으면 실행
				file.delete(); //해당 파일 삭제
			}else{
				logger.info("이미 삭제된 파일");
			}
			succcess = 1;
		}catch(Exception e){
			System.out.println(e.toString());
		}		
		return succcess;
	}
}
