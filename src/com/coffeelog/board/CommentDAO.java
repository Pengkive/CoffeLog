package com.coffeelog.board;

import java.io.Console;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CommentDAO {

	//DB연결
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	private Connection getConnection() {

		try {
			// Context 객체를 생성 (프로젝트 정보를 가지고있는객체)
			Context initCTX = new InitialContext();

			// DB연동 정보를 불러오기(context.xml)
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");

			conn = ds.getConnection();

			System.out.println(" 드라이버 로드, 디비연결 성공! ");
			System.out.println(conn);

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}
	// getConnection() - 디비연결 끝

	// 자원해제코드 - finally 구문에서 사용
	public void closeDB() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// DB연결


	//commentWrite(cb) 시작
	public void commentWrite(CommentBean cb){
		
		int c_num = 0;
	
		try {
			conn = getConnection();
			sql = "select max(c_num) from comment";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {

				c_num = rs.getInt(1) + 1;
				
				sql = "insert into comment values(?,?,now(),?,?)";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, c_num); //comment_number
				pstmt.setString(2, cb.getC_content());	// comment_content
				pstmt.setString(3, cb.getC_id());	
				pstmt.setInt(4, cb.getInfo_b_num());	
				
				pstmt.executeUpdate();
				
				System.out.println("@@@@@@@ 댓글 저장 성공 @@@@@@@");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}//commentWrite(cb) 끝
	
	
	//commentList()
	@SuppressWarnings("unchecked")
	public ArrayList<CommentBean> commentList() {

		ArrayList commentListAll = new ArrayList();

		CommentBean cb = null;

		try {

			conn = getConnection();

			sql = "select * from comment";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				cb = new CommentBean();

				cb.setNum(rs.getInt("num"));
				cb.setC_content(rs.getString("c_content"));
				cb.setC_date(rs.getDate("c_date"));
				cb.setC_id(rs.getString("c_id"));
				cb.setInfo_b_num(rs.getInt("info_b_num"));

				commentListAll.add(cb);

			} // while 끝

			System.out.println(" 댓글 모든정보 저장완료! ");
			System.out.println(" 총 " + commentListAll.size() + "개");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return commentListAll;
	}// commentList()
	
	
}
