package hotsix.goodseller.admin.board.qna.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import hotsix.goodseller.admin.board.qna.model.vo.BoardAnswer;
import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.board.model.vo.Board;
import hotsix.goodseller.user.board.model.vo.CsBoardAnswer;

public class BoardDAO {

	private int boardNo;
	private String userId;
	private String subject;
	private String boardContent;
	private int hit;
	private Date writeDate;
	private char postLockYN;
	private char answerYN;
	private char delYN;

	public static ArrayList<Board> csBoardAllListPage(Connection conn, int currentPage, int recordPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Board> list = new ArrayList<Board>();

		int start = currentPage * recordPerPage - (recordPerPage - 1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by writeDate) " + "AS Row_Num,CSBOARD.* "
				+ "FROM CSBOARD) WHERE Row_Num between ? and ?";

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
				board.setWriteDate(rset.getTimestamp("writeDate"));
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

	public static String getPageNavi(Connection conn, int currentPage, int recordPerPage, int naviCountPerPage) {
		// 현재 변수를 재확인
		// currentPage : 현재 페이지를 가지고 있는 변수
		// recordCountPrepage : 한 페이지당 보여질 게시물의 개수
		// naviCountPerPage : pageNavi가 몇개씩 보여질 것인지에 대한 갯수

		int postTotalCount = postTotalCount(conn); // 전체 게시물의 개수를 구하기 위한 메소드

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
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminReportAllPageList.do?currentPage="
					+ (startNavi - 1) + "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminReportAllPageList.do?currentPage="
						+ i + "'><b> " + i + " </b></a></li>");
			} else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminReportAllPageList.do?currentPage="
						+ i + "'> " + i + " </a></li>");
			}
		}
		if (endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminReportAllPageList.do?currentPage="
					+ (endNavi + 1) + "'> > </a></li>");
		}

		return sb.toString();

	}

	private static int postTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int postTotalCount = 0;

		String query = "SELECT COUNT(*) as totalCount " + "FROM REPORTTBL";

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

	public static Board CSOneClick(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;

		String query = "SELECT * FROM CSBOARD WHERE boardNo = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				board = new Board();
				board.setBoardNo(rset.getInt("boardNo"));
				board.setUserId(rset.getString("userId"));
				board.setSubject(rset.getString("subject"));
				board.setContent(rset.getString("content"));
				board.setHit(rset.getInt("hit"));
				board.setWriteDate(rset.getTimestamp("writeDate"));
				board.setPostLockYN(rset.getString("postLock_YN").charAt(0));
				board.setAnswerYN(rset.getString("answer_YN").charAt(0));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return board;
	}

	public static ArrayList<BoardAnswer> csBoardAnwser(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardAnswer answer = null;
		ArrayList<BoardAnswer> list = new ArrayList<BoardAnswer>();

		String query = "SELECT B.BOARDNO," + 
				"    B.ADMINID," + 
				"    B.SUBJECT," + 
				"    B.CONTENT," + 
				"    TO_CHAR(B.WRITEDATE,'YYYY-MM-DD HH24:MI:SS') AS WRITEDATE," + 
				"    B.COMMENTNO FROM CSBOARD A " + 
				"INNER JOIN CSBOARDANSWER B " + 
				"ON A.BOARDNO = B.BOARDNO " + 
				"WHERE A.BOARDNO = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				answer = new BoardAnswer();

				answer.setBoardNo(rset.getInt("boardNo"));
				answer.setAdminId(rset.getString("adminId"));
				answer.setSubject(rset.getString("subject"));
				answer.setContent(rset.getString("content"));
				answer.setWriteDate(rset.getString("writeDate"));

				list.add(answer);
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
	
	public static void insertAdminAnswerBoard(Connection conn, HttpServletRequest request) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "INSERT INTO CSBOARDANSWER (?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("boardNo")));
			pstmt.setString(2, request.getParameter("adminId"));
			pstmt.setString(3, request.getParameter("subject"));
			pstmt.setString(4, request.getParameter("content"));
			rset = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
	}
}
