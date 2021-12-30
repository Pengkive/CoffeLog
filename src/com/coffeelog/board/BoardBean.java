package com.coffeelog.board;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardBean {

	//num(int), subject, content, id, date, readcount
	
	private int num;
	
	private String subject;
	
	private String content;
	
	private String id;
	
	private int readcount;
	
	private Timestamp reg_date;

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
	public Timestamp getReg_date() {
		return reg_date;
	}

	/**
	 * @param reg_date the reg_date to set
	 */
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "BoardBean [num=" + num + ", subject=" + subject + ", content=" + content + ", id=" + id + ", readcount="
				+ readcount + ", reg_date=" + reg_date + "]";
	}
	
	
	
	

}//BoardBean.java
