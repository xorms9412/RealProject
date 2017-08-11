package com.spring.main.beans;

public class ReplyBean {
	private int reple_idx;
	private String reple_content;
	private String replyer;
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public int getReple_idx() {
		return reple_idx;
	}
	public void setReple_idx(int reple_idx) {
		this.reple_idx = reple_idx;
	}
	public String getReple_content() {
		return reple_content;
	}
	public void setReple_content(String reple_content) {
		this.reple_content = reple_content;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	private int board_idx;
}
