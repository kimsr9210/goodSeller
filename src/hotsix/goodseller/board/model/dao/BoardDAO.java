package hotsix.goodseller.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.board.model.vo.Board;
import hotsix.goodseller.board.model.vo.Register;
import hotsix.goodseller.common.JDBCTemplate;

public class BoardDAO {

	public ArrayList<Board> selectAllListPage(Connection conn, int currentPage, int recordPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Board> list = new ArrayList<Board>();

		int start = currentPage * recordPerPage - (recordPerPage - 1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by BOARDNO DESC) " + "AS Row_Num,CSBOARD.* "
				+ "FROM CSBOARD WHERE DEL_YN='N') WHERE Row_Num between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Board board = new Board();
				board.setBoardNo(rset.getInt("boardNo"));
				board.setUserId(rset.getString("userId"));
				board.setSubject(rset.getString("subject"));
				board.setHit(rset.getInt("hit"));
				board.setWriteDate(rset.getDate("writeDate"));
				board.setPostLockYN(rset.getString("postLock_YN").charAt(0));
				board.setAnswerYN(rset.getString("answer_YN").charAt(0));

				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;

	}

	public int postTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int postTotalCount = 0;

		String query = "SELECT COUNT(*) as totalCount " + "FROM CSBOARD " + "WHERE DEL_YN='N'";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rset.next();
			postTotalCount = rset.getInt("totalCount");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return postTotalCount;
	}

	public String getpageNavi(Connection conn, int currentPage, int recordPerPage, int naviCountPerPage) {
		int postTotalCount = postTotalCount(conn);

		int pageTotalCount;
		if (postTotalCount % recordPerPage > 0) {
			pageTotalCount = postTotalCount / recordPerPage + 1;
		} else {
			pageTotalCount = postTotalCount / recordPerPage;
		}

		int startNavi = currentPage;
		int endNavi = startNavi + 4;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		StringBuilder sb = new StringBuilder();

		if (startNavi != 1) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/boardAllListPage.do?currentPage="
					+ (startNavi - 1) + "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/boardAllListPage.do?currentPage=" + i
						+ "'><b> " + i + " </b></a></li>");
			} else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/boardAllListPage.do?currentPage=" + i
						+ "'> " + i + " </a></li>");
			}
		}
		if (endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/boardAllListPage.do?currentPage="
					+ (endNavi + 1) + "'> > </a></li>");
		}

		return sb.toString();

	}

	public int writeBoard(Connection conn, String userId, String subject, String content, char postLockYN) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO CSBOARD VALUES(boardNo_seq.nextval, ?, ?, ?, default, default , ?, 'N', 'N' )";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, Character.toString(postLockYN));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;

	}

	// 조회수 증가 메소드
	public int updateHit(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "UPDATE CSBOARD SET hit = hit+1 where boardNo=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;

	}

	public Board postOneClick(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;

		String query = "SELECT * FROM CSBOARD WHERE BOARDNO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				board = new Board();

				board.setBoardNo(rset.getInt("boardNo"));
				board.setUserId(rset.getString("userId"));
				board.setSubject(rset.getString("subject"));
				board.setBoardContent(rset.getString("boardContent"));
				board.setHit(rset.getInt("hit"));
				board.setWriteDate(rset.getDate("writeDate"));
				board.setPostLockYN(rset.getString("postLock_YN").charAt(0));
				board.setAnswerYN(rset.getString("answer_YN").charAt(0));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return board;

	}

	public int boardDelete(Connection conn, int boardNo, String userId) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = "UPDATE CSBOARD SET DEL_YN='Y' WHERE boardNo=? AND userId=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;

	}

	public ArrayList<Board> boardSearchSubjectList(Connection conn, int currentPage, int recordPerPage,
			String searchText) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Board> list = new ArrayList<Board>();
		Board board = null;

		int start = currentPage * recordPerPage - (recordPerPage - 1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by BOARDNO DESC) " + "AS Row_Num,CSBOARD.* "
				+ "FROM CSBOARD WHERE SUBJECT LIKE ? AND DEL_YN='N') WHERE Row_Num between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searchText + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				board = new Board();

				board.setBoardNo(rset.getInt("boardNo"));
				board.setUserId(rset.getString("userId"));
				board.setSubject(rset.getString("subject"));
				board.setHit(rset.getInt("hit"));
				board.setWriteDate(rset.getDate("writeDate"));
				board.setPostLockYN(rset.getString("postLock_YN").charAt(0));
				board.setAnswerYN(rset.getString("answer_YN").charAt(0));

				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;

	}

	public ArrayList<Board> boardSearchContentList(Connection conn, int currentPage, int recordPerPage,
			String searchText) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Board> list = new ArrayList<Board>();
		Board board = null;

		int start = currentPage * recordPerPage - (recordPerPage - 1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by BOARDNO DESC) " + "AS Row_Num,CSBOARD.* "
				+ "FROM CSBOARD WHERE BOARDCONTENT LIKE ? AND DEL_YN='N') WHERE Row_Num between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searchText + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				board = new Board();

				board.setBoardNo(rset.getInt("boardNo"));
				board.setUserId(rset.getString("userId"));
				board.setSubject(rset.getString("subject"));
				board.setHit(rset.getInt("hit"));
				board.setWriteDate(rset.getDate("writeDate"));
				board.setPostLockYN(rset.getString("postLock_YN").charAt(0));
				board.setAnswerYN(rset.getString("answer_YN").charAt(0));

				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;

	}

	public ArrayList<Board> boardSearchWriterList(Connection conn, int currentPage, int recordPerPage,
			String searchText) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Board> list = new ArrayList<Board>();
		Board board = null;

		int start = currentPage * recordPerPage - (recordPerPage - 1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by BOARDNO DESC) " + "AS Row_Num,CSBOARD.* "
				+ "FROM CSBOARD WHERE USERID LIKE ? AND DEL_YN='N') WHERE Row_Num between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searchText + "%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				board = new Board();

				board.setBoardNo(rset.getInt("boardNo"));
				board.setUserId(rset.getString("userId"));
				board.setSubject(rset.getString("subject"));
				board.setHit(rset.getInt("hit"));
				board.setWriteDate(rset.getDate("writeDate"));
				board.setPostLockYN(rset.getString("postLock_YN").charAt(0));
				board.setAnswerYN(rset.getString("answer_YN").charAt(0));

				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int InsertRegister(Connection conn, String userId, String subject, String content, String reguserId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO REG_BOARD VALUES(REG_BOARD_SEQ.NEXTVAL, ?,?,?,?,SYSDATE,null)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, reguserId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;

	}

	public ArrayList<Register> selectRegisterAllListPage(Connection conn, int currentPage, int recordPerPage, String selectBox, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Register> list = new ArrayList<Register>();

		int start = currentPage * recordPerPage - (recordPerPage - 1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by BOARDNO DESC) "
				+ "AS Row_Num,REG_BOARD.* FROM REG_BOARD) WHERE Row_Num between ? and ?";
		
		/* 검색 텍스트가 있을경우에만 실행 */
		if(searchText != null && !"".equals(searchText)) {
			if("subject".equals(selectBox)) {
				query += "AND SUBJECT LIKE ?";
			}
			if("content".equals(selectBox)) {
				query += "AND CONTENT LIKE ?";
			}
			if("writer".equals(selectBox)) {
				query += "AND USERID = ?";
			}
		}
			
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			if(searchText != null && !"".equals(searchText)) {
				if(!"writer".equals(selectBox)) {
					pstmt.setString(3, "%" + searchText + "%");
				} else {
					pstmt.setString(3, searchText);
				}
			}

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Register regAll = new Register();
				regAll.setBoardNo(rset.getInt("boardNo"));
				regAll.setUserId(rset.getString("userId"));
				regAll.setSubject(rset.getString("subject"));
				regAll.setCreatedate(rset.getDate("createDate"));
				regAll.setBoardcomment(rset.getString("boardComment"));

				list.add(regAll);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;

	}

	public String regGetpageNavi(Connection conn, int currentPage, int recordPerPage, int naviCountPerPage) {
		int postTotalCount = postTotalCount(conn); // 전체 게시물의 개수를 구하기 위한 메소드

		int pageTotalCount; // 전체 페이지를 저장하는 변수
		if (postTotalCount % recordPerPage > 0) { // 나머지가 0 보다 크다면
			pageTotalCount = postTotalCount / recordPerPage + 1;
		} else {
			pageTotalCount = postTotalCount / recordPerPage;
		}

		int startNavi = currentPage;
		int endNavi = startNavi + 4;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		StringBuilder sb = new StringBuilder();

		// 만약 첫번째 pageVavi가 아니라면 '<'모양을 추가해라 (첫번째 pageNavi이면 추가하지 말아라)
		// 스타트네비가 1과 같지 않다면 1 2 3 4 5 추가하면안됨
		if (startNavi != 1) {
			sb.append("<a href='/registerAllList.do?currentPage=" + (startNavi - 1) + "'><</a> ");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) // 현재 페이지가 i와 같다면
			{
				sb.append("<a href='/registerAllList.do?currentPage=" + i + "'><b>" + i + "</b></a> "); // 볼드 추가
			} else {
				sb.append("<a href='/registerAllList.do?currentPage=" + i + "'>" + i + "</a> "); // 볼드빼기
			}
		}
		if (endNavi != pageTotalCount) // 만약 마지막 pageVavi가 아니라면 '>'모양을 추가해라 (마지막 pageNavi이면 추가하지 말아라)
		{
			sb.append("<a href='/registerAllList.do?currentPage=" + (endNavi + 1) + "'>></a> "); // 전페이지로 감
		}

		return sb.toString();

	}

	public Register RegisterOneClick(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Register register = null;
		
		String query = "SELECT * FROM REG_BOARD WHERE BOARDNO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) //게시글 한개가 잇다면 ~
			{
				register = new Register();
				register.setBoardNo(rset.getInt("boardNo"));
				register.setUserId(rset.getString("userId"));
				register.setSubject(rset.getString("subject"));
				
				register.setContent(rset.getString("content"));
				register.setReguserId(rset.getString("reguserId"));
				
				register.setCreatedate(rset.getDate("createDate"));
				register.setBoardcomment(rset.getString("boardComment"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		
	}return register;


}
}