package com.spring.main.beans;

import java.sql.Date;

public class TradeDto {

	private int trade_idx; //거래번호
	private String trade_sell; //판매자
	private String trade_buy; //구매자
	private String trade_content; //거래내용
	private String trade_state; //진행상태
	private String trade_title; //거래제목
	private int trade_price; //금액
	private String trade_start; //기간시작
	private String trade_end; //기간끝
	private String trade_alam; //거래알림
	public int getTrade_idx() {
		return trade_idx;
	}
	public void setTrade_idx(int trade_idx) {
		this.trade_idx = trade_idx;
	}
	public String getTrade_sell() {
		return trade_sell;
	}
	public void setTrade_sell(String trade_sell) {
		this.trade_sell = trade_sell;
	}
	public String getTrade_buy() {
		return trade_buy;
	}
	public void setTrade_buy(String trade_buy) {
		this.trade_buy = trade_buy;
	}
	public String getTrade_content() {
		return trade_content;
	}
	public void setTrade_content(String trade_content) {
		this.trade_content = trade_content;
	}
	public String getTrade_state() {
		return trade_state;
	}
	public void setTrade_state(String trade_state) {
		this.trade_state = trade_state;
	}
	public String getTrade_title() {
		return trade_title;
	}
	public void setTrade_title(String trade_title) {
		this.trade_title = trade_title;
	}
	
	public int getTrade_price() {
		return trade_price;
	}
	public void setTrade_price(int trade_price) {
		this.trade_price = trade_price;
	}

	
	public String getTrade_start() {
		return trade_start;
	}
	public void setTrade_start(String trade_start) {
		this.trade_start = trade_start;
	}
	public String getTrade_end() {
		return trade_end;
	}
	public void setTrade_end(String trade_end) {
		this.trade_end = trade_end;
	}
	public String getTrade_alam() {
		return trade_alam;
	}
	public void setTrade_alam(String trade_alam) {
		this.trade_alam = trade_alam;
	}
		
	
}
