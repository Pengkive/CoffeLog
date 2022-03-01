package com.coffeelog.board;

import java.sql.Date;

public class CommentBean {

		private int num;	//댓글 번호
		private String c_content;	//댓글 내용
		private Date c_date;	//댓글 작성일
		private String c_id;	//댓글 작성자
		private int info_b_num;	//게시글 번호
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
		 * @return the c_content
		 */
		public String getC_content() {
			return c_content;
		}
		/**
		 * @param c_content the c_content to set
		 */
		public void setC_content(String c_content) {
			this.c_content = c_content;
		}
		/**
		 * @return the c_date
		 */
		public Date getC_date() {
			return c_date;
		}
		/**
		 * @param c_date the c_date to set
		 */
		public void setC_date(Date c_date) {
			this.c_date = c_date;
		}
		/**
		 * @return the c_id
		 */
		public String getC_id() {
			return c_id;
		}
		/**
		 * @param c_id the c_id to set
		 */
		public void setC_id(String c_id) {
			this.c_id = c_id;
		}
		/**
		 * @return the info_b_num
		 */
		public int getInfo_b_num() {
			return info_b_num;
		}
		/**
		 * @param info_b_num the info_b_num to set
		 */
		public void setInfo_b_num(int info_b_num) {
			this.info_b_num = info_b_num;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		
		@Override
		public String toString() {
			return "CommentBean [num=" + num + ", c_content=" + c_content + ", c_date=" + c_date + ", c_id=" + c_id
					+ ", info_b_num=" + info_b_num + "]";
		}
		
		
}
		
	