package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.beans.MemberDto;
import com.spring.main.beans.ProfileDTO;
import com.spring.main.beans.TradeDto;
import com.spring.main.beans.TradePhotoDto;
import com.spring.main.beans.ReplyBean;
import com.spring.main.beans.BoardBean;
import com.spring.main.beans.BphotoDTO;
import com.spring.main.beans.FollowListBean;
import com.spring.main.beans.MemberBean;

public interface BoardInterface {

	//중복 체크
	String overlay(String id);
	
	//회원가입
	int join(MemberDto bean);

	//로그인(암호화)
	String securityLogin(String id);

	String findid(String name, String email, String birth);

	String findpw(String id, String name, String email, String birth);

	void changepw(String pass, String id);

	MemberBean profileInfo(String id);

	int write(BoardBean bean);

	void writeFile(String string, String key, int board_idx);

	ArrayList<BphotoDTO> timeline(String id);

	void writebuyFile(String trade_newphoto,String trade_oldphoto, int trade_idx);

	int buy(TradeDto tdto);

	ArrayList<BphotoDTO> review(String id);

	int reviewwrite(BoardBean bean);
	//알람
	ArrayList<TradeDto> alamCheck(String sessionId);

	TradeDto tradeDetail(String idx);

	//1개 일 때
	ArrayList<BoardBean> mainlist0(String cat0);
	//2개 일 때
	ArrayList<BoardBean> mainlist1(String cat0, String cat1);
	//3개 일 때
	ArrayList<BoardBean> mainlist2(String cat0, String cat1, String cat2);
	//4개 일 때
	ArrayList<BoardBean> mainlist3(String cat0, String cat1, String cat2, String cat3);
	//5개 일 때
	ArrayList<BoardBean> mainlist4(String cat0, String cat1, String cat2, String cat3, String cat4);

	int modify(BoardBean bean);

	void modifyFileDelete(String fileName);


	BoardBean content(String idx);

	ArrayList<BoardBean> photoList(String idx);

	ArrayList<ReplyBean> replyList(int idx);

	int repleRegist(String replyer, String reple, String idx);

	int repleDel(int repleIdx);

	int like(int idx, String user);

	String likecheck(int idx, String user);

	int likecancel(int idx, String user);

	void likeminus(int idx);

	void likeplus(int idx);

	String likenum(int idx);

	//류
	//프로필 페이지 이동
	MemberBean profile(String id);

	//프로필 수정
	void profileModify(String intro, String newfile, String oldfile, String user_name, String user_email, String user_phone, String gender, String birth, String address, String user_id);

	//비밀번호 변경시 필요한 암호화된 비밀번호 가져오기
	String securityPw(String id);

	//비밀번호 변경
	int pwModify(String pass, String id);

	//프로필 게시글 가져오기
	ArrayList<BphotoDTO> profileList(String id);
		
		
	ArrayList<BoardBean> photos0(String cat0);

	ArrayList<BoardBean> photos4(String cat0, String cat1, String cat2, String cat3, String cat4);

	ArrayList<BoardBean> photos3(String cat0, String cat1, String cat2, String cat3);

	ArrayList<BoardBean> photos1(String cat0, String cat1);

	ArrayList<BoardBean> photos2(String cat0, String cat1, String cat2);

	void tradeAlam(String idx);
	
	ArrayList<TradeDto> buyList(String id);

	ArrayList<TradeDto> sellList(String id);

	void stateOk(String idx);

	void tradeDel(String idx);

	ArrayList<String> tradePhotoName(String idx);

	void tradePhotoDel(String idx);

	void ingye(String idx);

	void insoo(String idx);

	//인계했을시
	ArrayList<TradeDto> alamChecktwo(String sessionId);

	//거래종료시
	ArrayList<TradeDto> alamCheckthree(String sessionId);
	
	//거래수락시
	ArrayList<TradeDto> alamCheckfour(String sessionId);

	ArrayList<TradePhotoDto> tradeDetailPhoto(String idx);

	void alam(String idx);

	String findidx(String newFile);
	
	//팔로우 했는지 확인
	ArrayList<String> followCheck(String loginId);
	
	//팔로우 하기
	void follow(String loginId, String id);

	//팔로우 수 늘리기
	void followUp(String loginId);

	//팔로워 수 늘리기
	void followerUp(String id);

	//언팔로우 하기
	void unFollow(String loginId, String id);

	//팔로우 수 줄이기
	void followDown(String loginId);

	//팔로워 수 줄이기
	void followerDown(String id);
		
	//팔로우 가져오기
	ArrayList<String> getFollow(String follower);

	//팔로우 리스트 가져오기
	ArrayList<FollowListBean> followList(String follower);

	//팔로워 리스트 가져오기
	ArrayList<FollowListBean> followerList(String follow);

	ArrayList<String> tag(String id, String tagName);

	ProfileDTO sellerProfile(String idx);
	
	ProfileDTO buyerProfile(String idx);

	void boardDelete(int idx2);

	ArrayList<String> newfileRead(int idx2);
}
