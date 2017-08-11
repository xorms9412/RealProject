package com.spring.main.beans;

public class BphotoDTO {
	private String bphoto_idx;
	private String oldFile;
	private String newFile;
	private String board_idx;
	public String getBphoto_idx() {
		return bphoto_idx;
	}
	public void setBphoto_idx(String bphoto_idx) {
		this.bphoto_idx = bphoto_idx;
	}

	public String getOldFile() {
		return oldFile;
	}
	public void setOldFile(String oldFile) {
		this.oldFile = oldFile;
	}
	public String getNewFile() {
		return newFile;
	}
	public void setNewFile(String newFile) {
		this.newFile = newFile;
	}
	public String getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}
}
