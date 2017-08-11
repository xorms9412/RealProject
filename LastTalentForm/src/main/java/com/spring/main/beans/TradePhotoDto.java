package com.spring.main.beans;

public class TradePhotoDto {

	private int tphoto_idx; //사진번호
	private String oldfile; //옛이름
	private String newfile; //새이름
	private int trade_idx; //게시글 번호
	
	
	public int getTphoto_idx() {
		return tphoto_idx;
	}
	public void setTphoto_idx(int tphoto_idx) {
		this.tphoto_idx = tphoto_idx;
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
	public int getBoard_idx() {
		return trade_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.trade_idx = trade_idx;
	}

	
}
