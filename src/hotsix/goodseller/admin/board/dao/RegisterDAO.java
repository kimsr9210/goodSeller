package hotsix.goodseller.admin.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.board.model.vo.Register;

public class RegisterDAO {

	public ArrayList<Register> selectRegisterAllListPage(Connection conn, int currentPage, int recordPerPage,
			String selectBox, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Register> list = new ArrayList<Register>();

		int start = currentPage * recordPerPage - (recordPerPage - 1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by BOARDNO DESC) "
				+ "AS Row_Num,REG_BOARD.* FROM REG_BOARD) WHERE Row_Num between ? and ?";

		/* 검색 텍스트가 있을경우에만 실행 */
		if (searchText != null && !"".equals(searchText)) {
			if ("subject".equals(selectBox)) {
				query += "AND SUBJECT LIKE ?";
			}
			if ("content".equals(selectBox)) {
				query += "AND CONTENT LIKE ?";
			}
			if ("writer".equals(selectBox)) {
				query += "AND USERID = ?";
			}
		}

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			if (searchText != null && !"".equals(searchText)) {
				if (!"writer".equals(selectBox)) {
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

			if (rset.next()) // 게시글 한개가 잇다면 ~
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
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}
		return register;
	}
	public int postTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int postTotalCount = 0;

		String query = "SELECT COUNT(*) as totalCount " + "FROM REG_BOARD";

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

	public static int insertBoardComment(Connection conn, int boardNo, String comment, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO REG_COMMENT VALUES(BC_SEQ.NEXTVAL,?,?,?,SYSDATE,'N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			pstmt.setString(2, comment);
			pstmt.setString(3, userId);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
		
		
		
	}
}