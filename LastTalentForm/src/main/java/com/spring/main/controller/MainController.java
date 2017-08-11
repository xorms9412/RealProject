package com.spring.main.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.beans.BphotoDTO;
import com.spring.main.service.HiService;


@Controller
public class MainController {
	
	@Autowired HiService service;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/")
	public String home() {
		
		return "mainPage";
	}
	@RequestMapping(value = "/loginPage")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value = "/yakgwan")
	public String yakgwan() {
		
		return "yakgwan";
	}
	
	@RequestMapping(value = "/joinForm")
	public String joinForm() {
		
		return "joinForm";
	}
	@RequestMapping(value = "/tradeDetail")
	public ModelAndView tradeDetail(
			@RequestParam("idx") String idx) {
		logger.info("거래글 상세보기로 이동");	
		return service.tradeDetail(idx);
	}

	@RequestMapping(value = "/login")
	public ModelAndView login(
			@RequestParam Map<String,Object> params,
			HttpSession  session) {
		logger.info("로그인");	
		params.put("session", session);		
		return service.login(params);
	}	
	
	@RequestMapping(value = "/timeline")
	public ModelAndView timeline(
			@RequestParam("id") String id) {
		logger.info("개인 담벼락으로 이동");	
		logger.info("id : {}",id);
		return service.timeline(id);
	}
	@RequestMapping(value = "/writeForm")
	public String writeForm() {
		logger.info("셀렉트 페이지 이동");		
		return "main";
	}
	//파일 업로드 폼 이동
	@RequestMapping(value = "/uploadForm")
	public String uploadForm() {
		logger.info("파일 업로드 페이지 이동");		
		return "uploadForm";
	}
	
	//수정 파일 업로드 폼 이동
	@RequestMapping(value = "/modifyUploadForm")
	public String modifyUploadForm() {
		logger.info("수정 파일 업로드 페이지 이동");		
		return "modifyUploadForm";
	}
	
	//파일 업로드
	@RequestMapping(value="/fileUpload")
	public ModelAndView fileUpload(MultipartHttpServletRequest multi){
		logger.info("파일 업로드 요청");
		return service.fileUpload(multi);		
	}
	
	//수정 파일 업로드
	@RequestMapping(value="/modifyFileUpload")
	public ModelAndView modifyFileUpload(MultipartHttpServletRequest multi){
		logger.info("수정 파일 업로드 요청");
		return service.modifyFileUpload(multi);
	}
			
	//글쓰기
	@RequestMapping(value="/write")
	public ModelAndView write(@RequestParam Map<String, String> params){
		logger.info("글쓰기 요청");
		return service.write(params);		
	}
	//글수정
	@RequestMapping(value="/modify")
	public ModelAndView modify(@RequestParam Map<String, String> params){
		logger.info("수정하기 요청");
		return service.modify(params);		
	}
	
	//셀렉트 페이지 이동하기
	@RequestMapping(value = "/selectCat")
	public String selectCat() {
		logger.info("셀렉트 페이지 이동");		
		return "selectCat";
	}
	@RequestMapping(value = "/buyWrite")
	public ModelAndView buyWrite(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		logger.info("id : {}",id);
		String seller = id;
		mav.addObject("seller", seller);
		mav.setViewName("buyWrite");
		return mav;
	}
				
	@RequestMapping(value="/buy")
	public ModelAndView buy(@RequestParam Map<String, String> params){
		logger.info("구매 글 쓰기 요청");
		return service.buy(params);		
	}
	@RequestMapping(value = "/review")
	public ModelAndView review(
			@RequestParam("id") String id) {
		logger.info("구매 후기 게시판으로 이동");	
		return service.review(id);
	}
	@RequestMapping(value="/reviewwrite")
	public ModelAndView reviewwrite(@RequestParam Map<String, String> params){
		logger.info("구매 후기 쓰기 요청");
		return service.reviewwrite(params);		
	}
	//카테고리 선택 후 보여지기 기능
	@RequestMapping(value = "/mainlist")
	public ModelAndView mianlist(@RequestParam Map<String, String> params) {
		logger.info("카테고리 선택");		
		return service.mainlist(params);
	}
	
	
	//프로필 페이지 이동
	@RequestMapping(value = "/profile")
	public ModelAndView profile(@RequestParam("loginId") String id ) {
		logger.info("프로필 페이지 이동 : "+id);
		return service.profile(id);
	}
		
	//프로필 사진 수정(아작스)
	@RequestMapping(value = "/profilePhoto")
	public @ResponseBody Map<String, String> profilePhotos(MultipartHttpServletRequest multi) {
		logger.info("프로필 사진 수정");
		return service.profilePhoto(multi);
	}
	
	//프로필 수정
	@RequestMapping(value = "/profileModify")
	public ModelAndView profileModify(
			@RequestParam Map<String, String> params) {
		logger.info("프로필 수정");
		return service.profileModify(params);
	}
	
	//프로필 사진 삭제(아작스)
	@RequestMapping(value = "/delfile")
	public @ResponseBody Map<String, Integer> delfile(@RequestParam("delfile") String delfile) {
		logger.info("프로필 사진 삭제");
		return service.delfile(delfile);
	}
	
	//비밀번호 변경(아작스)
	@RequestMapping(value = "/pwModify")
	public @ResponseBody Map<String, Integer> pwModify(
			@RequestParam("newPw") String newPw, 
			@RequestParam("beforePw") String beforePw,
			@RequestParam("id") String id) {
		logger.info("비밀번호 변경 newPw : "+newPw+", beforePw : "+beforePw+", id : "+id);
		return service.pwModify(newPw, beforePw, id);
	}
			
	//프로필 게시글 가져오기(아작스)
	@RequestMapping(value = "/profileList")
	public @ResponseBody Map<String, ArrayList<BphotoDTO>> profileList(
			@RequestParam("id") String id) {
		logger.info("프로필 게시글 가져오기 id : "+id);
		return service.profileList(id);
	}
	
	//팔로우
	@RequestMapping(value = "/follow")
	public ModelAndView follow(@RequestParam("id") String id, HttpSession session) {
		logger.info("팔로우하기 id : "+id);
		return service.follow(id, session);
	}
	
	@RequestMapping(value = "/tradeList")
	public ModelAndView tradeList(
			@RequestParam("id") String id,HttpSession session) {
		logger.info("거래 현황 게시판으로 이동");	
		return service.tradeList(id,session);
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginIdtwo");
			return "login";
		
	}
	@RequestMapping(value = "/tradeOk")
	public ModelAndView tradeOk(
			@RequestParam("idx") String idx) {
		logger.info("거래 수락");	
		return service.tradeOk(idx);
	}
	@RequestMapping(value = "/tradeOkPage")
	public ModelAndView tradeOkPage(
			@RequestParam("idx") String idx) {
		logger.info("거래중인 게시글 보기");	
		return service.tradeOkPage(idx);
	}
	@RequestMapping(value = "/tradeDel")
	public ModelAndView tradeModify(
			@RequestParam("idx") String idx) {
		logger.info("거래 취소");	
		return service.tradeDel(idx);
	}
	@RequestMapping(value = "/ingye")
	public ModelAndView ingye(
			@RequestParam("idx") String idx,@RequestParam("id") String id) {
		logger.info("인계 하기");	
		return service.ingye(idx,id);
	}
	
	@RequestMapping(value = "/insoo")
	public ModelAndView insoo(
			@RequestParam("idx") String idx,@RequestParam("id") String id) {
		logger.info("인수 하기");	
		return service.insoo(idx,id);
	}
	@RequestMapping(value = "/boardDelete")
	public ModelAndView boardDelete(
			@RequestParam("idx") String idx,
			@RequestParam("login") String login){
		logger.info("게시물 삭제하기");	
		return service.boardDelete(idx,login);
	}
}
