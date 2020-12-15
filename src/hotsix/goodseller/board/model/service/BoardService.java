package hotsix.goodseller.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.board.model.dao.BoardDAO;
import hotsix.goodseller.board.model.vo.Board;
import hotsix.goodseller.board.model.vo.BoardPageData;
import hotsix.goodseller.common.JDBCTemplate;

public class BoardService {
	BoardDAO boardDAO = new BoardDAO();
	
	public BoardPageData selectAllListPage(int currentPage) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordPerPage = 1;
		ArrayList<Board> list = boardDAO.selectAllListPage(conn, currentPage, recordPerPage);
		
		int naviCountPerPage = 5;
		String pageNavi = boardDAO.getpageNavi(conn,currentPage,recordPerPage,naviCountPerPage);
		
		BoardPageData bpd = new BoardPageData();
		bpd.setList(list);
		bpd.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return bpd;
		
	}
	
	public int writeBoard(String userId, String subject, String content) {
		Connection conn = JDBCTemplate.getConnection();
		int result = boardDAO.writeBoard(conn, userId, subject, content);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	public void updateHit(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = boardDAO.updateHit(conn, boardNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
	}
	
	public Board postOneClick(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		Board board = boardDAO.postOneClick(conn, boardNo);
		return board;
	}

	public int boardDelete(int boardNo, String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = boardDAO.boardDelete(conn, boardNo, userId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	
}
