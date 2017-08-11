package com.spring.main.beans;

import java.sql.Date;

public class BoardBean {
	private int board_idx;
	private String board_cat;
	private String board_content;
	private int board_likeNum;
	private String writer;
	private String board_sell;
	private String oldfile;
	private String newfile;
	private int bphoto_idx;
	private String board_tag;
	
	public String getBoard_tag() {
		return board_tag;
	}
	public void setBoard_tag(String board_tag) {
		this.board_tag = board_tag;
	}
	
	public String getOldfile() {
		return oldfile;
	}
	public void setOldfile(String oldfile) {
		this.oldfile = oldfile;
	}
	public String getNewfile() {
		return newfile;
	}
	public void setNewfile(String newfile) {
		this.newfile = newfile;
	}
	public int getBphoto_idx() {
		return bphoto_idx;
	}
	public void setBphoto_idx(int bphoto_idx) {
		this.bphoto_idx = bphoto_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_cat() {
		return board_cat;
	}
	public void setBoard_cat(String board_cat) {
		this.board_cat = board_cat;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_likeNum() {
		return board_likeNum;
	}
	public void setBoard_likeNum(int board_likeNum) {
		this.board_likeNum = board_likeNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBoard_sell() {
		return board_sell;
	}
	public void setBoard_sell(String board_sell) {
		this.board_sell = board_sell;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	private Date reg_date;
}
