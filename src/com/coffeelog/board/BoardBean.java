package com.coffeelog.board;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardBean {

	//num(int), subject, content, id, readcount, re_regdate, re_ref, re_lev, re_seq
	
	private int num;
	
	private String subject;
	
	private String content;
	
	private String id;
	
	private int readcount;
	
	private Date reg_date;
	
	private int re_ref;
	
	private int re_lev;
	
	private int re_seq;

	/**
	 * @return the num
	 */
	public int getNum() {
		return num;
	}

	/**
	 * @param num the num to set
	 */
	public void setNum(int num) {
		this.num = num;
	}

	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the readcount
	 */
	public int getReadcount() {
		return readcount;
	}

	/**
	 * @param readcount the readcount to set
	 */
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	/**
	 * @return the reg_date
	 */
	public Date getReg_date() {
		return reg_date;
	}

	/**
	 * @param reg_date the reg_date to set
	 */
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	/**
	 * @return the re_ref
	 */
	public int getRe_ref() {
		return re_ref;
	}

	/**
	 * @param re_ref the re_ref to set
	 */
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}

	/**
	 * @return the re_lev
	 */
	public int getRe_lev() {
		return re_lev;
	}

	/**
	 * @param re_lev the re_lev to set
	 */
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	/**
	 * @return the re_seq
	 */
	public int getRe_seq() {
		return re_seq;
	}

	/**
	 * @param re_seq the re_seq to set
	 */
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "BoardBean [num=" + num + ", subject=" + subject + ", content=" + content + ", id=" + id + ", readcount="
				+ readcount + ", reg_date=" + reg_date + ", re_ref=" + re_ref + ", re_lev=" + re_lev + ", re_seq="
				+ re_seq + "]";
	}

	

}//BoardBean.java
