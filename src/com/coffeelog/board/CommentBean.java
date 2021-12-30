package com.coffeelog.board;

import java.sql.Date;

public class CommentBean {

		private int num;	//댓글 번호
		private String content;	//댓글 내용
		private Date re_date;	//댓글 작성일
		private String id;	//댓글 작성자
		private String info_b_num;	//게시판 글 번호
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
		 * @return the re_date
		 */
		public Date getRe_date() {
			return re_date;
		}
		/**
		 * @param re_date the re_date to set
		 */
		public void setRe_date(Date re_date) {
			this.re_date = re_date;
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
		 * @return the info_b_num
		 */
		public String getInfo_b_num() {
			return info_b_num;
		}
		/**
		 * @param info_b_num the info_b_num to set
		 */
		public void setInfo_b_num(String info_b_num) {
			this.info_b_num = info_b_num;
		}
		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "CommentBean [num=" + num + ", content=" + content + ", re_date=" + re_date + ", id=" + id
					+ ", info_b_num=" + info_b_num + "]";
		}
		
		
	
}
