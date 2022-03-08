package com.coffeelog.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDAO {

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
	}
	// Close DB 끝

	// @@@@ board1 @@@@
	// insertWrite()
	public void insertWrite(BoardBean bb) {

		int num = 0;

		try {

			conn = getConnection();

			sql = "select max(num) from info_board";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				num = rs.getInt(1) + 1;
			}

			System.out.println(" 글번호  : " + num);

			sql = "insert into info_board values(?,?,?,?,?,now(),?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getSubject());
			pstmt.setString(3, bb.getContent());
			pstmt.setString(4, bb.getId());
			pstmt.setInt(5, bb.getReadcount());
			pstmt.setInt(6,num); //re_ref에 글번호 num 저장
			pstmt.setInt(7, bb.getRe_lev());
			pstmt.setInt(8, bb.getRe_seq());
			pstmt.executeUpdate();
			
			System.out.println("글쓰기 (insertWrite) 완료");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}// insertWrite()

	// getBoardCount() 
	// 디비에 들어있는 글의 개수 계산후 리턴
	public int getBoardCount() {

		int cnt = 0;

		try {
			// 1,2 드라이버로드, 디비연결
			conn = getConnection();

			// 3 sql 작성(select) & pstmt 객체 생성
			sql = "select count(*) from info_board";
			pstmt = conn.prepareStatement(sql);

			// 4 sql 실행
			rs = pstmt.executeQuery();

			// 5 데이터 처리
			if (rs.next()) {
				cnt = rs.getInt(1);// "count(*)"
			}

			System.out.println("글 목록 (getBoard) SQL 구문 실행완료!");
			System.out.println(" 글 개수 : " + cnt + "개");

		} catch (Exception e) {
			System.out.println(" 게시판 글개수_에러 발생!! ");
			e.printStackTrace();
		} finally {
			// 자원해제
			closeDB();
		}

		return cnt;
	}// getBoardCount()
	
	// getBoardList() 
	public ArrayList getBoardList() {

		//게시판의 글 정보를 모두 저장하는 가변길이 배열
		ArrayList boardListAll = new ArrayList();

		//게시판 글 1개의 정보 저장하는 객체
		BoardBean bb = null;

		try {

			conn = getConnection();

			sql = "select * from info_board";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				//데이터 있을때 bb 객체 생성
				bb = new BoardBean();

				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReg_date((rs.getDate("reg_date")));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setId(rs.getString("id"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
				//Bean - > ArrayList 한칸에 저장
				boardListAll.add(bb);

			} // while 끝

			System.out.println(" 게시판 모든 정보 저장완료! ");
			System.out.println(" 총 " + boardListAll.size() + "개");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return boardListAll;
	}// getBoardList()

	// getBoardList(startRow,pageSize) 페이징
	
	public ArrayList getBoardList(int startRow, int pageSize) {
		// DB데이터 1row 정보를 BoardBean 저장 -> ArrayList 한칸에 저장

		// 게시판의 글정보를 원하는만큼 저장하는 가변길이 배열
		ArrayList boardList = new ArrayList();

		// 게시판 글 1개의 정보를 저장하는 객체
		BoardBean bb = null;

		try {
			conn = getConnection();
			// - limit a,b (a 시작행-1,b 개수)
			// ex) 1번글 -> 0번 인덱스

			sql = "select * from info_board "
					+ "order by re_ref desc, re_seq asc "
					+ "limit ?,?";

			pstmt = conn.prepareStatement(sql);

			// ?
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReg_date((rs.getDate("reg_date")));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setId(rs.getString("id"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));

				// Bean -> ArrayList 한칸에 저장
				boardList.add(bb);

			} // while 끝

			System.out.println(" 게시판 모든 정보 저장완료! ");
			System.out.println(" 총 " + boardList.size() + "개");

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDB();
		}

		return boardList;
	}// getBoardList(startRow,pageSize)

	// updateReadcount(num)
	public void updateReadcount(int num) {

		try {
			// 1,2 디비연결
			conn = getConnection();

			// 3 sql 구문 작성(update) & pstmt 객체
			sql = "update info_board set readcount=readcount+1 where num=?";

			pstmt = conn.prepareStatement(sql);

			// ?
			pstmt.setInt(1, num);

			// 4 sql 실행
			pstmt.executeUpdate();

			System.out.println(" 글 조회수 증가 완료! ");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// updateReadcount(num)

	// getBoard(num)
	public BoardBean getBoard(int num) {
		BoardBean bb = null;
		try {

			conn = getConnection();
			// 3 sql 작성(select) & pstmt 객체
			sql = "select * from info_board where num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			// 4 sql 실행
			rs = pstmt.executeQuery();

			// 5 데이터 처리 (bean 저장)
			if (rs.next()) {
				bb = new BoardBean();

				bb.setNum(rs.getInt("num"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReg_date((rs.getDate("reg_date")));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setId(rs.getString("id"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
			}

			System.out.println(" 글번호에 해당하는 글정보 저장완료! ");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return bb;
	} // getBoard(num)

	// updateWrite()
	public void updateWrite(BoardBean bb) {

		try {
			conn = getConnection();
			sql = "update info_board set subject=?,content=? where num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bb.getSubject());
			pstmt.setString(2, bb.getContent());
			pstmt.setInt(3, bb.getNum());
			pstmt.executeUpdate();

			System.out.println(" 글 수정 완료! ");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}// updateWrite()

	// WriteDelete
	public void WriteDelete(int num) {
		try {
			conn = getConnection();
			sql = "delete from info_board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			System.out.println("글삭제 WriteDelete 완료");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	//reInsertWrite(bb)
	public void reInsertWrite(BoardBean bb){
		
		int num = 0;
		
		try {
			conn = getConnection();
			
			//답글 번호 저장하기
			sql="select max(num) from info_board";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1)+1;
			}
			
			System.out.println("답글 번호 계산 완료 : " + num);
			
			//답글 재배치
			sql="update info_board set re_seq = re_seq+1 where re_ref=? and re_seq>?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			pstmt.executeUpdate();
			
			System.out.println(" 답글 재배치 완료 ! ");

			//답글 쓰기
			sql="insert into info_board "
					+"(num, subject, content, id, readcount, reg_date, re_ref, re_lev, re_seq) values(?,?,?,?,?,now(),?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getSubject());
			pstmt.setString(3, bb.getContent());
			pstmt.setString(4, bb.getId());
			pstmt.setInt(5, bb.getReadcount());
			pstmt.setInt(6, bb.getRe_ref()); //원글의 그룹 번호 사용
			pstmt.setInt(7, bb.getRe_lev()+1);
			pstmt.setInt(8, bb.getRe_seq()+1);
			
			pstmt.executeUpdate();
			
			System.out.println(" 답글 작성 완료! ");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	
	//@@@@@ board2 @@@@@
	
	// insertLog()
	public void insertLog(Board2Bean bb2) {

		int num = 0;

		try {

			System.out.println("bb2" + bb2);

			conn = getConnection();

			sql = "select max(num) from log_board";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				num = rs.getInt(1) + 1;
			}

			System.out.println(" 글번호  : " + num);

			sql = "insert into log_board values(?,?,?,?,?,?,?,now(),?,?,?)";
			// num, beans_type, sour_taste, bitter_taste, sweet_taste,
			// body_taste, id, date, content, place
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb2.getBeans_type());
			pstmt.setString(3, bb2.getSour_taste());
			pstmt.setString(4, bb2.getBitter_taste());
			pstmt.setString(5, bb2.getSweet_taste());
			pstmt.setString(6, bb2.getBody_taste());
			pstmt.setString(7, bb2.getId());
			pstmt.setString(8, bb2.getContent());
			pstmt.setString(9, bb2.getPlace());
			pstmt.setString(10, bb2.getFile());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}// insertLog()

	// getLogBoardCount()
	// 디비에 들어있는 글의 개수 계산후 리턴
	public int getLogBoardCount() {

		int cnt = 0;

		try {
			// 1,2 드라이버로드, 디비연결
			conn = getConnection();

			// 3 sql 작성(select) & pstmt 객체 생성
			sql = "select count(*) from log_board";
			pstmt = conn.prepareStatement(sql);

			// 4 sql 실행
			rs = pstmt.executeQuery();

			// 5 데이터 처리
			if (rs.next()) {
				cnt = rs.getInt(1);// "count(*)"

			}

			System.out.println("SQL 구문 실행완료!");
			System.out.println(" 글 개수 : " + cnt + "개");

		} catch (Exception e) {
			System.out.println(" 게시판 글개수_에러 발생!! ");
			e.printStackTrace();
		} finally {
			// 자원해제
			closeDB();
		}

		return cnt;
	}// getLogBoardCount()

	// getLogBoardList()
	@SuppressWarnings("unchecked")
	public ArrayList getLogBoardList() {

		ArrayList LogBoardListAll = new ArrayList();

		Board2Bean bb2 = null;

		try {

			conn = getConnection();

			sql = "select * from log_board";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				bb2 = new Board2Bean();

				bb2.setNum(rs.getInt("num"));
				bb2.setBeans_type(rs.getString("beans_type"));
				bb2.setSour_taste(rs.getString("sour_taste"));
				bb2.setBitter_taste(rs.getString("bitter_taste"));
				bb2.setSweet_taste(rs.getString("sweet_taste"));
				bb2.setBody_taste(rs.getString("body_taste"));
				bb2.setId(rs.getString("id"));
				bb2.setDate(rs.getDate("date"));

				LogBoardListAll.add(bb2);

			} // while 끝

			System.out.println(" 게시판 모든정보 저장완료! ");
			System.out.println(" 총 " + LogBoardListAll.size() + "개");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return LogBoardListAll;
	}
	// LogBoardListAll()

	// getLogBoard(num으로 DB불러오기)
	public Board2Bean getLogBoard(int num) {
		Board2Bean bb2 = null;
		try {

			conn = getConnection();
			sql = "select * from log_board where num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bb2 = new Board2Bean();

				bb2.setNum(rs.getInt("num"));
				bb2.setBeans_type(rs.getString("beans_type"));
				bb2.setSour_taste(rs.getString("sour_taste"));
				bb2.setBitter_taste(rs.getString("bitter_taste"));
				bb2.setSweet_taste(rs.getString("sweet_taste"));
				bb2.setBody_taste(rs.getString("body_taste"));
				bb2.setId(rs.getString("id"));
				bb2.setDate(rs.getDate("date"));
				bb2.setPlace(rs.getString("place"));
				bb2.setFile(rs.getString("file"));
				bb2.setContent(rs.getString("content"));
			}

			System.out.println(" 글번호에 해당하는 글정보 저장완료! ");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return bb2;
	} // getLogBoard(num)

	// getLogBoardList(startRow,pageSize)
	public ArrayList<Board2Bean> getLogBoardList(int startRow, int pageSize) {
		// DB데이터 1row 정보를 BoardBean 저장 -> ArrayList 한칸에 저장

		// 게시판의 글정보를 원하는만큼 저장하는 가변길이 배열
		ArrayList<Board2Bean> LogBoardList = new ArrayList<Board2Bean>();

		// 게시판 글 1개의 정보를 저장하는 객체
		Board2Bean bb2 = null;

		try {
			// 1,2 드라이버로드, 디비연결
			conn = getConnection();

			// sql
			sql = "select * from log_board order by num desc limit ?,?";

			pstmt = conn.prepareStatement(sql);

			// ?
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);

			// 4 sql 실행
			rs = pstmt.executeQuery();

			// 5 데이터처리
			while (rs.next()) {

				bb2 = new Board2Bean();

				// DB정보 -> Bean 저장
				bb2.setNum(rs.getInt("num"));
				bb2.setBeans_type(rs.getString("beans_type"));
				bb2.setSour_taste(rs.getString("sour_taste"));
				bb2.setBitter_taste(rs.getString("bitter_taste"));
				bb2.setSweet_taste(rs.getString("sweet_taste"));
				bb2.setBody_taste(rs.getString("body_taste"));
				bb2.setId(rs.getString("id"));
				bb2.setDate(rs.getDate("date"));

				// Bean -> ArrayList 한칸에 저장
				LogBoardList.add(bb2);

			} // while 끝

			System.out.println(" 게시판 모든정보 저장완료! ");
			System.out.println(" 총 " + LogBoardList.size() + "개");

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDB();
		}

		return LogBoardList;
	}// getBoardList(startRow,pageSize)

	// updateWriteLog()
	public void updateWriteLog(Board2Bean bb2) {

		try {
			conn = getConnection();
			sql = "update log_board set beans_type=?, sour_taste=?, bitter_taste=?, sweet_taste=?, "
					+ " body_taste=?, id=?, date=now(), content=?, place=?, file=? where num=?";
			// num, beans_type, sour_taste, bitter_taste, sweet_taste,
			// body_taste, id, date, content, place

			pstmt = conn.prepareStatement(sql);
			System.out.println(bb2);

			pstmt.setString(1, bb2.getBeans_type());
			pstmt.setString(2, bb2.getSour_taste());
			pstmt.setString(3, bb2.getBitter_taste());
			pstmt.setString(4, bb2.getSweet_taste());
			pstmt.setString(5, bb2.getBody_taste());
			pstmt.setString(6, bb2.getId());
			pstmt.setString(7, bb2.getContent());
			pstmt.setString(8, bb2.getPlace());
			pstmt.setString(9, bb2.getFile());
			pstmt.setInt(10, bb2.getNum());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}// updateWriteLog()

	// WriteLogDelete
	public void WriteLogDelete(int num) {
		try {
			conn = getConnection();
			sql = "delete from log_board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}

}// BoardDAO
