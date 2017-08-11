package com.spring.main.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardInterface;
import com.spring.main.beans.ReplyBean;
import com.spring.main.beans.BoardBean;
import com.spring.main.beans.BphotoDTO;
import com.spring.main.beans.FollowListBean;
import com.spring.main.util.FileUtil;
import com.spring.main.util.ProfileFileUtil;
import com.spring.main.beans.MemberDto;
import com.spring.main.beans.TradeDto;

@Service
public class HiService {

@Autowired SqlSession sqlSession;
	
	BoardInterface inter;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	//임시 파일 저장
	Map<String, String> fileList  = new HashMap<String, String>();
	
	//삭제할 파일 임시 저장
	Map<String,String> delFileList = new HashMap<String,String>();
	@Autowired
	private JavaMailSenderImpl mailSender; // xml에 등록한 bean autowired

	//중복 체크
	public Map<String, String> overlay(String id) {				
		Map<String, String> json = new HashMap<String, String>();
		inter = sqlSession.getMapper(BoardInterface.class);
		String use = "N";		
		
		if(inter.overlay(id) == null){
			use = "Y";
		}
		
		json.put("use", use);
		return json;
	}

	//회원가입
	public Map<String, Integer> join(Map<String, String> params) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);		
		MemberDto bean = new MemberDto();
		
		//암호화
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String pass = passEncoder.encode(params.get("pw"));
		logger.info("pass : {}",pass);
		bean.setUser_id(params.get("id"));
		bean.setUser_pw(pass);
		bean.setUser_name(params.get("name"));
		bean.setUser_email(params.get("email"));
		bean.setBirth(params.get("birth"));
		bean.setGender(params.get("gender"));
		bean.setUser_phone(params.get("phone"));
		bean.setAddress(params.get("address"));
		json.put("success", inter.join(bean));
		
		return json;
	}

	//로그인(퀵서치 ctrl+shift+L)
	public ModelAndView login(Map<String, Object> params) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		
		String id = (String) params.get("userId");
		String pw = (String) params.get("userPw");
		HttpSession session = (HttpSession) params.get("session");
		
		String pass = inter.securityLogin(id);
		String page = "login";
		logger.info("암호화된 비번 : {}",pass);
		//원본 == 암호화 -> true | false
		if(passEncoder.matches(pw, pass)){
			page="selectCat";
			session.setAttribute("loginId", id);
		}else{
			mav.addObject("msg", "아이디 또는 비밀번호를 확인 하세요!");
		}
		
		mav.setViewName(page);
		
		return mav;
	}

	public Map<String, String> findid(Map<String, String> params) {
		Map<String, String> json = new HashMap<String, String>();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		String name = params.get("name");
		String email = params.get("email");
		String birth = params.get("birth");
		logger.info("{}",name);
		logger.info("{}",email);
		logger.info("{}",birth);
		String msg = "정보에 일치하는 ID가 존재하지 않습니다.";
		String id = "";
		if(inter.findid(name,email,birth)!=null){
			id = inter.findid(name,email,birth);
			msg = "";
		}
		
		json.put("id", id);
		json.put("findidmsg", msg);
		return json;
	}

	public Map<String, Object> findpw(Map<String, String> params) {
		Map<String, Object> json = new HashMap<String, Object>();
		inter = sqlSession.getMapper(BoardInterface.class);

		String id = params.get("id");
		String name = params.get("name");
		String email = params.get("email");
		String birth = params.get("birth");
		logger.info("{}",id);
		logger.info("{}",name);
		logger.info("{}",email);
		logger.info("{}",birth);
		
		int success = 0;
		String msg = "입력 정보를 확인해 주세요.";
		
		
		if(inter.findpw(id,name,email,birth)!=null){
			int randomNum = 100000 + (int)(Math.random()*899999); 
			String imsi = String.valueOf(randomNum);
			logger.info("임시 비밀번호 : {}",imsi);
			String setfrom = "syyjbhjh7@gmail.com";         
		    String tomail  = email;    // 받는 사람 이메일
		    String title   = "Talent Farm 임시 비밀번호 전송입니다.";     // 제목
		    String content = "임시 비밀번호는 "+imsi+" 입니다.";    // 내용
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				      = new MimeMessageHelper(message, true, "UTF-8");
				 
				messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(tomail);     // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content);  // 메일 내용
				     
				mailSender.send(message);
			} catch(Exception e){
				System.out.println(e);
			}
			
			
			BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
			String pass = passEncoder.encode(imsi);
			inter.changepw(pass,id);
			msg = "입력하신 메일로 임시 비밀번호가 전송되었습니다.";
			success = 1;
		}
		json.put("success", success);
		json.put("msg", msg);
		return json;
	}

	public ModelAndView timeline(String id) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		System.out.println(inter.profileInfo(id));
		mav.addObject("profile",inter.profileInfo(id));
		mav.addObject("bphoto",inter.timeline(id));
		mav.setViewName("timeline");
		return mav;
	}

	//임시 파일 저장
/*	Map<String, String> fileList  = new HashMap<String, String>();
*/
	//파일 업로드
	public ModelAndView fileUpload(MultipartHttpServletRequest multi) {
		ModelAndView mav = new ModelAndView();
		
		String fileName = multi.getParameter("fileName");
		String newFileName = null;
		
		FileUtil futil = new FileUtil();
		newFileName = futil.upload(multi, fileName);
		
		fileList.put(newFileName, fileName);
		logger.info("저장할 파일 갯수 : {}", fileList.size());
		mav.addObject("path", "resources/upload/"+newFileName);
		mav.addObject("size",fileList.size());
		mav.setViewName("uploadForm");
		return mav;
	}
	
	
	public Map<String, String> del() {
		Map<String, String> map = new HashMap<String, String>();
		FileUtil futil = new FileUtil();
		
		
		int success = 0;
		
		//파일 삭제를 위해 key값을 통해 newfileName 을 가져온다
		for(String key:fileList.keySet()){
			//oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
			System.out.println(key);
			success = futil.delete(key);
		}
		//success = futil.delete(fileList.get("newFileName"));
		System.out.println(success);
		//해당 파일 명이 있음 지워라!
		/*if(fileList.get(fileList.get("newFileName"))!=null && success == 1){
			
			inter = sqlSession.getMapper(BoardInterface.class);
			//inter.fileUpdate(fileList.get("newFileName"));
			fileList.remove(fileList.get("newFileName"));
		}		*/	
		if(success == fileList.size()){
			map.put("success", "ok");
		}
		
		map.put("success", "no");
		fileList.clear();
		return map;
	}

	//글 쓰기
	@Transactional
	public ModelAndView write(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		BoardBean bean = new BoardBean();
		// 작성자/제목/내용		
		String writer = params.get("writer");
		String content = params.get("content");
		String cat = params.get("cat");
		String tag = params.get("tag");
		String page = "";
		
		logger.info("user_name : {}", writer);
		logger.info("content : {}", content);
		logger.info("cat : {}", cat);
		logger.info("tag:{}",tag);
		
		bean.setWriter(writer);
		bean.setBoard_content(content);	
		bean.setBoard_cat(cat);
		bean.setBoard_tag(tag);

		//빈을 사용해야 키를 반환 받을 수 있다.
		if(inter.write(bean)==1){
			page="redirect:/profile";
			int size = fileList.size();
			logger.info("업로드 된 파일 갯수 : {}",size);
			if(size>0){
				//맵에 있는 키를 전부 가져와 하나씩 꺼낸다.
				for(String key:fileList.keySet()){
					//oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
					inter.writeFile(fileList.get(key),key,bean.getBoard_idx());
				}
				fileList.clear();
			}
		}
		
		mav.addObject("loginId", writer);
		mav.setViewName(page);
		
		return mav;
	}
	
	public ModelAndView buy(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		TradeDto Tdto = new TradeDto();
		
		//주문서 작성 - 제목, 구매내용, 구매자, 판매자
		String trade_title = params.get("trade_title");
		String trade_content = params.get("trade_content");
		String buy = params.get("buy");
		String sell = params.get("sell");
		int trade_price = Integer.parseInt(params.get("trade_price"));
		String trade_alam=params.get("trade_alam");
		String trade_start=params.get("trade_start");
		String trade_end=params.get("trade_end");
		
		
		logger.info("trade_title : {}", trade_title);
		logger.info("trade_content : {}", trade_content);
		logger.info("buy : {}", buy);
		logger.info("sell : {}", sell);
		
		Tdto.setTrade_title(trade_title);
		Tdto.setTrade_content(trade_content);
		Tdto.setTrade_buy(buy);	
		Tdto.setTrade_sell(sell);	
		Tdto.setTrade_price(trade_price);
		Tdto.setTrade_alam(trade_alam);
		Tdto.setTrade_start(trade_start);
		Tdto.setTrade_end(trade_end);
		
		
		String page="redirect:/buyWrite";

		if(inter.buy(Tdto)==1){
			page="redirect:/timeline?id="+sell;
			int size = fileList.size();
			logger.info("업로드 된 파일 갯수 : {}",size);
			if(size>0){
				for(String key:fileList.keySet()){
					inter.writebuyFile(fileList.get(key),key,Tdto.getTrade_idx());
				}
				fileList.clear();
			}			
		}

		mav.setViewName(page);
		
		return mav;
	}

	public ModelAndView review(String id) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		String seller = id;
		mav.addObject("reviewList",inter.review(id));
		
		mav.addObject("seller",seller);
		
		mav.setViewName("review");
		return mav;
	}

	public ModelAndView reviewwrite(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		BoardBean bean = new BoardBean();
		// 작성자/제목/내용		
		String writer = params.get("buyer");
		String content = params.get("content");
		String cat = params.get("cat");
		String seller = params.get("seller");
		
		logger.info("user_name : {}", writer);
		logger.info("content : {}", content);
		logger.info("cat : {}", cat);
		
		bean.setWriter(writer);
		bean.setBoard_content(content);	
		bean.setBoard_cat(cat);
		bean.setBoard_sell(seller);
		
		
		String page="redirect:/review?id="+seller;

		//빈을 사용해야 키를 반환 받을 수 있다.
		if(inter.reviewwrite(bean)==1){
			int size = fileList.size();
			logger.info("업로드 된 파일 갯수 : {}",size);
			if(size>0){
				//맵에 있는 키를 전부 가져와 하나씩 꺼낸다.
				for(String key:fileList.keySet()){
					//oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
					inter.writeFile(fileList.get(key),key,bean.getBoard_idx());
				}
				fileList.clear();
			}			
		}

		mav.setViewName(page);
		
		return mav;
	}
	//카테고리 선택 리스트
	public ModelAndView mainlist(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		int chcnt = Integer.parseInt(params.get("chcnt"));
		System.out.println(chcnt);
		
		if(chcnt == 1){
			String cat0 = params.get("catone");
			System.out.println(cat0);
			mav.addObject("list",inter.mainlist0(cat0));
			mav.addObject("photos",inter.photos0(cat0));
		}
		if(chcnt == 2){
			String cat0 = params.get("catone");
			String cat1 = params.get("cattwo");
			System.out.println(cat0);
			System.out.println(cat1);
			mav.addObject("list",inter.mainlist1(cat0,cat1));//카테고리 등 가져오기
			mav.addObject("photos",inter.photos1(cat0,cat1));
			
		}
		if(chcnt == 3){
			String cat0 = params.get("catone");
			String cat1 = params.get("cattwo");
			String cat2 = params.get("catthree");
			System.out.println(cat0);
			System.out.println(cat1);
			System.out.println(cat2);
			mav.addObject("list",inter.mainlist2(cat0,cat1,cat2));
			mav.addObject("photos",inter.photos2(cat0,cat1,cat2));
		}
		if(chcnt == 4){
			String cat0 = params.get("catone");
			String cat1 = params.get("cattwo");
			String cat2 = params.get("catthree");
			String cat3 = params.get("catfour");
			System.out.println(cat0);
			System.out.println(cat1);
			System.out.println(cat2);
			System.out.println(cat3);
			mav.addObject("list",inter.mainlist3(cat0,cat1,cat2,cat3));
			mav.addObject("photos",inter.photos3(cat0,cat1,cat2,cat3));
		}
		if(chcnt == 5){
			String cat0 = params.get("catone");
			String cat1 = params.get("cattwo");
			String cat2 = params.get("catthree");
			String cat3 = params.get("catfour");
			String cat4 = params.get("catfive");
			System.out.println(cat0);
			System.out.println(cat1);
			System.out.println(cat2);
			System.out.println(cat3);
			System.out.println(cat4);
			mav.addObject("list",inter.mainlist4(cat0,cat1,cat2,cat3,cat4));
			mav.addObject("photos",inter.photos4(cat0,cat1,cat2,cat3,cat4));
		}
		mav.setViewName("/mainlist");
		
		return mav;
	}

	//상세보기
	@Transactional
	public Map<String, Object> detail(String idx) {
		Map<String, Object> json = new HashMap<String, Object>();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		json.put("content", inter.content(idx));
		json.put("photoList", inter.photoList(idx));
		return json;
	}

	//리플리스트
	public Map<String, ArrayList<ReplyBean>> repleList(int idx) {
		
		Map<String, ArrayList<ReplyBean>> json
			= new HashMap<String, ArrayList<ReplyBean>>();
		
		inter = sqlSession.getMapper(BoardInterface.class);
		json.put("list", inter.replyList(idx));		
		
		return json;
	}

	//댓글 등록
	@Transactional
	public Map<String, Integer> repleRegist(Map<String, String> params) {
		
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		String replyer = params.get("user");
		String reple = params.get("content");
		String idx = params.get("idx");		

		json.put("success", inter.repleRegist(replyer,reple,idx));
		return json;
	}

	//댓글 삭제
	@Transactional
	public Map<String, Integer> repleDel(int repleIdx, int idx) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		json.put("success", inter.repleDel(repleIdx));
		
		return json;
	}

	//좋아요
	@Transactional
	public Map<String, Integer> like(int idx, String user) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		if(inter.likecheck(idx,user) != null){
			inter.likecancel(idx,user);
			inter.likeminus(idx);
			json.put("success", 0);
		}else{
			json.put("success", inter.like(idx,user));
			inter.likeplus(idx);
		}
		
		
		return json;
	}


	public Map<String, String> likenum(int idx) {
		Map<String, String> json = new HashMap<String, String>();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		json.put("likenum", inter.likenum(idx));
		return json;
	}

	//파일 삭제
	public Map<String, Integer> uploadFileDelete(String fileName) {
		
		Map<String, Integer> json = new HashMap<String, Integer>();
		int success = 0;
		
		FileUtil futil = new FileUtil();
		success = futil.delete(fileName);
		//해당 파일 명이 있음 지워라!
		if(fileList.get(fileName)!=null && success == 1){
			inter = sqlSession.getMapper(BoardInterface.class);
			//inter.fileUpdate(fileName);
			fileList.remove(fileName);
		}				
		json.put("success", success);
		
		return json;
	}


	//수정하기
	@Transactional
	public ModelAndView modify(Map<String, String> params) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		BoardBean bean = new BoardBean();
		// 작성자/제목/내용		
		int idx = Integer.parseInt(params.get("idx"));
		String content = params.get("content");
		String cat = params.get("cat");
		String division = params.get("division");
		String modifyUserId = params.get("modifyUserId");
		String page = "";
		
		logger.info("idx : {}", idx);
		logger.info("content : {}", content);
		logger.info("cat : {}", cat);
		
		bean.setBoard_idx(idx);
		bean.setBoard_content(content);	
		bean.setBoard_cat(cat);
		
		if(division.equals(null)){
			page="redirect:/";
		}else if(division.equals("profile")){
			page="redirect:/profile";
			mav.addObject("loginId", modifyUserId);
		}
		
	
		//빈을 사용해야 키를 반환 받을 수 있다.
		if(inter.modify(bean)==1){
			int size = fileList.size();
			logger.info("업로드 된 파일 갯수 : {}",size);
			if(size>0){
				//맵에 있는 키를 전부 가져와 하나씩 꺼낸다.
				for(String key:fileList.keySet()){
					//oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
					inter.writeFile(fileList.get(key),key,idx);
				}
				fileList.clear();
			}			
		}
		
		mav.setViewName(page);
		
		return mav;
	}


	/*public Map<String, Integer> modifyFileDelete(String fileName) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		int success = 0;
		
		FileUtil futil = new FileUtil();
		success = futil.delete(fileName);
		
			inter = sqlSession.getMapper(BoardInterface.class);
			inter.modifyFileDelete(fileName);
			logger.info(fileName);	
		json.put("success", success);
		
		return json;
	}*/
	
	//delFileList 비우기
	public Map<String, String> modifyNotDel() {
		
		Map<String, String> json = new HashMap<String, String>();
		json.put("success", "success");
		delFileList.clear();
		return json;
	}
	
	//delFileList에 있는 사진 삭제하기
	public Map<String, String> modifyDel() {
		Map<String, String> json = new HashMap<String, String>();
		FileUtil futil = new FileUtil();
		inter = sqlSession.getMapper(BoardInterface.class);
		for(String key:delFileList.keySet()){
			//oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
			System.out.println(key);
			futil.delete(key);
			inter.modifyFileDelete(key);
		}		
		delFileList.clear();
		json.put("success", "success");
		
		return json;
	}

	
	//류

	//프로필 페이지 이동
	public ModelAndView profile(String id) {
		
		ModelAndView mav = new ModelAndView();
		
		inter = sqlSession.getMapper(BoardInterface.class);
		
		mav.addObject("profile", inter.profile(id));
		mav.setViewName("profile");
		
		return mav;
	}
	
	
	//프로필 사진 수정(아작스)
	public Map<String, String> profilePhoto(MultipartHttpServletRequest multi) {
		
		Map<String, String> json = new HashMap<String, String>();
		
		String photoName = multi.getParameter("photoName"); //파일 이름 가져오기
		String beforePhotoName = multi.getParameter("beforePhotoName");
		String newFileName = null;
		
		logger.info("photoName : "+photoName+", beforePhotoName : "+beforePhotoName);
		
		ProfileFileUtil futil = new ProfileFileUtil();
		newFileName = futil.upload(multi, photoName);
		if(!fileList.isEmpty()){
			futil.delete(beforePhotoName);
		}
		
		fileList.put(newFileName, photoName);
		logger.info("저장한 파일 갯수 : "+fileList.size());
		
		json.put("path","resources/profilePhotos/"+newFileName);
		
		return json;
	}

	//프로필 수정
	public ModelAndView profileModify(Map<String, String> params) {
		//파라메터 값들
		String newfile = params.get("newfile");
		String user_id = params.get("user_id");
		String user_name = params.get("user_name");
		String user_email = params.get("user_email");
		String user_phone = params.get("user_phone");
		String gender = params.get("user_gender");
		String intro = params.get("intro");
		String birth = params.get("birth");
		String address_one = params.get("address_one");
		String address_two = params.get("address_two");
		String address = address_one + " " +address_two;
		String hidden_user_gender = params.get("hidden_user_gender");
		String hidden_birth = params.get("hidden_birth");
		String hidden_address = params.get("hidden_address");
		String oldfile = params.get("oldfile");
		
		//문자열 타입 => Date 타입 변환
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = format.parse(hidden_birth);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//Date타입을 DB에 넣기 위한 변환
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = format2.format(date);
		
		//각 값들이 없을 경우 원래 값들을 DB에 저장
		if(gender == ""){
			gender = hidden_user_gender;
		}
		if(birth == ""){
			birth = dateString;
		}
		if(address_one == "" || address_two == ""){
			address = hidden_address;
		}
		if(!fileList.isEmpty()){
			oldfile = fileList.get(newfile);
			fileList.clear();
		}
		
		logger.info("birth : "+birth+", user_gender : "+gender+", address : "+address+", oldfile : "+oldfile);
		
		ModelAndView mav = new ModelAndView();
		
		inter = sqlSession.getMapper(BoardInterface.class);
		inter.profileModify(intro, newfile, oldfile, user_name, user_email, user_phone, gender, birth, address, user_id);
		
		mav.addObject("loginId", user_id);
		mav.setViewName("redirect:/profile");
		
		return mav;
	}

	//프로필 사진 삭제(아작스)
	public Map<String, Integer> delfile(String delfile) {
		
		Map<String, Integer> json = new HashMap<String, Integer>();
		
		logger.info("delfile : "+delfile);
		
		ProfileFileUtil futil = new ProfileFileUtil();
		json.put("success", futil.delete(delfile));
		
		return json;
	}

	//비밀번호 변경
	public Map<String, Integer> pwModify(String newPw, String beforePw, String id) {
		
		Map<String, Integer> json = new HashMap<String, Integer>();
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		
		int result;
				
		String secPw = inter.securityPw(id);
		logger.info("가져온 암호화된 비밀번호 : "+secPw);
		
		//원본 == 암호화 -> true | false
		if(!passEncoder.matches(beforePw, secPw)){
			result = 0;
		}else{
			//암호화
			String pass = passEncoder.encode(newPw);
			logger.info("새로 암호화된 비밀번호 : "+pass);
			inter.pwModify(pass, id);
			result = 1;
		}
		
		json.put("result", result);
		
		return json;
	}

	//프로필 게시글 가져오기(아작스)
	public Map<String, ArrayList<BphotoDTO>> profileList(String id) {
		
		Map<String, ArrayList<BphotoDTO>> json = new HashMap<String, ArrayList<BphotoDTO>>();
		
		inter = sqlSession.getMapper(BoardInterface.class);
		json.put("profileList", inter.profileList(id));
		
		return json;
	}
	
	//팔로우(언팔로우) 하기
	@Transactional
	public ModelAndView follow(String id, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		int exist = 0;
		logger.info("로그인한 id(팔로우) : "+loginId);
		
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		ArrayList<String> followId = inter.followCheck(loginId);
		for(int i=0;i<followId.size();i++){ //팔로우 했는지 확인
			String Chk = followId.get(i);
			if(Chk.equals(id)){
				exist = 1;
			}
		}
		
		if(exist == 0){
			//팔로우 하지 않았을 시 실행
			inter.follow(loginId, id); //팔로우 하기
			inter.followUp(loginId); //팔로우 수 늘리기
			inter.followerUp(id); //팔로워 수 늘리기
		}else{
			//팔로우 했을 시 실행
			inter.unFollow(loginId, id); //언팔로우 하기
			inter.followDown(loginId); //팔로우 수 줄이기
			inter.followerDown(id); //팔로워 수 줄이기
		}
		
		mav.addObject("id", id);
		mav.setViewName("redirect:/timeline");
		
		return mav;
	}
	
	//팔로우 가져오기
	public Map<String, Integer> getFollow(Map<String, String> params) {
		
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, Integer> json = new HashMap<String, Integer>();
		String follow = params.get("follow");
		String follower = params.get("follower");
		int result = 0;
		
		ArrayList<String> followId = inter.getFollow(follower);
		for(int i=0;i<followId.size();i++){ //팔로우 했는지 확인
			String Chk = followId.get(i);
			logger.info(Chk);
			if(Chk.equals(follow)){
				result = 1;
			}
		}
		
		json.put("result", result);
		
		return json;
	}
	
	//팔로우 리스트 가져오기
	public Map<String, ArrayList<FollowListBean>> followList(String follower) {
		
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, ArrayList<FollowListBean>> json = new HashMap<String, ArrayList<FollowListBean>>();
		
		json.put("followList", inter.followList(follower));
		return json;
	}

	//팔로워 리스트 가져오기
	public Map<String, ArrayList<FollowListBean>> followerList(String follow) {
		
		inter = sqlSession.getMapper(BoardInterface.class);
		Map<String, ArrayList<FollowListBean>> json = new HashMap<String, ArrayList<FollowListBean>>();
		
		json.put("followerList", inter.followerList(follow));
		
		return json;
	}
		
		
	
	
	

	public Map<String, Integer> fileDelList(String fileName) {
		Map<String, Integer> json = new HashMap<String, Integer>();
		delFileList.put(fileName, "삭제대기");
		for(String key:fileList.keySet()){
			//oldFile, newFile, idx(빈즈를 사용할 수도 있다.)
			System.out.println(key);
		}
		int success = 1;
		json.put("success",success);
		return json;
	}
	
	public Map<String, Integer> tpDelete(String fileName) {
		
		Map<String, Integer> json = new HashMap<String, Integer>();
		int tpsuccess = 0;
		
		FileUtil futil = new FileUtil();
		tpsuccess = futil.tpdel(fileName);
		//해당 파일 명이 있음 지워라!
		if(fileList.get(fileName)!=null && tpsuccess == 1){
			inter = sqlSession.getMapper(BoardInterface.class);
			//inter.fileUpdate(fileName);
			fileList.remove(fileName);
		}				
		json.put("tpsuccess", tpsuccess);
		
		return json;
	}

	//알람
	public Map<String, ArrayList<TradeDto>> alamOn(String sessionId){
		
		Map<String, ArrayList<TradeDto>> json = new HashMap<String, ArrayList<TradeDto>>();
		
		inter = sqlSession.getMapper(BoardInterface.class);
		
		System.out.println(inter.alamCheck(sessionId));
		System.out.println(inter.alamChecktwo(sessionId));
		System.out.println(inter.alamCheckthree(sessionId));
		System.out.println(inter.alamCheckfour(sessionId));
		json.put("success", inter.alamCheck(sessionId));
		json.put("ingye", inter.alamChecktwo(sessionId));
		json.put("finish", inter.alamCheckthree(sessionId));
		json.put("soorock", inter.alamCheckfour(sessionId));

		return json;
	}
	@Transactional
	public ModelAndView tradeDetail(String idx) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("photo",inter.tradeDetailPhoto(idx));
		mav.addObject("list",inter.tradeDetail(idx));
		mav.addObject("sellerProfile",inter.sellerProfile(idx));
		mav.addObject("buyerProfile",inter.buyerProfile(idx));
		inter.tradeAlam(idx);
		mav.setViewName("tradeDetail");
	
		return mav;
	}
	@Transactional
	public ModelAndView tradeList(String id, HttpSession session) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		logger.info("id : {}",id);
		session.setAttribute("loginIdtwo", id);
		System.out.println(inter.buyList(id));
		System.out.println(inter.sellList(id));
		mav.addObject("buyList",inter.buyList(id));
		mav.addObject("sellList",inter.sellList(id));
		mav.setViewName("tradeList");
		return mav;
	}
	@Transactional
	public ModelAndView tradeOk(String idx) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		inter.stateOk(idx);
		inter.alam(idx);
		mav.addObject("list",inter.tradeDetail(idx));
		mav.addObject("photo",inter.tradeDetailPhoto(idx));
		mav.addObject("sellerProfile",inter.sellerProfile(idx));
		mav.addObject("buyerProfile",inter.buyerProfile(idx));

		mav.setViewName("tradeOkey");
		return mav;
	}
	@Transactional
	public ModelAndView tradeOkPage(String idx) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",inter.tradeDetail(idx));
		mav.addObject("photo",inter.tradeDetailPhoto(idx));
		mav.addObject("sellerProfile",inter.sellerProfile(idx));
		mav.addObject("buyerProfile",inter.buyerProfile(idx));

		inter.tradeAlam(idx);

		mav.setViewName("tradeOkey");
		return mav;
	}
	@Transactional
	public ModelAndView tradeDel(String idx) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		if(inter.tradePhotoName(idx)!=null){
			int tpsuccess = 0;
			FileUtil futil = new FileUtil();
			ArrayList<String> list = inter.tradePhotoName(idx); 
			for(String newFile : list){
				tpsuccess = futil.tpdel(newFile);
			}
			if(tpsuccess==1){
				inter.tradePhotoDel(idx);
			}
			inter.tradeDel(idx);

		}
		String page = "selectCat";
		mav.setViewName(page);
		return mav;
	}
	@Transactional
	public ModelAndView ingye(String idx,String id) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		inter.ingye(idx);
		inter.alam(idx);
		mav.addObject("list",inter.tradeDetail(idx));
		
		mav.setViewName("redirect:/tradeList?id="+id);
		return mav;
	}
	@Transactional
	public ModelAndView insoo(String idx,String id) {
		inter = sqlSession.getMapper(BoardInterface.class);
		ModelAndView mav = new ModelAndView();
		inter.insoo(idx);
		inter.alam(idx);
		mav.addObject("list",inter.tradeDetail(idx));
		mav.setViewName("redirect:/tradeList?id="+id);
		return mav;
	}
	
	public Map<String, Object> tag(String id,String tagName) {
		Map<String, Object> json = new HashMap<String, Object>();
		inter = sqlSession.getMapper(BoardInterface.class);
		
		ArrayList<String> list = inter.tag(id,tagName);
		if(list.size()>0){
			json.put("tagList", list);
		}else{
			json.put("tagList", list.add("아이디가 없습니다."));
		}
		return json;
	}
	
	//수정 파일 업로드
	public ModelAndView modifyFileUpload(MultipartHttpServletRequest multi) {
		ModelAndView mav = new ModelAndView();
		
		String fileName = multi.getParameter("modifyFileName");
		String newFileName = null;
		
		FileUtil futil = new FileUtil();
		newFileName = futil.upload(multi, fileName);
		
		fileList.put(newFileName, fileName);
		logger.info("저장할 파일 갯수 : {}", fileList.size());
		mav.addObject("path", "resources/upload/"+newFileName);
		mav.setViewName("modifyUploadForm");
		return mav;
	}

	
	// 글 삭제
	@Transactional
	public ModelAndView boardDelete(String idx,String login) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(BoardInterface.class);
		logger.info("삭제할 idx : {}",idx);
		logger.info("이동할 id : {}",login);
		int idx2 =Integer.parseInt(idx);
		FileUtil futil = new FileUtil();
		ArrayList<String> list = inter.newfileRead(idx2);
		for(int i=0; i<list.size();i++){
			System.out.println(list.get(i));
			futil.delete(list.get(i));
		}	
		
		
		inter.boardDelete(idx2);
		mav.addObject("success","삭제 완료");
		mav.setViewName("redirect:/profile?loginId="+login);
		
		return mav;
	}

}
