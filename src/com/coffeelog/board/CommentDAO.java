package com.coffeelog.board;

import java.io.Console;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		
		int num = 0;
	
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {

				num = rs.getInt(1) + 1;
				
				sql = "insert into comment values(?,?,now(),?,?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, num); //c_num
				pstmt.setString(2, cb.getContent());	// comment_content
				pstmt.setString(3, cb.getId());		// comment_id
				pstmt.setString(4, cb.getInfo_b_num());	// info_board_num
				
				pstmt.executeUpdate();
				
				System.out.println("@@@@@@@ 댓글 저장 성공 @@@@@@@");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}//commentWrite(cb) 끝
	
	
}
