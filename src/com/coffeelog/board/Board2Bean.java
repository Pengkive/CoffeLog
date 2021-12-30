package com.coffeelog.board;

import java.util.Date;

public class Board2Bean {

	// num, beans_type, sour_taste, bitter_taste, sweet_taste
	// body_taste, id, date, content, place
		
		private int num;

		private String beans_type;
		
		private String sour_taste;
		
		private String bitter_taste;
		
		private String sweet_taste;
		
		private String body_taste;
		
		private Date date;
		
		private String place;
		
		private String content;
		
		private String id;
		
		private String File;
		

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
		 * @return the beans_type
		 */
		public String getBeans_type() {
			return beans_type;
		}

		/**
		 * @param beans_type the beans_type to set
		 */
		public void setBeans_type(String beans_type) {
			this.beans_type = beans_type;
		}

		/**
		 * @return the sour_taste
		 */
		public String getSour_taste() {
			return sour_taste;
		}

		/**
		 * @param sour_taste the sour_taste to set
		 */
		public void setSour_taste(String sour_taste) {
			this.sour_taste = sour_taste;
		}

		/**
		 * @return the bitter_taste
		 */
		public String getBitter_taste() {
			return bitter_taste;
		}

		/**
		 * @param bitter_taste the bitter_taste to set
		 */
		public void setBitter_taste(String bitter_taste) {
			this.bitter_taste = bitter_taste;
		}

		/**
		 * @return the sweet_taste
		 */
		public String getSweet_taste() {
			return sweet_taste;
		}

		/**
		 * @param sweet_taste the sweet_taste to set
		 */
		public void setSweet_taste(String sweet_taste) {
			this.sweet_taste = sweet_taste;
		}

		/**
		 * @return the body_taste
		 */
		public String getBody_taste() {
			return body_taste;
		}

		/**
		 * @param body_taste the body_taste to set
		 */
		public void setBody_taste(String body_taste) {
			this.body_taste = body_taste;
		}


		public Date getDate() {
			return date;
		}

		public void setDate(Date date) {
			this.date = date;
		}

		/**
		 * @return the place
		 */
		public String getPlace() {
			return place;
		}

		/**
		 * @param place the place to set
		 */
		public void setPlace(String place) {
			this.place = place;
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
		 * @return the file
		 */
		public String getFile() {
			return File;
		}

		/**
		 * @param file the file to set
		 */
		public void setFile(String file) {
			File = file;
		}

		/* (non-Javadoc)
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "Board2Bean [num=" + num + ", beans_type=" + beans_type + ", sour_taste=" + sour_taste
					+ ", bitter_taste=" + bitter_taste + ", sweet_taste=" + sweet_taste + ", body_taste=" + body_taste
					+ ", date=" + date + ", place=" + place + ", content=" + content + ", id=" + id + ", File=" + File
					+ "]";
		}

		

}//Board2Bean
