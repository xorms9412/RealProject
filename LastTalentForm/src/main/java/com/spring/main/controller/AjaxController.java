package com.spring.main.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.beans.FollowListBean;
import com.spring.main.beans.ReplyBean;
import com.spring.main.beans.TradeDto;
import com.spring.main.service.HiService;



@Controller("AjaxController")
@RequestMapping(value="/rest")
public class AjaxController {
	
	@Autowired HiService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//중복체크
	@RequestMapping(value="/overlay")
	public @ResponseBody Map<String, String> overlay(
			@RequestParam("id") String id){
			logger.info("id : {}",id);
		return service.overlay(id);
	}
	
	//회원가입(암호화)
	@RequestMapping(value="/join")
	public @ResponseBody Map<String, Integer> join(
			@RequestParam Map<String, String> params){
			logger.info("회원가입 요청");
		return service.join(params);
	}
	
	@RequestMapping(value="/findid")
	public @ResponseBody Map<String, String> findid(
			@RequestParam Map<String, String> params){
			logger.info("id찾기 요청");
		return service.findid(params);
	}
	
	@RequestMapping(value="/findpw")
	public @ResponseBody Map<String, Object> findpw(
			@RequestParam Map<String, String> params) throws Exception, URISyntaxException{
			logger.info("pw찾기 요청");
		return service.findpw(params);
	}
	//파일 삭제
	@RequestMapping(value="/fileDelete")
	public @ResponseBody Map<String, String> delete(){
		logger.info("파일 삭제");
		return service.del();
	}
	//알람
	@RequestMapping(value="/alamOn")
	public @ResponseBody Map<String, ArrayList<TradeDto>> alamOn(
			@RequestParam ("sessionid") String sessionId){
		logger.info("알람컨트롤러");
		return service.alamOn(sessionId);
	}
		
	//상세 보기
	@RequestMapping(value="/detail")
	public @ResponseBody Map<String, Object> detail(
			@RequestParam("idx") String idx){
		logger.info("상세보기");
		logger.info("보여줄 idx :{} ",idx);
		return service.detail(idx);
	}
			
	//댓글 리스트
	@RequestMapping(value="/repleList")
	public @ResponseBody Map<String, ArrayList<ReplyBean>> repleList(
			@RequestParam("idx") int idx){		
			logger.info("댓글 리스트 보여주기");
		return service.repleList(idx);
	}
	
	//댓글 등록
	@RequestMapping(value="/repleRegist")
	public @ResponseBody Map<String, Integer> repleRegist(
			@RequestParam Map<String,String> params){		
			logger.info("댓글 등록");
		return service.repleRegist(params);
	}		
	
	//댓글 삭제
	@RequestMapping(value="/repleDel")
	public @ResponseBody Map<String, Integer> repleDel(
			@RequestParam("idx") int idx,
			@RequestParam("repleIdx") int repleIdx
			){		
			logger.info("댓글 삭제");
		return service.repleDel(repleIdx, idx);
	}	


	//좋아요
	
	@RequestMapping(value="/like")
	public @ResponseBody Map<String, Integer> like(
			@RequestParam("idx") int idx,
			@RequestParam("user") String user
			){		
			logger.info("좋아요");
		return service.like(idx,user);
	}	

	//좋아요 갯수
	@RequestMapping(value="/likenum")
	public @ResponseBody Map<String, String> likenum(
			@RequestParam("idx") int idx
			){		
			logger.info("좋아요 갯수 ");
		return service.likenum(idx);
	}	
	@RequestMapping(value="/modifyNotDel")
	public @ResponseBody Map<String, String> modifyNotDel(){
		logger.info("수정 파일 삭제 리스트 비우기");
		return service.modifyNotDel();
	}
	
	@RequestMapping(value="/modifyDel")
	public @ResponseBody Map<String, String> modifyDel(){
		logger.info("수정 파일 삭제 ");
		return service.modifyDel();
	}
	
	//수정 하기 전 임시 삭제
	@RequestMapping(value="/fileDelList")
	public @ResponseBody Map<String, Integer> fileDelList(
			@RequestParam("fileName") String fileName){
		logger.info("파일 삭제");
		return service.fileDelList(fileName);
	}
	//파일 삭제
	@RequestMapping(value="/uploadFileDelete")
	public @ResponseBody Map<String, Integer> uploadFileDelete(
			@RequestParam("fileName") String fileName){		
			logger.info("사진 삭제");
		return service.uploadFileDelete(fileName);
	}	

	//팔로우 가져오기
	@RequestMapping(value="/getFollow")
	public @ResponseBody Map<String, Integer> getFollow(
			@RequestParam Map<String, String> params){		
			logger.info("팔로우 가져오기");
		return service.getFollow(params);
	}
	
	//팔로우 리스트 가져오기
	@RequestMapping(value="/followList")
	public @ResponseBody Map<String, ArrayList<FollowListBean>> followList(
			@RequestParam("follower") String follower){
			logger.info("팔로우 리스트 가져오기");
		return service.followList(follower);
	}
	
	//팔로워 리스트 가져오기
	@RequestMapping(value="/followerList")
	public @ResponseBody Map<String, ArrayList<FollowListBean>> followerList(
			@RequestParam("follow") String follow){
			logger.info("팔로워 리스트 가져오기");
		return service.followerList(follow);
	}
	
	//태그
	@RequestMapping(value="/tag")
	public @ResponseBody Map<String, Object> tag(
			@RequestParam("tagName") String tagName,
			@RequestParam("id") String id
			){		
			
			logger.info("태그 요청 ");
			logger.info("태그요청자 :{}",id);
			logger.info("태그할 사람 : {}",tagName);
		return service.tag(id,tagName);
	}	

		
	
}
	