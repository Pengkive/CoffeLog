package com.coffeelog.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.fabric.xmlrpc.base.Member;

public class memberDAO {

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
	}// Close DB

	// idCheck(id)
	public int idCheck(String id) {
		int result = 0;
		try {

		     if(id.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")){
	             return result = -2;
	          }

	          if(id.matches(".*[ !@#$%^&*(),.?\":{}|<>]+.*")){
	             return result = -1;
	          }   
			
			conn = getConnection();
			
			sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1; // 회원이 있음 -> 해당아이디 X
			} else {
				result = 0; // 회원이 없음 -> 해당아이디 O
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}
	// idCheck(id)

	public void insertSign(memberBean mb) {

		try {
			conn = getConnection();

			sql = "insert into member values(?,?,?,?,?,?,?,now())";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPassword());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getGender());
			pstmt.setString(5, mb.getEmail());
			pstmt.setString(6, mb.getPhone());
			pstmt.setString(7, mb.getAddress());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}// 회원가입

	//로그인 체크
	public int login(memberBean mb) {

		int result = 0;

		try {
			conn = getConnection();

			sql = "select password from member where id=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mb.getId());

			rs = pstmt.executeQuery();

			if (rs.next()) { // sql 구문의 결과가 있을때
				// 회원이다.
				// 비밀번호를 사용해서 본인확인
				// 1= 회원, 0 = 회원은 맞으나 비번X, -1=비회원
				if (mb.getPassword().equals(rs.getString("password"))) {
					// 비밀번호 같다.(+ 회원이다) => 본인 => 로그인성공
					result = 1;
				}
			} else {
				result = -1;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;

	}// 로그인 체크 끝

	//모든 회원정보 불러오기
	public void AllMemberInfo(memberBean mb) {

		try {
			conn = getConnection();

			sql = "select * from member desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			
			   if(rs.getString("id").equals("admin")){
			   		
				   mb = new memberBean();
				   
				   mb.setId(rs.getString("id"));
				   mb.setName(rs.getString("name"));
				   mb.setGender(rs.getString("gender"));
				   mb.setEmail(rs.getString("email"));
				   mb.setPhone(rs.getString("phone"));
				   mb.setAddress(rs.getString("address"));
				  // mb.date
   
				   continue;
			   }  
				   
			   }
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			closeDB();
		}

	}

	//회원정보 보기
	public int MemberInfo(memberBean mb) {
		int infock = 0; // 비밀번호가 일치하지 않을 경우
		try {
			conn = getConnection();

			sql = "select password from member where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getId());

			rs = pstmt.executeQuery();
			// 데이터처리
			if (rs.next()) {
				if (mb.getPassword().equals(rs.getString("password"))) {
					infock = 1; // 비밀번호 일치할경우
				}
			} else {
				infock = -1; // 아이디가 없을 경우
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDB();
		}

		// 회원 정보 불러오기
		return infock;
	}//

	// Update페이지에 DB 정보 가져오기
	public void MemberUpdate(memberBean mb, String id) {
		try {
			conn = getConnection();
			sql = "select name,gender,email,phone,address from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				mb.setName(rs.getString("name"));
				mb.setGender(rs.getString("gender"));
				mb.setEmail(rs.getString("email"));
				mb.setPhone(rs.getString("phone"));
				mb.setAddress(rs.getString("address"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

	public void MemberUpdatePro(memberBean mb) {

		try {
			conn = getConnection();

			sql = "update member set password =?,gender=?,email=?,phone=?,address=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getPassword());
			pstmt.setString(2, mb.getGender());
			pstmt.setString(3, mb.getEmail());
			pstmt.setString(4, mb.getPhone());
			pstmt.setString(5, mb.getAddress());
			pstmt.setString(6, mb.getId());

			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDB();
		}

	}// 정보 update하기

	public void MemberDelete(String id) {
		try {
			conn = getConnection();
			sql = "delete from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

	}// 회원 탈퇴하기

}// memberDAO
